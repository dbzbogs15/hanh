
package controller;

import dao.ShoppingCartDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;
import model.SanPham;
import model.User;

@WebServlet("/ShoppingCartController")
public class ShoppingCartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String action = request.getParameter("action");

        if (action == null) {
            response.sendRedirect("index.jsp");
        } else if (action.equals("MuaHang")) {
            String id = request.getParameter("id");
            HttpSession session = request.getSession();
            if(session.getAttribute("user")==null) {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                System.out.println("lỗi");
                return;
            }
            User u = (User) session.getAttribute("user");
            SanPham sp = new ShoppingCartDAO().getSanPhamMuHang(Integer.parseInt(id));

            String count = request.getParameter("count");
            String price = new ShoppingCartDAO().tinhGiaTienSanPhamTheoSoLuong(count, sp) + "";
            String orderID = new ShoppingCartDAO().randomOrderID(1000) + "";

            Order o = new Order(orderID, u.getUsername(), sp.getTensp(), count, price, u.getPhone());
            ShoppingCartDAO.mapOpenCart.put(o.getOrderID(), o);
            response.sendRedirect("giohang.jsp");
        } else if (action.equals("XuatDonHang")) {
            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("user");
            String orderID = new ShoppingCartDAO().randomOrderID(1000) + new ShoppingCartDAO().randomOrderID(1000) + "";
            Order o = new Order(orderID, u.getUsername(), new ShoppingCartDAO().getTongSanPhamMuaHang(), new ShoppingCartDAO().getTongSoLuongSanPhamMuaHang(), new ShoppingCartDAO().getTongGiaTienDonHang(), u.getPhone());
            new ShoppingCartDAO().addOrderToDTB(o);
            System.out.println(o.toString());
            ShoppingCartDAO.mapOpenCart.clear();
            response.sendRedirect("index.jsp");
        } else if (action.equals("Xoa")) {
            String id = request.getParameter("id");
            new ShoppingCartDAO().delete(id);
            response.sendRedirect("giohang.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

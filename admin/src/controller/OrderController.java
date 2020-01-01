package controller;

import model.Order;
import dao.OrderDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OrderController")
public class OrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        OrderDAO orderDao = new OrderDAO();
        boolean error = false;
        String action = request.getParameter("hidAction");
        if (action.equalsIgnoreCase("AddOrder")) {
            String mdh = request.getParameter("madh");
            String mdh_err = "";
            if (new OrderDAO().check(mdh)) {
                mdh_err = "Mã hóa đơn đã tồn tại !";
                request.setAttribute("madh_err", mdh_err);
            }
            if (mdh_err.length() > 0) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher(request.getContextPath() + "/donhang/addDonHang.jsp");
                rd.forward(request, response);
                return;
            }
            String tenkh = request.getParameter("tenkh");
            String tensp = request.getParameter("tensp");
            String count = request.getParameter("count");
            String sum = request.getParameter("sum");
            String sdt = request.getParameter("sdt");
            Order order = new Order(mdh, tenkh, tensp, count, sum, sdt, null);
            orderDao.add(order);
            response.sendRedirect("quanlidonhang.jsp");
        }
        if (action.equalsIgnoreCase("DeleteOrder")) {
            String madh = request.getParameter("madh");
            orderDao.delete(madh);
            response.sendRedirect(request.getContextPath() + "/quanlidonhang.jsp");
        }
        if (action.equalsIgnoreCase("EditOrder")) {
            String madh = request.getParameter("madh");
            ServletContext context = getServletContext();
            Order order = orderDao.getOrder(madh);
            context.setAttribute("order", order);
            response.sendRedirect("donhang/editDonHang.jsp");
        }
        if (action.equalsIgnoreCase("UpdateOrder")) {
            String key = request.getParameter("key");
            String madh = request.getParameter("madh");
            String tenkh = request.getParameter("tenkh");
            String tensp = request.getParameter("tensp");
            String count = request.getParameter("count");
            String sum = request.getParameter("sum");
            String sdt = request.getParameter("sdt");
            Order order = new Order(madh, tenkh, tensp, count, sum, sdt, null);
            orderDao.edit(order, madh);
            response.sendRedirect("quanlidonhang.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

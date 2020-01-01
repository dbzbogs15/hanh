/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.NhaCungCapImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.NhaCungCap;

/**
 *
 * @author HongThai
 */
public class NCCController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        NhaCungCapImpl dao = new NhaCungCapImpl();
        boolean error = false;
        String action = request.getParameter("hidAction");
        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
        if (action.equalsIgnoreCase("addNCC")) {
            String mancc = request.getParameter("mancc");
            String mancc_err = "";
            if (mancc == null || mancc.equals("")) {
                mancc_err = "Mã nhà cung cấp không được để trống!";
                request.setAttribute("mancc_err", mancc_err);
            }
            if (dao.check(mancc)) {
                mancc_err = "Mã nhà cung cấp đã tồn tại!";
                request.setAttribute("mancc_err", mancc_err);
            }
            String tenncc = request.getParameter("tenncc");
            String tenncc_err = "";
            if (tenncc == null || tenncc.equals("")) {
                tenncc_err = "Tên nhà cung cấp không được để trống!";
                request.setAttribute("tenncc_err", tenncc_err);
            }
            String diachi = request.getParameter("diachi");
            String diachi_err = "";
            if (diachi == null || diachi.equals("")) {
                diachi_err = "Địa chỉ không được để trống!";
                request.setAttribute("diachi_err", diachi_err);
            }
            String sdt = request.getParameter("sdt");
            String sdt_err = "";
            if (sdt == null || sdt.equals("")) {
                sdt_err = "Số điện thoại không được bỏ trống!";
                request.setAttribute("sdt_err", sdt_err);
            } else {
                Pattern kt_sdt = Pattern.compile("\\d*");
                Matcher matcher = kt_sdt.matcher(sdt);
                if (!matcher.matches()) {
                    sdt_err = "Số điện thoại không hợp lệ!";
                    request.setAttribute("sdt_err", sdt_err);
                }
            }
            if (mancc_err.length() > 0 || tenncc_err.length() > 0
                    || diachi_err.length() > 0 || sdt_err.length() > 0) {
                error = true;
            }
            if (error) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/nhacungcap/addNCC.jsp");
                rd.forward(request, response);
            } else {
                dao.add(new NhaCungCap(mancc, tenncc, diachi, sdt));
                response.sendRedirect(request.getContextPath() + "/quanlynhacungcap.jsp");
            }
        }
        if (action.equalsIgnoreCase("delNCC")) {
            String mancc = request.getParameter("mancc");
            dao.del(mancc);
            response.sendRedirect(request.getContextPath() + "/quanlynhacungcap.jsp");
        }
        if(action.equalsIgnoreCase("editNCC")) {
            String mancc = request.getParameter("mancc");
            NhaCungCap ncc = dao.getNhaCungCap(mancc);
            ServletContext context = getServletContext();
            context.setAttribute("ncc", ncc);
            response.sendRedirect(request.getContextPath()+"/nhacungcap/editNCC.jsp");
        }
        if(action.equalsIgnoreCase("updateNCC")) {
            String key = request.getParameter("key");
            String mancc = request.getParameter("mancc");
            String mancc_err = "";
            if(mancc == null || mancc.equals("")) {
                mancc_err = "Mã nhà cung cấp bản đã để trống!";
                request.setAttribute("mancc_err", mancc_err);
            }
            if(!mancc.equalsIgnoreCase(key)) {
                if(dao.check(mancc)) {
                    mancc_err = "Mã nhà cung cấp này đã tồn tại!";
                    request.setAttribute("mancc_err", mancc_err);
                }
            }
            String tenncc = request.getParameter("tenncc");
            String tenncc_err = "";
            if(tenncc == null || tenncc.equals("")) {
                tenncc_err = "Tên nhà cung cấp bạn đã để trống!";
                request.setAttribute("tenncc_err", tenncc_err);
            }
            String diachi = request.getParameter("diachi");
            String diachi_err = "";
            if(diachi == null || diachi.equals("")) {
                diachi_err = "Địa chỉ bạn đã để trống!";
                request.setAttribute("diachi_err", diachi_err);
            }
            String sdt = request.getParameter("sdt");
            String sdt_err = "";
            if(sdt == null || sdt.equals("")) {
                sdt_err = "Số điện thoại bạn đã để trống!";
                request.setAttribute("sdt_err", sdt_err);
            } else {
                Pattern kt_sdt = Pattern.compile("\\d*");
                Matcher matcher = kt_sdt.matcher(sdt);
                if(!matcher.matches()) {
                    sdt_err = "Số điện thoại vừa nhập không hợp lệ!";
                    request.setAttribute("sdt_err", sdt_err);
                }
            }
            if(mancc_err.length() > 0 || tenncc_err.length() > 0 ||
                    diachi_err.length() > 0 || sdt_err.length() > 0) {
                error = true;
            }
            if(error) {
                request.setAttribute("key", key);
                RequestDispatcher rd = getServletContext().getRequestDispatcher(request.getContextPath()+"/nhacungcap/editNCC.jsp");
                rd.forward(request, response);
            } else {
                dao.edit(new NhaCungCap(mancc, tenncc, diachi, sdt), key);
                response.sendRedirect(request.getContextPath()+"/quanlynhacungcap.jsp");
            }
        }
        if(action.equalsIgnoreCase("Cate")) {
            String mancc = request.getParameter("mancc");
            request.setAttribute("mancc", mancc);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/quanlisanpham.jsp");
            rd.forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

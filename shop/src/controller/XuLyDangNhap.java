/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAOimpl;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author HongThai
 */
@WebServlet("/XuLyDangNhap")
public class XuLyDangNhap extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        boolean error = false;
        String username = request.getParameter("username");
        String username_err = "";
        if (username == null || username.equals("")) {
            username_err = "UserName không được để trống!";
            request.setAttribute("username_err", username_err);
        }
        String password = request.getParameter("password");
        String password_err = "";
        if (password == null || password.equals("")) {
            password_err = "Password không được để trống!";
            request.setAttribute("password_err", password_err);
        }
        UserDAOimpl userDAOimpl = new UserDAOimpl();
        String log_err = "";
        if (username_err.equals("") && password_err.equals("") && userDAOimpl.kiemTraDangNhap(username, password) == false) {
            log_err = "UserName hoặc Password không đúng!";
            request.setAttribute("log_err", log_err);
        }
        System.out.println(!userDAOimpl.kiemTraDangNhap(username, password));
        if (username == null || username.equals("")
                || password == null || password.equals("")
                || !userDAOimpl.kiemTraDangNhap(username, password)) {
            error = true;
        }
        if (error) {
//            response.sendRedirect(request.getContextPath()+"/login.jsp");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        } else {
            HttpSession session = request.getSession();
            User user = userDAOimpl.infoUser(username);
            session.setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/logined.jsp");
//            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
//            rd.forward(request, response);
        }
    }
}

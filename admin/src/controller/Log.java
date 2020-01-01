/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin;


@WebServlet("/Log")
public class Log extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("logout")) {
            session.invalidate();
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
        if(action.equalsIgnoreCase("login")) {
        String username = request.getParameter("username");
        String pwd = request.getParameter("pwd");
        if (username.equals("admin1") && pwd.equals("nhom")) {
            session.setAttribute("user", new Admin(username, pwd));
            response.sendRedirect(request.getContextPath()+"/index.jsp");
            return;
        } else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher(request.getContextPath()+"/login.jsp");
            request.setAttribute("error", "Lỗi sai thông tin đăng nhập!");
            rd.forward(request, response);
        }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

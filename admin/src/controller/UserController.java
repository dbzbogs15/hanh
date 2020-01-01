/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
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
import model.User;

/**
 *
 * @author HongThai
 */
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("hidAction");
        UserDAO userDAO = new UserDAO();
        boolean error = false;
        if (action.equalsIgnoreCase("AddUser")) {
            String username = request.getParameter("username");
            String username_err = "";
            if (username == null || username.equals("")) {
                username_err = "Tài khoản không được để trống!";
                request.setAttribute("username_err", username_err);
            }
            if (userDAO.check(username)) {
                username_err = "Tài khoản đã tồn tại!";
                request.setAttribute("username_err", username_err);
            }
            String password = request.getParameter("password");
            String password_err = "";
            if (password == null || password.equals("")) {
                password_err = "Mật khẩu không được để trống!";
                request.setAttribute("password_err", password_err);
            }
            String email = request.getParameter("email");
            String email_err = "";
            if (email == null || email.equals("")) {
                email_err = "Email không được để trống!";
                request.setAttribute("email_err", email_err);
            }
            String phone = request.getParameter("phone");
            String phone_err = "";
            if (phone == null || phone.equals("")) {
                phone_err = "Số điện thoại không được để trống!";
                request.setAttribute("phone_err", phone_err);
            } else {
                Pattern Kt_phone = Pattern.compile("^[0-9]*$");
                Matcher matcher = Kt_phone.matcher(phone);
                if (!matcher.matches()) {
                    phone_err = "Số điện thoại không hợp lệ!";
                    request.setAttribute("phone_err", phone_err);
                }
            }
            String lname = request.getParameter("lname");
            String lname_err = "";
            if (lname == null || lname.equals("")) {
                lname_err = "Tên khách hàng không được để trống!";
                request.setAttribute("lname_err", lname_err);
            }
            String fname = request.getParameter("fname");
            String fname_err = "";
            if (fname == null || fname.equals("")) {
                fname_err = "Họ khách hàng không được để trống!";
                request.setAttribute("fname_err", fname_err);
            }
            String gioitinh = request.getParameter("gioitinh");
            if (username_err.length() > 0 || password_err.length() > 0
                    || email_err.length() > 0 || phone_err.length() > 0
                    || lname_err.length() > 0 || fname_err.length() > 0) {
                error = true;
            }
            if (error) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/khachhang/addUser.jsp");
                rd.forward(request, response);
            } else {
                userDAO.add(new User(username, password, email, phone, lname, fname, gioitinh));
                response.sendRedirect(request.getContextPath() + "/quanlykhachhang.jsp");
            }
        }
        if (action.equalsIgnoreCase("DelUser")) {
            String username = request.getParameter("username");
            userDAO.del(username);
            response.sendRedirect(request.getContextPath() + "/quanlykhachhang.jsp");
        }
        if (action.equalsIgnoreCase("EditUser")) {
            String username_key = request.getParameter("username");
            ServletContext context = getServletContext();
            User user = userDAO.getUser(username_key);
            context.setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/khachhang/editUser.jsp");
        }
        if (action.equalsIgnoreCase("UpdateUser")) {
            String key = request.getParameter("key");
            String username = request.getParameter("username");
            String username_err = "";
            if (username == null || username.equals("")) {
                username_err = "Tài khoản không được để trống!";
                request.setAttribute("username_err", username_err);
            }
            if (!key.equalsIgnoreCase(username)) {
                if (userDAO.check(username)) {
                    username_err = "Tài khoản đã nhập đã tồn tại!";
                    request.setAttribute("username_err", username_err);
                }
            }
            String password = request.getParameter("password");
            String password_err = "";
            if (password == null || password.equals("")) {
                password_err = "Mật khẩu không được để trống!";
                request.setAttribute("password_err", password_err);
            }
            String email = request.getParameter("email");
            String email_err = "";
            if (email == null || email.equals("")) {
                email_err = "Email không được để trống!";
                request.setAttribute("email_err", email_err);
            }
            String phone = request.getParameter("phone");
            String phone_err = "";
            if (phone == null || phone.equals("")) {
                phone_err = "Số điện thoại không được để trống!";
                request.setAttribute("phone_err", phone_err);
            } else {
                Pattern Kt_phone = Pattern.compile("^[0-9]*$");
                Matcher matcher = Kt_phone.matcher(phone);
                if (!matcher.matches()) {
                    phone_err = "Số điện thoại không hợp lệ!";
                    request.setAttribute("phone_err", phone_err);
                }
            }
            String lname = request.getParameter("lname");
            String lname_err = "";
            if (lname == null || lname.equals("")) {
                lname_err = "Tên khách hàng không được để trống!";
                request.setAttribute("lname_err", lname_err);
            }
            String fname = request.getParameter("fname");
            String fname_err = "";
            if (fname == null || fname.equals("")) {
                fname_err = "Họ khách hàng không được để trống!";
                request.setAttribute("fname_err", fname_err);
            }
            String gioitinh = request.getParameter("gioitinh");
            if (username_err.length() > 0 || password_err.length() > 0
                    || email_err.length() > 0 || phone_err.length() > 0
                    || lname_err.length() > 0 || fname_err.length() > 0) {
                error = true;
            }
            if(error) {
                ServletContext context = getServletContext();
                context.setAttribute("user", userDAO.getUser(key));
                RequestDispatcher rd = getServletContext().getRequestDispatcher(request.getContextPath()+"/khachhang/editUser.jsp");
                rd.forward(request, response);
            } else {
                userDAO.edit(new User(username, password, email, phone, lname, fname, gioitinh), key);
                response.sendRedirect(request.getContextPath()+"/quanlykhachhang.jsp");
            }
                
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

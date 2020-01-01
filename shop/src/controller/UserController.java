/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAOimpl;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author HongThai
 */
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("hidAction");
        if (action.equalsIgnoreCase("register")) {
            boolean error = false;
//		UserDAOimpl userDAOimpl = new UserDAOimpl();
            String username = request.getParameter("username");
            String username_err = "";
            if (username == null || username.equals("")) {
                username_err = "Tên đăng nhập không được để trống!";
                request.setAttribute("username_err", username_err);
            }
//		System.out.println(userDAOimpl.kiemTraTaiKhoan(username));
            String password = request.getParameter("password");
            String password_err = "";
            if (password == null || password.equals("")) {
                password_err = "Mật khẩu không được để trống!";
                request.setAttribute("password_err", password_err);
            }
            String repass = request.getParameter("repass");
            String repass_err = "";
            if (repass == null || repass.equals("")) {
                repass_err = "Nhập lại mật khẩu không được để trống!";
                request.setAttribute("repass_err", repass_err);
            } else {
                if (!repass.equals(password)) {
                    repass_err = "Mật khẩu nhập lại không trùng khớp!";
                    request.setAttribute("repass_err", repass_err);
                }
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
            }
            String lastname = request.getParameter("lastname");
            String lastname_err = "";
            if (lastname == null || lastname.equals("")) {
                lastname_err = "Tên không được bỏ trống!";
                request.setAttribute("lastname_err", lastname_err);
            }
            String firstname = request.getParameter("firstname");
            String firstname_err = "";
            if (firstname == null || firstname.equals("")) {
                firstname_err = "Họ không được để trống!";
                request.setAttribute("firstname_err", firstname_err);
            }
            UserDAOimpl userDAOimpl = new UserDAOimpl();
            if (userDAOimpl.kiemTraTaiKhoan(username)) {
                username_err = "Tên đăng nhập này đã có người đăng ký!";
                request.setAttribute("username_err", username_err);
            }
            String gioitinh = request.getParameter("gioitinh");
//            if (username == null || username.equals("") || password == null
//                    || password.equals("") || email == null || email.equals("")
//                    || repass == null || repass.equals("") || !repass.equals(password)
//                    || phone == null || phone.equals("") || lastname == null
//                    || lastname.equals("") || firstname == null || firstname.equals("")
//                    || userDAOimpl.kiemTraTaiKhoan(username) == true) {
//                error = true;
//            }
            if (username_err.length() > 0 || password_err.length() > 0
                    || email_err.length() > 0 || repass_err.length() > 0 || phone_err.length() > 0
                    || lastname_err.length() > 0 || firstname_err.length() > 0) {
                error = true;
            }
            if (error) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
                rd.forward(request, response);
            } else {
                User user = new User(username, password, email, phone, lastname, firstname, gioitinh);
                userDAOimpl.themTaiKhoan(user);
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect(request.getContextPath()+"/registed.jsp");

            }
        }
        if (action.equalsIgnoreCase("login")) {
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
            if (username_err.length() > 0 || password_err.length() > 0
                    || log_err.length() > 0) {
                error = true;
            }
            if (error) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
                rd.forward(request, response);
            } else {
                HttpSession session = request.getSession();
                User user = userDAOimpl.infoUser(username);
                session.setAttribute("user", user);
                System.out.println(user.toString());
                response.sendRedirect(request.getContextPath() + "/logined.jsp");
            }
        }
        if (action.equalsIgnoreCase("edit")) {
            UserDAOimpl userDAOimpl = new UserDAOimpl();
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String lname = request.getParameter("lname");
            String fname = request.getParameter("fname");
            String gioitinh = request.getParameter("sex");
            String pass = null;
            User u = new User();
            u.setUsername(username);
            u.setEmail(email);
            u.setFname(fname);

            ArrayList<User> listuser = new ArrayList<User>();
            UserDAOimpl dao = new UserDAOimpl();
            listuser = dao.getAlUser();
            for (int i = 0; i < listuser.size(); i++) {
                if (username.equals(listuser.get(i).getUsername())) {
                    pass = listuser.get(i).getPassword();
                }
            }
            u.setPassword(pass);
            u.setGioitinh(gioitinh);
            u.setLname(lname);
            u.setPhone(phone);
            userDAOimpl.edit(u, username);
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }

    }
}

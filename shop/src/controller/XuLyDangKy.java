package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAOimpl;
import javax.servlet.http.HttpSession;
import model.User;

/**
 * Servlet implementation class XuLyDangKy
 */
@WebServlet("/XuLyDangKy")
public class XuLyDangKy extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public XuLyDangKy() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
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
        if (username == null || username.equals("") || password == null
                || password.equals("") || email == null || email.equals("")
                || repass == null || repass.equals("") || !repass.equals(password)
                || phone == null || phone.equals("") || lastname == null
                || lastname.equals("") || firstname == null || firstname.equals("")
                || userDAOimpl.kiemTraTaiKhoan(username) == true) {
            error = true;
        }
        String gioitinh = request.getParameter("gioitinh");
        System.out.println(username == null);
        System.out.println(username.equals(""));
        System.out.println(password == null);
        System.out.println(password.equals(""));
        System.out.println(repass == null);
        System.out.println(repass.equals(""));
        System.out.println(!repass.equals(phone));
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();

        System.out.println(userDAOimpl.kiemTraTaiKhoan(username));
        System.out.println(error);
        if (error) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
            rd.forward(request, response);
        } else {
            User user = new User(username, password, email, phone, lastname, firstname, gioitinh);
            userDAOimpl.themTaiKhoan(user);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("/registed.jsp");

        }

    }

}

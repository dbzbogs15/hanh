package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SendMail;
import dao.UserDAO;
import dao.UserDAOimpl;
import model.User;

/**
 * Servlet implementation class XuLiQuenMatKhau
 */
@WebServlet("/XuLiQuenMatKhau")
public class XuLiQuenMatKhau extends HttpServlet {
	private static final long serialVersionUID = 1L;

	User user = new User();

	public XuLiQuenMatKhau() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String error = null;
		String email = request.getParameter("email");
		ArrayList<User> listuser = new ArrayList<User>();
		UserDAOimpl dao = new UserDAOimpl();
		listuser = dao.getAlUser();
		System.out.println(listuser.toString());
		HttpSession sesion = request.getSession();
		ServletContext contextEmail = getServletContext();

		boolean send = false;
		String pass = "";
		for (int i = 0; i < listuser.size(); i++) {
			if (email.equals(listuser.get(i).getEmail())) {
				send = true;
				pass = listuser.get(i).getPassword();
				break;
			} else {
				send = false;
				continue;
			}

		}
		if (send) {
			SendMail.sendMail(email, "Email khôi phục mật khẩu",
					"Chào bạn, mật khẩu khôi phục tài khoản là: " + pass);
			error = "Send sucess!";
			contextEmail.setAttribute("message", error);
		} else {
			error = "Email or username is not valid";
		}
		response.sendRedirect("QuenMatKhau.jsp");

	}
}

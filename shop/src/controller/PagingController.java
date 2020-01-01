package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryImpl;
import model.SanPham;

@WebServlet("/PagingController")
public class PagingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PagingController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer page = Integer.parseInt(request.getParameter("page")) - 1;
		List<SanPham> dsSanPham = new CategoryImpl().getAllSanPham();
		Integer totalSize = dsSanPham.size();
		Integer itemPerPage = 16;
		Integer totalPage = (totalSize % itemPerPage > 0) ? (totalSize / itemPerPage) + 1 : (totalSize / itemPerPage);
		List<SanPham> resultList = new ArrayList<SanPham>();
		if(page == null || page == 0) {
			resultList = dsSanPham.subList(0, itemPerPage);
		} else {
			resultList = dsSanPham.subList(itemPerPage * page, ((itemPerPage * page) + itemPerPage) > totalSize ? totalSize : ((itemPerPage * page) + itemPerPage));
		}
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("itemPerPage", itemPerPage);
		request.setAttribute("totalSize", totalSize);
		request.setAttribute("resultList", resultList);
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.SanPhamImpl;

import java.io.File;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.SanPham;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProductController extends HttpServlet {

	public static final String SAVE_DIRECTORY = "uploadDir";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("hidAction");
		SanPhamImpl sanPhamImpl = new SanPhamImpl();

		if (action.equalsIgnoreCase("AddSP")) {
			// Đường dẫn tuyệt đối tới thư mục gốc của web app.
			String appPath = request.getServletContext().getRealPath("");
			appPath = appPath.replace('\\', '/');

			// Thư mục để save file tải lên.
			String fullSavePath = null;
			if (appPath.endsWith("/")) {
				fullSavePath = appPath + SAVE_DIRECTORY;
			} else {
				fullSavePath = appPath + "/" + SAVE_DIRECTORY;
			}

			// Tạo thư mục nếu nó không tồn tại.
			File fileSaveDir = new File(fullSavePath);
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}

			String imgUrl = "";
			// Danh mục các phần đã upload lên (Có thể là nhiều file).
			for (Part part : request.getParts()) {
				String fileName = extractFileName(part);
				if (fileName != null && fileName.length() > 0) {
					String filePath = fullSavePath + "\\" + fileName;
					System.out.println("Write attachment to file: " + filePath);

					// Ghi vào file.
					part.write(filePath);
					imgUrl = "http://localhost:8080/admin/uploadDir/" + fileName;
				}
			}
			boolean error = false;
			String id = request.getParameter("id");
			String tensp = request.getParameter("tensp");
			String tensp_err = "";
			if (tensp == null || tensp.equals("")) {
				tensp_err = "Tên sản phẩm không được để trống!";
				request.setAttribute("tensp_err", tensp_err);
			}
			String giasp = request.getParameter("giasp");
			String giasp_err = "";
			if (giasp == null || giasp.equals("")) {
				giasp_err = "Giá sản phẩm không được để trống!";
				request.setAttribute("giasp_err", giasp_err);
			} else {
				Pattern Kt_giasp = Pattern.compile("^[0-9]*$");
				Matcher matcher = Kt_giasp.matcher(giasp);
				if (!matcher.matches()) {
					giasp_err = "Giá sản phẩm không hợp lệ!";
					request.setAttribute("giasp_err", giasp_err);
				}
			}
			String mota = request.getParameter("mota");
			String mota_err = "";
			if (mota.equals("") || mota == null) {
				mota_err = "Mô tả không được để trống!";
				request.setAttribute("mota_err", mota_err);
			}
			String ncc = request.getParameter("ncc");
			if (tensp_err.length() > 0 || giasp_err.length() > 0
					|| mota_err.length() > 0) {
				error = true;
			}
			if (error) {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/addsp.jsp");
				rd.forward(request, response);
			} else {
				SanPham sanPham = new SanPham(id, 2, tensp, "", Integer.parseInt(giasp), mota, ncc, imgUrl);
				sanPhamImpl.add(sanPham);
				HttpSession session = request.getSession();
				session.setAttribute("success", "Thêm sản phẩm thành công!");
				response.sendRedirect(request.getContextPath() + "/quanlisanpham.jsp");
			}
		}
		if (action.equalsIgnoreCase("DelSP")) {
			String masp = request.getParameter("masp");
			sanPhamImpl.delSP(masp);
			response.sendRedirect(request.getContextPath() + "/quanlisanpham.jsp");
		}
		if (action.equalsIgnoreCase("EditSP")) {
			String msp = request.getParameter("masp");
			SanPham sanPham = sanPhamImpl.getSanPham(msp);
			String id = sanPham.getId();
			String tensp = sanPham.getTensp();
			int giasp = sanPham.getGiasp();
			String mota = sanPham.getMota();
			String ncc = sanPham.getNcc();
			response.setContentType("text/html");
			ServletContext context = getServletContext();
			context.setAttribute("id", id);
			context.setAttribute("tensp", tensp);
			context.setAttribute("giasp", giasp);
			context.setAttribute("mota", mota);
			context.setAttribute("ncc", ncc);

			response.sendRedirect(request.getContextPath() + "/editsp.jsp");
		}
		if (action.equalsIgnoreCase("UpdateSP")) {
			String key = request.getParameter("key");
			boolean error = false;
			String id = request.getParameter("id");

			String masp = request.getParameter("masp");
			String masp_err = "";
			if (masp == null || masp.equals("")) {
				masp_err = "Mã sản phẩm bạn đã để trống!";
				request.setAttribute("masp_err", masp_err);
			}
			if (!key.equalsIgnoreCase(masp)) {
				if (sanPhamImpl.checkMasp(masp)) {
					masp_err = "Mã sản phẩm bạn vừa nhập đã tồn tại!";
					request.setAttribute("masp_err", masp_err);
				}
			}
			String tensp = request.getParameter("tensp");
			String tensp_err = "";
			if (tensp == null || tensp.equals("")) {
				tensp_err = "Tên sản phẩm bạn đã để trống!";
				request.setAttribute("tensp_err", tensp_err);
			}
			String giasp = request.getParameter("giasp");
			String giasp_err = "";
			if (giasp == null || giasp.equals("")) {
				giasp_err = "Giá sản phẩm không được để trống!";
				request.setAttribute("giasp_err", giasp_err);
			} else {
				Pattern Kt_giasp = Pattern.compile("^[0-9]*$");
				Matcher matcher = Kt_giasp.matcher(giasp);
				if (!matcher.matches()) {
					giasp_err = "Giá sản phẩm không hợp lệ!";
					request.setAttribute("giasp_err", giasp_err);
				}
			}
			String mota = request.getParameter("mota");
			String mota_err = "";
			if (mota == null || mota.equals("")) {
				mota_err = "Mô tả không được để trống!";
				request.setAttribute("mota_err", mota_err);
			}
			String ncc = request.getParameter("ncc");
			if (tensp_err.length() > 0 || giasp_err.length() > 0 || mota_err.length() > 0
					|| masp_err.length() > 0) {
				error = true;
			}

			if (error) {
				request.setAttribute("key", key);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/editsp.jsp");
				rd.forward(request, response);
			} else {
				SanPham sanPham = new SanPham(id, 2, tensp, "", Integer.parseInt(giasp), mota, ncc, "");
				sanPhamImpl.edit(sanPham, key);
				response.sendRedirect(request.getContextPath() + "/quanlisanpham.jsp");
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private String extractFileName(Part part) {
		// form-data; name="file"; filename="C:\file1.zip"
		// form-data; name="file"; filename="C:\Note\file2.zip"
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				// C:\file1.zip
				// C:\Note\file2.zip
				String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
				clientFileName = clientFileName.replace("\\", "/");
				int i = clientFileName.lastIndexOf('/');
				// file1.zip
				// file2.zip
				return clientFileName.substring(i + 1);
			}
		}
		return null;
	}
}

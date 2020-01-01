/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.SanPhamImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DBConnect;
import model.SanPham;

/**
 *
 * @author HongThai
 */
@WebServlet("/EditSP")
public class EditSP extends HttpServlet {

    String id;
    int masp;
    String tensp;
    String anhsp;
    int giasp;
    String mota;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String msp = request.getParameter("masp");
        SanPhamImpl sanPhamImpl = new SanPhamImpl();
        SanPham sanPham = sanPhamImpl.getSanPham(msp);
        id = sanPham.getId();
        masp = sanPham.getMasp();
        tensp = sanPham.getTensp();
        anhsp = sanPham.getAnhsp();
        giasp = sanPham.getGiasp();
        mota = sanPham.getMota();
        response.setContentType("text/html");
        ServletContext context = getServletContext();
        context.setAttribute("id", id);
        context.setAttribute("masp", masp);
        context.setAttribute("tensp", tensp);
        context.setAttribute("anhsp", anhsp);
        context.setAttribute("giasp", giasp);
        context.setAttribute("mota", mota);
        
        response.sendRedirect("/editsp.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.CategoryImpl;
import model.SanPham;

public class SearchController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String q = request.getParameter("q");
    	List<SanPham> dsSanPham = new CategoryImpl().getSanPhamByTenSP(q);
    	ObjectMapper objectMapper = new ObjectMapper();
        response.setContentType("application/json");
        objectMapper.writeValue(response.getOutputStream(), dsSanPham);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

   

}

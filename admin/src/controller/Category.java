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

/**
 *
 * @author HongThai
 */
@WebServlet("/Category")
public class Category extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String id = request.getParameter("id");
//        System.out.println(id);
//        HttpSession session = request.getSession();
//        session.setAttribute("id", id);
//        RequestDispatcher rd = getServletContext().getRequestDispatcher("/danhmuc.jsp");
//        rd.forward(request, response);
//    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println("123");
        System.out.println(id);
//        HttpSession session = request.getSession();
        request.setAttribute("id", id);
//        response.sendRedirect("/index.jsp");
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/quanlisanpham.jsp");
        rd.forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

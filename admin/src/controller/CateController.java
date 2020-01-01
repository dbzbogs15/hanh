/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Category;
import dao.CategoryImpl;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HongThai
 */
public class CateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        CategoryImpl categoryImpl = new CategoryImpl();
        boolean error = false;
        String action = request.getParameter("hidAction");
        if (action.equalsIgnoreCase("AddCate")) {
            String id = request.getParameter("id");
            String id_err = "";
            if (id == null || id.equals("")) {
                id_err = "Mã loại không được để trống!";
                request.setAttribute("id_err", id_err);
            }
            if (categoryImpl.check(id)) {
                id_err = "Mã sản phẩm đã tồn tại!";
                request.setAttribute("id_err", id_err);
            }
            String name = request.getParameter("name");
            String name_err = "";
            if (name == null || name.equals("")) {
                name_err = "Tên loại sản phẩm không được để trống!";
                request.setAttribute("name_err", name_err);
            }
            if (id_err.length() > 0 || name_err.length() > 0) {
                error = true;
            }
            if (error) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/category/addCategory.jsp");
                rd.forward(request, response);
            } else {
                categoryImpl.add(new Category(id, name));
                response.sendRedirect(request.getContextPath() + "/quanlyloaisanpham.jsp");
            }
        }
        if (action.equalsIgnoreCase("DelCate")) {
            String id = request.getParameter("id");
            categoryImpl.del(id);
            response.sendRedirect(request.getContextPath() + "/quanlyloaisanpham.jsp");
        }
        if (action.equalsIgnoreCase("EditCate")) {
            String get_id = request.getParameter("id");
            Category c = categoryImpl.getCategoryByID(get_id);
            ServletContext context = getServletContext();
            String id = c.getId();
            String name = c.getName();
            context.setAttribute("id", id);
            context.setAttribute("name", name);
            response.setContentType("text/html");
            response.sendRedirect(request.getContextPath() + "/category/EditCategory.jsp");
        }
        if (action.equalsIgnoreCase("UpdateCate")) {
            String key = request.getParameter("key");
            String id = request.getParameter("id");
            String id_err = "";
            if (id == null || id.equals("")) {
                id_err = "Mã loại bạn đã để trống!";
                request.setAttribute("id_err", id_err);
            }
            if (!id.equalsIgnoreCase(key)) {
                if(categoryImpl.check(id)) {
                    id_err = "Mã loại bạn vừa nhập đã tồn tại!";
                    request.setAttribute("id_err", id_err);
                }
            }
            String name = request.getParameter("name");
            String name_err = "";
            if(name == null || name.equals("")) {
                name_err = "Tên loại sản phẩm bạn vừa để trống!";
                request.setAttribute("name_err", name_err);
            }
            if(id_err.length() > 0 || name_err.length() > 0) {
                error = true;
            }
            if(error) {
                request.setAttribute("key", key);
                RequestDispatcher rd = getServletContext().getRequestDispatcher(request.getContextPath()+"/category/EditCategory.jsp");
                rd.forward(request, response);
            } else {
                categoryImpl.edit(new Category(id, name), key);
                response.sendRedirect(request.getContextPath()+"/quanlyloaisanpham.jsp");
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

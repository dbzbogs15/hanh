<%-- 
    Document   : giohang.jsp
    Created on : May 8, 2017, 11:44:01 AM
    Author     : NguyenLe
--%>
<%@page import="java.util.Map"%>
<%@page import="model.Order"%>
<%@page import="dao.ShoppingCartDAO"%>
<%@page import="model.SanPham"%>
<%@page contentType  = "text/html" pageEncoding = "UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Gio Hang</title>
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
              integrity="" crossorigin="anonymous">

        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
              integrity="" crossorigin="anonymous">

        <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="" crossorigin="anonymous"></script>
    </head>
    <body>
        <center>
            <div class="container" id="">
                <div class="row">
                    <!--  <table id="datatable-buttons" class="table table-striped table-bordered">-->
                    <center>
                        <h1>
                            Giỏ hàng

                        </h1>
                    </center>
                    <br>

                    <% Map<String, Order> mapGioHang = ShoppingCartDAO.mapOpenCart;%>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Số thứ tự</th>
                                <th>Tên khách hàng</th>
                                <th>Tên sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Giá tiền</th>
                                <th>Xóa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%int count = 0;
                                for (Order sp : mapGioHang.values()) {
                                    count++;%>
                            <tr>
                                <td><%out.print(sp.getOrderID());%></td>
                                <td><%out.print(sp.getCustomerUserName());%></td>
                                <td><%out.print(sp.getProductID());%></td>
                                <td><%out.print(sp.getCount());%></td>
                                <td><%out.print(sp.getPrice());%></td>
                                <td><a href="ShoppingCartController?action=Xoa&id=<%=sp.getOrderID()%>"><button class="btn btn-sm btn-danger">Xóa</button></a></td>

                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <p style="text-align: center">
                    <div class="col-lg-6 col-lg-push-3">
                        <div class="input-group">
                            <a href="index.jsp">Tiếp tục mua hàng</a>
                        </div>
                        <div class="input-group">
                            <a href="ShoppingCartController?action=XuatDonHang">Xuất đơn hàng</a>
                        </div>
                    </div>
                    </p>
                </div>
            </div>
        </center>

    </body>
</html>

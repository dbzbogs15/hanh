<%@page import="model.NhaCungCap"%>
<%@page import="dao.NhaCungCapImpl"%>
<%@page import="java.lang.String"%>
<%@page import="model.Category"%>
<%@page import="dao.SanPhamImpl"%>
<%@page import="model.SanPham"%>
<%@page import="dao.CategoryImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Sửa sản phẩm</title>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/full-width-pics.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
                <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
                <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
            <![endif]-->
        <script>
            /* When the user clicks on the button, 
             toggle between hiding and showing the dropdown content */
            function myFunction() {
                document.getElementById("myDropdown").classList.toggle("show");
            }

            // Close the dropdown menu if the user clicks outside of it
            window.onclick = function (event) {
                if (!event.target.matches('.dropbtn')) {

                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    var i;
                    for (i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.classList.contains('show')) {
                            openDropdown.classList.remove('show');
                        }
                    }
                }
            }
        </script>
        <style>
            .hid{
                visibility: hidden;
            }
            .phom{
                text-align:center;}
            h2{
                text-align: center;}
            .form-control {
                position: relative;
                height: auto;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                padding: 10px;
                font-size: 16px;
            }

            .form-control {
                max-width: 330px;
                padding: 15px;
                margin: 0 auto;
            }
        </style>

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <section>
            <div class="container">
                <div class="jumbotron">
                    <div class="row">
                        <h2>
                            Quản lý sản phẩm <span class="glyphicon glyphicon-cutlery"></span>
                        </h2>
                        <div class="phom">
                        <%ServletContext context = getServletContext();%>
                        <%if (request.getAttribute("masp") == null) {%>
                        <form class="form-horizontal" role="form" style="color: black" method="get" action="ProductController">
                            <input type="hidden" name="hidAction" value="UpdateSP">
                            <input type="hidden" name="key" value="<%out.print(context.getAttribute("masp"));%>">
                            Mã sản phẩm <input name="masp" type="text" value="<%out.print(context.getAttribute("masp"));%>"
                                               class="form-control">
                            <%
                                if (request.getAttribute("masp_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("masp_err") + "</font><br>");
                                }
                            %>
                            Tên sản phẩm <input name="tensp" type="text" value="<%out.print(context.getAttribute("tensp"));%>"
                                                class="form-control">
                            <%
                                if (request.getAttribute("tensp_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("tensp_err") + "</font><br>");
                                }
                            %>
                            Đường dẫn ảnh <input name="anhsp" type="text" value="<%out.print(context.getAttribute("anhsp"));%>"
                                                 class="form-control">
                            <%
                                if (request.getAttribute("anhsp_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("anhsp_err") + "</font><br>");
                                }
                            %>

                            Giá sản phẩm <input name="giasp" type="text" value="<%out.print(context.getAttribute("giasp"));%>"
                                                class="form-control">
                            <%
                                if (request.getAttribute("giasp_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("giasp_err") + "</font><br>");
                                }
                            %>
                            Mô tả <input name="mota" type="text" value="<%out.print(context.getAttribute("mota"));%>"
                                         class="form-control">
                            <%
                                if (request.getAttribute("mota_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("mota_err") + "</font><br>");
                                }
                            %>
                            Loại sản phẩm<select class="form-control" name="id">
                                <%CategoryImpl categoryImpl = new CategoryImpl();%>
                                <%String id = (String) context.getAttribute("id");%>
                                <%for (Category category : categoryImpl.getAllCategorys()) {%>
                                <option 
                                    <%if (category.getId().equalsIgnoreCase(id)) {%>
                                    selected <%}%>
                                    value="<%=category.getId()%>"><%=category.getName()%></option>
                                <%}%>
                            </select>
                            Nhà cung cấp<select class="form-control" name="ncc">
                                <%NhaCungCapImpl nhaCungCapImpl = new NhaCungCapImpl();%>
                                <%String mancc = (String) context.getAttribute("ncc");%>
                                <%for (NhaCungCap ncc : nhaCungCapImpl.getAllNhaCungCaps()) {%>
                                <option <%if (ncc.getMancc().equalsIgnoreCase(mancc)) {%>
                                    selected <%}%>
                                    value="<%out.print(ncc.getMancc());%>"><%out.print(ncc.getTenncc());%></option>
                                <%}%>
                            </select>
                            <br>
                            <input type="submit" class="btn btn-info" value="Sửa">

                            <a href="<%=request.getContextPath()%>/quanlisanpham.jsp" 
                               class="btn btn-info" style="color:white;">Quay lại
                            </a>
                        </form>
                        <%}%>
                        <%if (request.getAttribute("masp") != null) {%>
                        <%String key = (String) request.getAttribute("key");%>
                        <%SanPhamImpl dao = new SanPhamImpl();%>
                        <%SanPham sanPham = dao.getSanPham(key);%>
                        <form class="form-horizontal" role="form" style="color: black" method="get" action="ProductController">
                            <input type="hidden" name="hidAction" value="UpdateSP">
                            <input type="hidden" name="key" value="<%out.print(sanPham.getMasp());%>">
                            Mã sản phẩm <input name="masp" type="text" value="<%out.print(sanPham.getMasp());%>"
                                               class="form-control">
                            Tên sản phẩm <input name="tensp" type="text" value="<%out.print(sanPham.getTensp());%>"
                                                class="form-control">
                            <%
                                if (request.getAttribute("tensp_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("tensp_err") + "</font><br>");
                                }
                            %>
                            Đường dẫn ảnh <input name="anhsp" type="text" value="<%out.print(sanPham.getAnhsp());%>"
                                                 class="form-control">
                            <%
                                if (request.getAttribute("anhsp_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("anhsp_err") + "</font><br>");
                                }
                            %>

                            Giá sản phẩm <input name="giasp" type="text" value="<%out.print(sanPham.getGiasp());%>"
                                                class="form-control">
                            <%
                                if (request.getAttribute("giasp_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("giasp_err") + "</font><br>");
                                }
                            %>
                            Mô tả <input name="mota" type="text" value="<%out.print(sanPham.getMota());%>"
                                         class="form-control">
                            <%
                                if (request.getAttribute("mota_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("mota_err") + "</font><br>");
                                }
                            %>
                            Loại sản phẩm<select class="form-control" name="id">
                                <%CategoryImpl categoryImpl = new CategoryImpl();%>
                                <%for (Category category : categoryImpl.getAllCategorys()) {%>
                                <option 
                                    <%if (sanPham.getId().equalsIgnoreCase(category.getId())) {%>
                                    selected<%}%>
                                    value="<%out.print(category.getId());%>"><%out.print(category.getName());%></option>
                                <%}%>
                            </select>
                            Nhà cung cấp<select class="form-control" name="ncc">
                                <%NhaCungCapImpl nhaCungCapImpl = new NhaCungCapImpl();%>
                                <%String mancc = (String) context.getAttribute("ncc");%>
                                <%for (NhaCungCap ncc : nhaCungCapImpl.getAllNhaCungCaps()) {%>
                                <option <%if (ncc.getMancc().equalsIgnoreCase(mancc)) {%>
                                    selected <%}%>
                                    value="<%out.print(ncc.getMancc());%>"><%out.print(ncc.getTenncc());%></option>
                                <%}%>
                            </select><br>
                            <input type="submit" class="btn btn-info" value="Sửa">
                            <a href="<%=request.getContextPath()%>/quanlisanpham.jsp" class="btn btn-info" style="color:white;">Quay lại</a>
                        </form>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </section>




    <!-- Footer -->


    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</body>

</html>

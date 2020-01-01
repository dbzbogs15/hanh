<%@page import="model.Category"%>
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
        <title>Thêm loại sản phẩm</title>
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
        <jsp:include page="../header.jsp"></jsp:include>
        <script src="<%request.getContextPath();%>/js/bootstrap.min.js"></script>
        <script src="<%request.getContextPath();%>/js/jquery.js"></script>
            <!-- Content Section -->
        <section>
            <div class="container">
                <div class="jumbotron">
                    <div class="row">
                        <h2>
                            Thêm loại sản phẩm <span class="glyphicon glyphicon-cutlery"></span>
                        </h2>
                    <%ServletContext context = getServletContext();%>
                    <%if (request.getAttribute("key") == null) {%>
                    <div class="phom">
                        <form action="<%=request.getContextPath()%>/CateController" class="form-horizontal" role="form" style="color: black" method="GET">
                            <input type="hidden" name="hidAction" value="UpdateCate">
                            <input type="hidden" name="key" value="<%out.print(context.getAttribute("id"));%>">
                            Mã loại<input name="id" type="text"
                                          class="form-control" value="<%out.print(context.getAttribute("id"));%>">
                            Tên loại sản phẩm<input name="name" type="text"
                                                    class="form-control" value="<%out.print(context.getAttribute("name"));%>">
                            <br>
                            <input type="submit" class="btn btn-info" value="Sửa" style="color:white;">
                            <a href="<%=request.getContextPath()%>/quanlyloaisanpham.jsp" class="btn btn-info" style="color:white;">Quay lại</a>
                        </form>
                    </div>
                    <%}%>
                    <%if (request.getAttribute("key") != null) {%>
                    <%Category c = new CategoryImpl().getCategoryByID((String) request.getAttribute("key"));%>
                    <div class="phom">
                        <form action="<%=request.getContextPath()%>/CateController" class="form-horizontal" role="form" style="color: black" method="GET">
                            <input type="hidden" name="hidAction" value="UpdateCate">
                            <input type="hidden" name="key" value="<%out.print(c.getId());%>">
                            Mã loại<input name="id" type="text"
                                          class="form-control" value="<%out.print(c.getId());%>">
                            <%
                                if (request.getAttribute("id_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("id_err") + "</font><br>");
                                }
                            %>                                
                            Tên loại sản phẩm<input name="name" type="text"
                                                    class="form-control" value="<%out.print(c.getName());%>">
                            <%
                                if (request.getAttribute("name_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("name_err") + "</font><br>");
                                }
                            %>
                            <br>
                            <input type="submit" class="btn btn-info" value="Sửa" style="color:white;">
                            <a href="<%=request.getContextPath()%>/quanlyloaisanpham.jsp" class="btn btn-info" style="color:white;">Quay lại</a>
                        </form>
                    </div>
                    <%}%>

                </div>
            </div>
    </section>




    <!-- Footer -->


    <!-- jQuery -->
    <script src="<%request.getContextPath();%>/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%request.getContextPath();%>/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</body>

</html>

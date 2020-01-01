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
        <title>Thêm loại khách hàng</title>
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
                        Thêm khách hàng <span class="glyphicon glyphicon-cutlery"></span>
                    </h2>
                    <div class="phom">
                        <form action="<%=request.getContextPath()%>/UserController" class="form-horizontal" role="form" style="color: black" method="GET">
                            <input type="hidden" name="hidAction" value="AddUser">
                            Tài khoản<input name="username" type="text"
                                            class="form-control">
                            <%
                                if (request.getAttribute("username_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("username_err") + "</font><br>");
                                }
                            %>                                
                            Mật khẩu<input name="password" type="text"
                                           class="form-control">
                            <%
                                if (request.getAttribute("password_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("password_err") + "</font><br>");
                                }
                            %>
                            Email<input name="email" type="text"
                                        class="form-control">
                            <%
                                if (request.getAttribute("email_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("email_err") + "</font><br>");
                                }
                            %>
                            Số điện thoại<input name="phone" type="text"
                                                class="form-control">
                            <%
                                if (request.getAttribute("phone_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("phone_err") + "</font><br>");
                                }
                            %>
                            Họ khách hàng<input name="fname" type="text"
                                                class="form-control">
                            <%
                                if (request.getAttribute("fname_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("fname_err") + "</font><br>");
                                }
                            %>
                            Tên khách hàng<input name="lname" type="text"
                                                 class="form-control">
                            <%
                                if (request.getAttribute("lname_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("lname_err") + "</font><br>");
                                }
                            %>
                            Giới tính<select name="gioitinh" class="form-control">
                                <option value="Nam">Nam</option>
                                <option value="Nữ">Nữ</option>
                            </select>
                            <br>
                            <input type="submit" class="btn btn-info" value="Thêm" style="color:white;">
                            <a href="<%=request.getContextPath()%>/quanlykhachhang.jsp" class="btn btn-info" style="color:white;">Quay lại</a>
                        </form>
                    </div>

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

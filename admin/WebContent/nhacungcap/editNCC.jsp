<%@page import="model.NhaCungCap"%>
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
                        Cập nhật thông tin nhà cung cấp <span class="glyphicon glyphicon-cutlery"></span>
                    </h2>
                    <%ServletContext context = getServletContext();%>
                    <%NhaCungCap ncc = (NhaCungCap) context.getAttribute("ncc");%>
                    <div class="phom">
                        <form action="<%=request.getContextPath()%>/NCCController" class="form-horizontal" role="form" style="color: black" method="GET">
                            <input type="hidden" name="hidAction" value="updateNCC">
                            <input type="hidden" name="key" value="<%out.print(ncc.getMancc());%>">
                            Mã nhà cung cấp<input name="mancc" type="text"
                                                  class="form-control" value="<%out.print(ncc.getMancc());%>">
                            <%
                                if (request.getAttribute("mancc_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("mancc_err") + "</font><br>");
                                }
                            %>                                
                            Tên nhà cung cấp<input name="tenncc" type="text"
                                                   class="form-control" value="<%out.print(ncc.getTenncc());%>">
                            <%
                                if (request.getAttribute("tenncc_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("tenncc_err") + "</font><br>");
                                }
                            %>
                            Địa chỉ<input name="diachi" type="text"
                                                   class="form-control" value="<%out.print(ncc.getDiachi());%>">
                            <%
                                if (request.getAttribute("diachi_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("diachi_err") + "</font><br>");
                                }
                            %>
                            Số điện thoại<input name="sdt" type="text"
                                                   class="form-control" value="<%out.print(ncc.getSdt());%>">
                            <%
                                if (request.getAttribute("sdt_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("sdt_err") + "</font><br>");
                                }
                            %>
                            <br>
                            <input type="submit" class="btn btn-info" value="Sửa" style="color:white;">
                            <a href="<%=request.getContextPath()%>/quanlynhacungcap.jsp" class="btn btn-info" style="color:white;">Quay lại</a>
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

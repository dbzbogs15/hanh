<%@page import="model.NhaCungCap"%>
<%@page import="dao.NhaCungCapImpl"%>
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
        <title>Thêm tin tức</title>
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
            <!-- Content Section -->
        <section>
            <div class="container">
                <div class="jumbotron">
                    <div class="row">
                        <h2>
                            Thêm tin tức <span class="glyphicon glyphicon-cutlery"></span>
                        </h2>
                        <div class="phom">
                            <form action="ProductController" class="form-horizontal" role="form" style="color: black" method="GET">
                                <input type="hidden" name="hidAction" value="AddSP">
                                Mã tin tức<input name="masp" type="text"
                                                  class="form-control" placeholder="Mã bắt đầu bằng tt">
                            Tên tin tức<input name="tensp" type="text"
                                               class="form-control">
                            Ảnh<input name="anhsp" type="text"
                                               class="form-control">
                            Mô tả<input name="mota" type="text"
                                        class="form-control">
                            <br>
                            <input type="submit" class="btn btn-info" value="Thêm" style="color:white;">
                            <a href="quanlitintuc.jsp" class="btn btn-info" style="color:white;">Quay lại</a>
                        </form>
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

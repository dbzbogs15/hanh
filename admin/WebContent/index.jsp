
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
        <title>Admin Page</title>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
         <link href="<%request.getContextPath();%>/css/w3.css" rel="stylesheet">
        

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
                  .jumbotron {
                      margin-top: 100px;
                  }
              </style>


    </head>
    <body>

        <!-- Navigation -->
<!--    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
             Brand and toggle get grouped for better mobile display 
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> <span
                        class="icon-bar"></span> <span class="icon-bar"></span> <span
                        class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%request.getContextPath();%>/index.jsp"><span class="glyphicon glyphicon-home"></span> NHÓM 015</a>
            </div>
             Collect the nav links, forms, and other content for toggling 
            <div class="collapse navbar-collapse"
                 id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="<%request.getContextPath();%>/index.jsp">Trang chủ</a></li>

                    <li class="dropdown"><a class="dropdown-toggle"
                                            data-toggle="dropdown" href="quanlisanpham.jsp">Quản lý sản phẩm</a>
                        <ul class="dropdown-menu">
                            <li><a href="<%request.getContextPath();%>/quanlisanpham.jsp">Sản phẩm</a></li>
                            <li><a href="<%request.getContextPath();%>/quanlyloaisanpham.jsp">Loại sản phẩm</a></li>
                            <li><a href="<%request.getContextPath();%>/quanlynhacungcap.jsp">Nhà cung cấp</a></li>
                        </ul>
                    </li>



                    <li><a href="quanlykhachhang.jsp">Quản lý khách hàng</a></li>
                    <li><a href="<%request.getContextPath();%>/quanlidonhang.jsp">Quản lý đơn hàng</a></li>
                    <li class="dropdown"><a class="dropdown-toggle"
                                            data-toggle="dropdown" href="quanlisanpham.jsp">Thống kê</a>
                        <ul class="dropdown-menu">
                            <li><a href="<%request.getContextPath();%>/thongke/theongay.jsp">Theo ngày</a></li>
                            <li><a href="<%request.getContextPath();%>/thongke/theokhoangngay.jsp">Theo khoản ngày</a></li>
                            <li><a href="<%request.getContextPath();%>/thongke/theotuan.jsp">Theo tuần</a></li>
                            <li><a href="<%request.getContextPath();%>/thongke/theothang.jsp">Theo tháng</a></li>
                        </ul>
                    </li>
                </ul>



                <ul class="nav navbar-nav navbar-right">
                    <li><a href="http://2017-nhom015.azurewebsites.net"><span class="glyphicon glyphicon-globe"></span> Website</a></li>
                </ul>
            </div>
             /.navbar-collapse 
        </div>
    </nav>-->
<jsp:include page="header.jsp"></jsp:include>



    <!-- Content Section -->
    <section>
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="section-heading">Trang Admin</h1>
                        <h2>Xin chào Admin!</h2>
                        <a href="quanlykhachhang.jsp" class="btn btn-info" role="button"><span class="glyphicon glyphicon-user"></span> Quản lý khách hàng</a>
                        <a href="quanlisanpham.jsp" class="btn btn-info" role="button"><span class="glyphicon glyphicon-briefcase"></span> Quản lý sản phẩm</a>
                        <a href="quanlyloaisanpham.jsp" class="btn btn-info"><span class="glyphicon glyphicon-th-list"></span> Quản lý loại sản phẩm</a>
                        <a href="quanlynhacungcap.jsp" class="btn btn-info"><span class="glyphicon glyphicon-bishop"></span> Quản lý nhà cung cấp</a>
                        <a href="quanlidonhang.jsp" class="btn btn-info"><span class="glyphicon glyphicon-print"></span> Đơn hàng</a>

                    </div>
                </div>
            </div>
        </div>
    </section>




    <!-- Footer -->


    <!-- jQuery -->
<!--    <script src="js/jquery.js"></script>

     Bootstrap Core JavaScript 
    <script src="js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->

</body>

</html>

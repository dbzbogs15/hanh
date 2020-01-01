<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>NongLam Fast Food</title>
        <!-- BOOTSTRAP CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">

        <!-- Sign In Style -->
        <link href="css/Signin style.css" rel="stylesheet">
        <!-- AWESOME ICON FONT -->
        <link href="lib/awesome/css/font-awesome.min.css" rel="stylesheet">

        <!-- IMPORT FONT GOOGLE LINK -->
        <link
            href="http://fonts.googleapis.com/css?family=Roboto+Condensed:300italic,400italic,700italic,400,700,300&amp;subset=vietnamese,latin,latin-ext"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Oswald:400,700"
              rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->

        <link href="css/style2.css" rel="stylesheet">
        <!-- SLIDE CSS -->
        <link rel="stylesheet" href="lib/slider/default.css" type="text/css"
              media="screen" />
        <link rel="stylesheet" href="lib/slider/nivo-slider.css" type="text/css"
              media="screen" />
        <!-- Owl Carousel Assets -->
        <link href="lib/owlcarousel/owl.carousel.css" rel="stylesheet">
        <link href="lib/owlcarousel/owl.theme.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/css/style2.css">

        <style>
            .error {
                color: red;
            }
            .form-control {
                position: relative;
                height: auto;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                padding: 5px;
                padding-left: 15px;
                font-size: 14px;
                height: 30px;
                margin: 5px;
            }
        </style>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
  
            $('#form').bind({
                'submit': function() {
                    
                    if ($('#username').val()=='') {
                        $('#username_err').html('Bạn không được bỏ trống trường này!!!');
                        return false;
                    }
                    
                    if ($('#password').val()=='') {
                        $('#pass_err').html('Bạn không được bỏ trống trường này');
                        return false;
                    }
                    if ($('#repass').val()=='') {
                        $('#repass_err').html('Bạn không được bỏ trống trường này');
                        return false;
                    }
                   
                    return true;
                },
                'keydown': function() {
                    if ($('#username').val().length > 0) {
                        $('#username_err').html('');
                    }
                    if ($('#password').val().length > 0) {
                        $('#pass_err').html('');
                    }
                    if ($('#repass').val().length > 0) {
                        $('#repass_err').html('');
                    } 
    }
            });
            });
        
    </script>
    </head>
    <body>
        <%if (session.getAttribute("user") != null) {%>
        <jsp:forward page="header.jsp"></jsp:forward>
        <%}%>
    <header id="header">
        <div class="topbar">
            <div class="container">
                <div class="col-xs-12 col-sm-6 p0 hotline-top">
                    <img src="images/phone-24.png" alt="hotline" />
                    <p>
                        Điện thoại: <a href="tel:0123.456.789">0123.456.789</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="header">
            <div class="container">
                <div class="col-xs-12 col-md-4">
                    <div id="logo">
                        <a href=""><img src="images/mylogo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                    <div id="search">
                        <form action="" method="post">
                            <input type="text" name="txt_search" placeholder="Tìm món" />
                            <button type="submit" name="btn_search">
                                <i>Tìm kiếm</i>
                            </button>
                        </form>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                    <div class="cart">
                        <div class="discart">
                            <span class="mycart">Giỏ hàng:</span> <span
                                class="count_products_cart">0 sản phẩm</span>
                        </div>
                        <div class="top-cart-content">xxx</div>
                    </div>
                </div>
            </div>
        </div>
        <nav id="mainmenu" class="hidden-xs hidden-sm ">
            <div class="container">
                <ul class="x1">
                    <li><a href="index.jsp">Trang chủ</a></li>
                    <li><a href="">Các loại thức ăn</a> <i class="fa fa-caret-down"
                                                           aria-hidden="true"></i>
                        <ul class="drop2">
                            <li><a href="">Gà rán</a></li>
                            <li><a href="">Hamburger</a></li>
                            <li><a href="">Pizza</a></li>
                            <li><a href="">Tráng miệng</a></li>
                            <li><a href="">Thức uống</a> <i class="fa fa-angle-right"
                                                            aria-hidden="true"></i>
                                <ul class="drop3">
                                    <li><a href="">Thức uống nóng</a></li>
                                    <li><a href="">Thức uống đá</a></li>
                                    <li><a href="">Thức uống đá xay</a></li>
                                </ul></li>
                        </ul></li>
                    <li><a href="gioithieu.jsp">Giới thiệu</a></li>
                    <li><a href="diary.jsp">Nhật ký nhóm</a></li>
                    <li><a href="login.jsp">Đăng nhập</a><a
                            href="register.jsp">Đăng ký</a></li>
            </div>
        </nav> </header>
    <div id="home">
        <div class="container">

            <section id="main">
                <div id="left" class="col-xs-12 col-sm-4 col-md-3">
                    <div class="boxleft visible-xs">
                        <div class="titboxl dmspmobi">
                            <i class="fa fa-bars fa-x2 fa-lg" aria-hidden="true"></i> <span>Các
                                loại thức ăn</span>
                        </div>
                        <div class="ctboxleft">
                            <ul class="ulspmobi">
                                <li><a href="">Gà rán</a></li>
                                <li><a href="">Hamburger</a></li>
                                <li><a href="">Pizza</a></li>
                                <li><a href="">Tráng miệng</a></li>
                                <li><a href="">Thức uống</a> <span class="iconlist">icon</span>
                                    <ul class="mnboxl_1">
                                        <li><a href="">Thức uống nóng</a></li>
                                        <li><a href="">Thức uống đá</a></li>
                                        <li><a href="">Thức uống đá xay</a></li>
                                    </ul></li>
                            </ul>
                        </div>
                    </div>
                    <div class="boxleft hidden-xs">
                        <div class="ctboxleft qc">
                            <a href=""><img src="images/muahang.gif"></a>
                        </div>
                    </div>
                </div>
                <div id="maincontent" class="col-xs-12 col-sm-8 col-md-9">
                    <div class="boxmain spmoi">
                        <div class="tit-boxmain">
                            <h3>
                                <span>Đăng ký</span>
                            </h3>
                        </div>
                        <div class="jumbotron">
                            <form action="/XuLiLayLaiMatKhau" class="form-horizontal" id="form" role="form" style="color: black" method="post">
                               
                                <div class="form-group" style="text-align: center;">
                                    <div class="col-sm-8 col-sm-offset-2">
                                        <div style="font-size: 14px;">
                                            Tên đăng nhập</div>
                                        <input name="username" id="username" type="text" placeholder="Tên đăng nhập"
                                               class="form-control formc">
                                        <p id="username_err"></p>               

                                        <div style="font-size: 14px;">
                                            Mật khẩu mới</div>
                                        <input name="password" id="password" type="password" placeholder="Mật khẩu"
                                               class="form-control formc">
                                         <p id="pass_err"></p>
                                        <div style="font-size: 14px;">
                                            Nhập lại mật khẩu cũ</div>
                                        <input name="repass" id="repass" type="password" placeholder="Nhập lại mật khẩu cũ"
                                               class="form-control formc">
                                         <p id="repass_err"></p>
                                        </div>
                                        <button type="submit" class="btn btn-danger" style="color:#ffc300;">Ok!</button>
                                    </div>
                                 </form></div>
                           
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <footer id="footer">
        <div class="container">
            <div class="f1">
                <div class="col-xs-12 col-sm-2">
                    <div class="tit-boxmain">
                        <h3><span>NLU Fastfood</span></h3>
                    </div>
                    <div class="ct-boxft1">
                        <p><span>Chúng tôi chỉ bán hàng tiêu chuẩn</span></p>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-2">
                    <div class="tit-boxmain">
                        <h3><span>Về chúng tôi</span></h3>
                    </div>
                    <div class="ct-boxft1">
                        <ul>
                            <li><a href="gioithieu.jsp">Giới thiệu</a></li>
                            <li><a href="gioithieu.jsp">Chính sách & Quy định</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-2">
                    <div class="tit-boxmain">
                        <h3><span>Mạng xã hội</span></h3>
                    </div>
                    <div class="ct-boxft1">
                        <ul>
                            <li><a href="https://www.facebook.com/groups/175003962992605/">Facebook</a></li>
                            <li><a href="">Instagram<a></li>
                                        <li><a href="">Zalo</a></li>
                                        </ul>
                                        </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="tit-boxmain">
                                                <h3><span>Thành viên nhóm</span></h3>
                                            </div>
                                            <div class="ct-boxft1>">
                                                <ul>
                                                    <li><a href="https://www.facebook.com/profile.php?id=100005698398306&fref=ts">15130169 Ngô Hồng Thái</a></li>
                                                    <li><a href="https://www.facebook.com/tr.thien.3">15130176 Trần Quang Thiện</a></li>
                                                    <li><a href="https://www.facebook.com/profile.php?id=100010269430173&fref=ts">15130056 Trần Thị Hiền</a></li>
                                                    <li><a href="https://www.facebook.com/anhdinh.nguyen.144?fref=ts">15130033 Nguyễn Thị Anh Đình</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2">
                                            <div class="tit-boxmain">
                                                <h3><span>Giảng Viên</span></h3>
                                            </div>
                                            <div class="ct-boxft1">
                                                <ul>
                                                    <li><a href="">Mai Anh Thơ</a></li>
                                                    <li><a href="https://www.facebook.com/nga.tranthanh.9634?fref=ts">Trần Thị Thanh Nga</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        </div>
                                        </div>
                                        </footer>
                                        <div class="copyright">
                                            <div class="container">
                                                <p>
                                                    Copyright © 2016 <a href="http://themeviet.org/" target="_blank">Themeviet.org</a>.
                                                    All Rights Reserved.
                                                </p>
                                            </div>
                                        </div>
                                        <script
                                        src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
                                        <script type="text/javascript">
                                            $(".discart").hover(function () {
                                                $(".top-cart-content").css("display", "block");
                                            }, function () {
                                                $(".top-cart-content").css("display", "none");
                                            });
                                        </script>
                                        <script src="lib/slider/jquery.nivo.slider.pack.js"
                                        type="text/javascript"></script>
                                        <script type="text/javascript">
                                            $(window).load(function () {
                                                $('#slider').nivoSlider();
                                            });
                                        </script>

                                        <!-- Owl Carousel Assets -->
                                        <script src="lib/owlcarousel/owl.carousel.js"></script>
                                        <script>
                                            $(document).ready(function () {
                                                $("#slider-tintuc").owlCarousel({
                                                    autoPlay: 3000,
                                                    navigation: true,
                                                    slideSpeed: 300,
                                                    paginationSpeed: 400,
                                                    singleItem: true
                                                });
                                                $("#spmoi").owlCarousel({
                                                    autoPlay: 3000,
                                                    // items : 4,
                                                    //  itemsDesktop : [1199,3],
                                                    //  itemsDesktopSmall : [979,3],
                                                    //  itemsMobile : [768,2]
                                                    itemsCustom: [[0, 2], [600, 3], [1200, 4], ],
                                                });
                                            });
                                        </script>

                                        <script type="text/javascript">
                                            // hidden-show children menu
                                            $(document).ready(function () {
                                                //use event delegation since classes are changed dynamically
                                                $('.ulspmobi').on('click', '.iconlist', function () {
                                                    //remove the show class and assign hidden
                                                    $(this).toggleClass('iconlist1 iconlist');
                                                    //the subfield is a child of the parent not the next sibling
                                                    $(this).siblings('ul.mnboxl_1').show('slow');
                                                });
                                                $('.ulspmobi').on('click', '.iconlist1', function () {
                                                    $(this).toggleClass('iconlist1 iconlist');
                                                    $(this).siblings('ul.mnboxl_1').hide('slow');
                                                });
                                            });
                                        </script>
                                        </body>
                                        </html>
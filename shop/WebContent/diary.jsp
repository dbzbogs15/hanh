<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NongLam Fast Food</title>
 BOOTSTRAP CSS 
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">

 Sign In Style 
<link href="css/Signin style2.css" rel="stylesheet">
 AWESOME ICON FONT 
<link href="lib/awesome/css/font-awesome.min.css" rel="stylesheet">

 IMPORT FONT GOOGLE LINK 
<link
	href="http://fonts.googleapis.com/css?family=Roboto+Condensed:300italic,400italic,700italic,400,700,300&amp;subset=vietnamese,latin,latin-ext"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald:400,700"
	rel="stylesheet">

 HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries 
 WARNING: Respond.js doesn't work if you view the page via file:// 
[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]

<link href="css/style2.css" rel="stylesheet">
 SLIDE CSS 
<link rel="stylesheet" href="lib/slider/default.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="lib/slider/nivo-slider.css" type="text/css"
	media="screen" />
 Owl Carousel Assets 
<link href="lib/owlcarousel/owl.carousel.css" rel="stylesheet">
<link href="lib/owlcarousel/owl.theme.css" rel="stylesheet">
</head>
<body>
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
					<a href="index.jsp"><img src="images/mylogo.png" alt=""></a>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<div id="search">
					<form action="" method="post">
						<input type="text" name="txt_search" placeholder="Tìm món" />
						<button type="submit" name="btn_search">
							Tìm kiếm</i>
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
	</nav> </header>-->
<jsp:include page="header.jsp"></jsp:include>
	<div id="home">
		<div class="container">
			
			<section id="main">
			<div id="left" class="col-xs-12 col-sm-4 col-md-3">
				<div class="boxleft hidden-xs">
					<div class="ctboxleft qc">
						<div class="titboxl">
                            <i class="fa fa-map fa-x2 fa-lg" aria-hidden="true"></i>
                            <span>Tìm chúng tôi tại đây</span>
                            <div id="googleMap" style="width: 255px; height: 273px;">Google Map</div>

                        </div>
					</div>
				</div>
			</div>
			<div id="maincontent" class="col-xs-12 col-sm-8 col-md-9">
				<div class="boxmain spmoi">
					<div class="jumbotron">
						<img src="images/mylogo2.png" style="max-width: 50%; height: auto">
						<p>Liên hệ chúng tôi ↓</p>
                         <p></p>
					</div>
				</div>
			</div>
			</section>
		</div>
	</div>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript">
		$(".discart").hover(function() {
			$(".top-cart-content").css("display", "block");
		}, function() {
			$(".top-cart-content").css("display", "none");
		});
	</script>
	<script src="lib/slider/jquery.nivo.slider.pack.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(window).load(function() {
			$('#slider').nivoSlider();
		});
	</script>

	<!-- Owl Carousel Assets -->
	<script src="lib/owlcarousel/owl.carousel.js"></script>
	<script>
		$(document).ready(function() {
			$("#slider-tintuc").owlCarousel({
				autoPlay : 3000,
				navigation : true,
				slideSpeed : 300,
				paginationSpeed : 400,
				singleItem : true
			});
			$("#spmoi").owlCarousel({
				autoPlay : 3000,
				// items : 4,
				//  itemsDesktop : [1199,3],
				//  itemsDesktopSmall : [979,3],
				//  itemsMobile : [768,2]
				itemsCustom : [ [ 0, 2 ], [ 600, 3 ], [ 1200, 4 ], ],
			});
		});
	</script>

	<script type="text/javascript">
		// hidden-show children menu
		$(document).ready(function() {
			//use event delegation since classes are changed dynamically
			$('.ulspmobi').on('click', '.iconlist', function() {
				//remove the show class and assign hidden
				$(this).toggleClass('iconlist1 iconlist');
				//the subfield is a child of the parent not the next sibling
				$(this).siblings('ul.mnboxl_1').show('slow');
			});
			$('.ulspmobi').on('click', '.iconlist1', function() {
				$(this).toggleClass('iconlist1 iconlist');
				$(this).siblings('ul.mnboxl_1').hide('slow');
			});
		});
	</script>
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCMTQrFOi7UwnQH-ld2nY7jzE6tZr3vNJs&sensor=false"></script>
        <script type="text/javascript">
            var gmap = new google.maps.LatLng(10.872197, 106.792164);
            var marker;
            function initialize()
            {
                var mapProp = {
                    center: new google.maps.LatLng(10.872197, 106.792164),
                    zoom: 16,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };

                var map = new google.maps.Map(document.getElementById("googleMap")
                        , mapProp);

                var styles = [
                    {
                        featureType: 'road.arterial',
                        elementType: 'all',
                        stylers: [
                            {hue: '#fff'},
                            {saturation: 100},
                            {lightness: -48},
                            {visibility: 'on'}
                        ]
                    }, {
                        featureType: 'road',
                        elementType: 'all',
                        stylers: [

                        ]
                    },
                    {
                        featureType: 'water',
                        elementType: 'geometry.fill',
                        stylers: [
                            {color: '#adc9b8'}
                        ]
                    }, {
                        featureType: 'landscape.natural',
                        elementType: 'all',
                        stylers: [
                            {hue: '#809f80'},
                            {lightness: -35}
                        ]
                    }
                ];

                var styledMapType = new google.maps.StyledMapType(styles);
                map.mapTypes.set('Styled', styledMapType);

                marker = new google.maps.Marker({
                    map: map,
                    draggable: true,
                    animation: google.maps.Animation.DROP,
                    position: gmap
                });
                google.maps.event.addListener(marker, 'click', toggleBounce);
            }

            function toggleBounce() {

                if (marker.getAnimation() !== null) {
                    marker.setAnimation(null);
                } else {
                    marker.setAnimation(google.maps.Animation.BOUNCE);
                }
            }

            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
        <!--Script Google Map -->
</body>
</html>
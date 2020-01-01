<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("user") != null) {
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>
<html>
<head>
<jsp:include page="style.jsp"></jsp:include>
</head>
<jsp:include page="header.jsp"></jsp:include>
<div id="home">
	<div class="container">

		<section id="main">
			<div id="left" class="col-xs-12 col-sm-4 col-md-3">
				<div class="boxleft hidden-xs">
					<div class="ctboxleft qc">
						<a href=""><img src="images/banner.jpg"></a>
					</div>
				</div>
			</div>
			<div id="maincontent" class="col-xs-12 col-sm-8 col-md-9">
				<div class="boxmain spmoi">
					<div class="tit-boxmain">
						<h3>
							<span>Đăng nhập</span>
						</h3>
					</div>
					<div class="jumbotron">
						<form class="form-signin" id="login"
							action="<%=request.getContextPath()%>/UserController?hidAction=login"
							method="post">
							<h2 class="form-signin-heading">Xin mời đăng nhập</h2>
							<label for="username" class="sr-only">Tên đăng nhập</label>
							<%
								if (request.getAttribute("log_err") != null) {
									out.print("<div style=\"color: red;\">" + (String) request.getAttribute("log_err") + "</div>");
								}
							%>
							<input name="username" type="text" id="username"
								class="form-control formc" placeholder="Tên đăng nhập">
							<%
								if (request.getAttribute("username_err") != null) {
									out.print("<div style=\"color: red;\">" + (String) request.getAttribute("username_err") + "</div>");
								}
							%>

							<br> <label for="password" class="sr-only">Mật
								khẩu</label> <input name="password" type="password" id="password"
								class="form-control formc" placeholder="Mật khẩu">
							<%
								if (request.getAttribute("password_err") != null) {
									out.print("<div style=\"color: red;\">" + (String) request.getAttribute("password_err") + "</div>");
								}
							%>

							<div class="checkbox">
								<label> <input type="checkbox" value="remember-me">
									Remember me
								</label> <br>Chưa có tài khoản?<a href="register.jsp"> Nhấn vào
									đây</a> <br>Quên mật khẩu?<a href="QuenMatKhau.jsp"> Nhấn
									vào đây để lấy lại mật khẩu</a>
							</div>
							<div class="col-sm-5 col-sm-offset-4">
								<button class="btn btn-danger" type="submit"
									style="color: #ffc300;">Đăng nhập</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
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

	$('#login').validate({
		rules : {
			username : 'required',
			password : 'required'
		},
		messages : {
			username : 'Vui lòng nhập tên đăng nhập',
			password : 'Vui lòng nhập mật khẩu'
		}
	})
</script>
</body>
</html>
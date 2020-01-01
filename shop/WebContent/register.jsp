<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<jsp:include page="style.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("user") != null) {
	%>
	<jsp:forward page="index.jsp"></jsp:forward>
	<%
		}
	%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="home">
		<div class="container">

			<section id="main">
			<div id="maincontent" class="col-xs-12 col-sm-8 col-md-9">
				<div class="boxmain spmoi">
					<div class="tit-boxmain">
						<h3>
							<span>Đăng ký</span>
						</h3>
					</div>
					<div class="jumbotron">
						<form id="register"
							action="<%=request.getContextPath()%>/UserController?hidAction=register"
							class="form-horizontal" style="color: black" method="POST">
							<div class="form-group" style="text-align: center;">
								<div class="col-sm-8 col-sm-offset-2">
									<div style="font-size: 14px;">Tên đăng nhập</div>
									<input name="username" id="username" type="text"
										placeholder="Tên đăng nhập" class="form-control formc">
									<%
										if (request.getAttribute("username_err") != null) {
											out.print("<div class=\"error\">" + (String) request.getAttribute("username_err") + "</div>");
										}
									%>
									<p id="username_err"></p>

									<div style="font-size: 14px;">Mật khẩu</div>
									<input name="password" type="password" id="password"
										placeholder="Mật khẩu" class="form-control formc">
									<%
										if (request.getAttribute("password_err") != null) {
											out.print("<div class=\"error\">" + (String) request.getAttribute("password_err") + "</div>");
										}
									%>
									<div style="font-size: 14px;">Nhập lại mật khẩu</div>
									<input name="repass" type="password" id="repass"
										placeholder="Nhập lại mật khẩu" class="form-control formc">
									<%
										if (request.getAttribute("repass_err") != null) {
											out.print("<div class=\"error\">" + (String) request.getAttribute("repass_err") + "</div>");
										}
									%>
									<div style="font-size: 14px;">Email</div>
									<input name="email" type="email" id="email" placeholder="Email"
										class="form-control formc">
									<%
										if (request.getAttribute("username_err") != null) {
											out.print("<div class=\"error\">" + (String) request.getAttribute("username_err") + "</div>");
										}
									%>
									<div style="font-size: 14px;">Số điện thoại</div>
									<input name="phone" type="text" id="phone"
										placeholder="Số điện thoại" class="form-control formc">
									<%
										if (request.getAttribute("phone_err") != null) {
											out.print("<div class=\"error\">" + (String) request.getAttribute("phone_err") + "</div>");
										}
									%><div style="font-size: 14px;">Tên</div>
									<input name="lastname" id="lastname" type="text"
										placeholder="Tên" class="form-control formc">
									<%
										if (request.getAttribute("lastname_err") != null) {
											out.print("<div class=\"error\">" + (String) request.getAttribute("lastname_err") + "</div>");
										}
									%><div style="font-size: 14px;">Họ</div>
									<input name="firstname" id="firstname" type="text"
										placeholder="Họ" class="form-control formc">
									<%
										if (request.getAttribute("firstname_err") != null) {
											out.print("<div class=\"error\">" + (String) request.getAttribute("firstname_err") + "</div>");
										}
									%>
									<div style="font-size: 14px;">Giới Tính</div>
									<select name="gioitinh" class="form-control">
										<option value="Nam">Nam</option>
										<option value="Nữ">Nữ</option>
									</select>
									<div class="checkbox">
										<input type="checkbox" id="termsConditions"
											name="termsConditions" /> Tôi đồng ý <a href="#">NHỮNG ĐIỀU KHOẢN NÀY!</a>
											<label style="float: none;"
											for="termsConditions" class="error" generated="true"></label>
									</div>
									<input type="submit" value="Đăng ký!" class="btn btn-danger"
										style="color: #ffc300;">
								</div>
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
	</script>

	<script type="text/javascript">
		$("#register").validate({
			rules : {
				username : {
					required : true
				},
				password : {
					required : true
				},
				repass : {
					required : true
				},
				phone : {
					required : true,
					number: true,
					maxlength: 11,
					minlength: 10
				},
				email : {
					required : true,
					email: true
				},
				lastname : {
					required : true
				},
				firstname : {
					required : true
				},
				termsConditions : 'required'
			},
			messages : {
				username : {
					required : 'Tên đăng nhập không được để trống!'
				},
				password : {
					required : 'Mật khẩu không được để trống!'
				},
				repass : {
					required : 'Tên đăng nhập không được để trống!'
				},
				phone : {
					required : 'Số điện thoại không được để trống!',
					number: 'Số điện thoại không hợp lệ',
					maxlength: 'Số điện thoại không hợp lệ',
					minlength: 'Số điện thoại không hợp lệ'
				},
				email : {
					required : 'Email không được để trống!',
					email: 'Email không hợp lệ'
				},
				lastname : {
					required : 'Tên không được để trống!'
				},
				firstname : {
					required : 'Họ không được để trống!'
				},
				termsConditions: 'Vui lòng đồng ý các điều khoản'
			}
		});
	</script>
</body>
</html>
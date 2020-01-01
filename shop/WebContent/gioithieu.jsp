<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
	<div id="home">
		<div class="container">
			
			<section id="main">
			<div id="left" class="col-xs-12 col-sm-4 col-md-3">
				<div class="boxleft hidden-xs">
					<div class="ctboxleft qc">
						<img src="<%request.getContextPath();%>images/banner.jpg" style="
    height: 466px;
">
					</div>
				</div>
			</div>
			<div id="maincontent" class="col-xs-12 col-sm-8 col-md-9">
				<div class="boxmain spmoi">
					<div class="jumbotron">
						<img src="<%request.getContextPath();%>images/mylogo2.png" style="width:auto; height: auto;">
						<p>NLU Shoes là thương hiệu ảo được ra đời từ môn Lập trình web</p>
						<p>Template website sử dụng từ <a href="https://delta-shoes.bizwebvietnam.net/">Delta-shoes</a>. Xin cám ơn Themeviet!</p>
						<p>Hình ảnh sản phẩm được lấy từ những cửa hàng giày</p>
					</div>
				</div>
			</div>
			</section>
		</div>
	</div>
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
</body>
</html>
<%@page import="java.util.Random"%>
<%@page import="model.Category"%>
<%@page import="model.SanPham"%>
<%@page import="dao.CategoryImpl"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<footer id="footer">
  <div class="container">
    <div class="f1">
      <div class="col-xs-12 col-sm-2">
        <div class="tit-boxmain">
          <h3>
            <span>NLU Shoes</span>
          </h3>
        </div>
        <div class="ct-boxft1">
          <p>
            <span>Chúng tôi chỉ bán hàng tiêu chuẩn</span>
          </p>
        </div>
      </div>
      <div class="col-xs-12 col-sm-2">
        <div class="tit-boxmain">
          <h3>
            <span>Về chúng tôi</span>
          </h3>
        </div>
        <div class="ct-boxft1">
          <ul>
            <li><a href="<%=request.getContextPath()%>/gioithieu.jsp">Giới thiệu</a></li>
            <li><a href="<%=request.getContextPath()%>/gioithieu.jsp">Chính sách &amp; Quy định</a></li>
          </ul>
        </div>
      </div>
      <div class="col-xs-12 col-sm-2">
        <div class="tit-boxmain">
          <h3>
            <span>Mạng xã hội</span>
          </h3>
        </div>
        <div class="ct-boxft1">
          <ul>
            <li><a href="#">Facebook</a></li>
            <li><a href="">Instagram</a><a></a></li>
            <a> </a>
            <li><a></a><a href="">Zalo</a></li>
          </ul>
        </div>
      </div>
      <div class="col-xs-12 col-sm-3">
        <div class="tit-boxmain">
          <h3>
            <span>Thành viên nhóm</span>
          </h3>
        </div>
        <div class="ct-boxft1>">
          <ul>
            <li><a href="#">15130024 Trần Văn Đăng</a></li>
            <li><a href="#">16130380 Nguyễn Trung Hiếu</a></li>
          </ul>
        </div>
      </div>
      <div class="col-xs-12 col-sm-2">
        <div class="tit-boxmain">
          <h3>
            <span>Giảng Viên</span>
          </h3>
        </div>
        <div class="ct-boxft1">
          <ul>
            <li><a href=""></a></li>
            <li><a href=""></a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</footer>
<script type="text/javascript">
	$(".discart").hover(function() {
		$(".top-cart-content").css("display", "block");
	}, function() {
		$(".top-cart-content").css("display", "none");
	});
</script>
<script src="<%=request.getContextPath()%>/lib/slider/jquery.nivo.slider.pack.js" type="text/javascript"></script>
<script type="text/javascript">
	$(window).load(function() {
		$('#slider').nivoSlider();
	});
</script>
<script src="<%=request.getContextPath()%>/lib/owlcarousel/owl.carousel.js"></script>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script>
	$(document).ready(function() {
		$('#box-result').hide();
	})
	$('#box-result').focusout(function() {
		$('#box-result').hide();
	})
	$('#inputSearch').keyup(function() {
		var q = $('#inputSearch').val();
		if(q.length == 0) {
			$('#box-result').hide();
			return;
		}
		//Tìm kiếm sản phẩm
		
		var uri = 'http://localhost:8080/shop/SearchController';
		console.log(uri)
		$.ajax({
		url: uri,
		data: {
			q : q
		},
		dataType: 'json',
		success: function(data) {
			console.log(data)
			$('#box-result').empty();
			var size = data.length;
			if(size > 0) {
				$.each(data, function(index, item) {
					if(item.image == null) {
    					$('#box-result').append(
    							'<a href="${pageContext.servletContext.contextPath}/thongtinsanpham.jsp?txt_search='+item.masp+'" class="list-group-item"  style="display: flex; justify-content: start;">' +
    				            '<img alt="" src="${pageContext.request.contextPath}'+item.anhsp+'"' +
    				            'style="width: 50px; height: 50px; margin-right: 5px">' +
    				            '<p class="list-group-item-text">'+item.tensp+'<br>Giá: '+item.giasp.toLocaleString()+'</p>' +
    				          	'</a>')
					} else {
						console.log(item.image)
						$('#box-result').append(
						'<a href="${pageContext.servletContext.contextPath}/thongtinsanpham.jsp?txt_search='+item.masp+'" class="list-group-item"  style="display: flex; justify-content: start;">' +
			            '<img alt="" src="'+item.image+'"' +
			            'style="width: 50px; height: 50px; margin-right: 5px">' +
			            '<p class="list-group-item-text">'+item.tensp+'<br>Giá: '+item.giasp.toLocaleString()+'</p>' +
			          	'</a>')
					}
				})
				$('#box-result').show();
			} else if (size == 0 || $('#box-result').val() == null) {
				$('#box-result').hide()
			}
		}
	})
	})
	
</script>
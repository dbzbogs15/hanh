<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@page import="model.Category"%>
<%@page import="model.SanPham"%>
<%@page import="dao.CategoryImpl"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%if(request.getParameter("page") == null && request.getParameter("id") == null) response.sendRedirect(request.getContextPath()+"/PagingController?page=1");%>
<html>
<head>
<jsp:include page="style.jsp"></jsp:include>
</head>
<jsp:include page="header.jsp"></jsp:include>
<div id="home">
  <div class="container">
    <section id="featured">
      <div>
        <div class="slider-wrapper theme-default">
          <div id="slider" class="nivoSlider">
            <a href="#"><img src="images/slider_1.jpg" alt="" style="width: 100%; height: 100%" /></a> <a href="#"><img src="images/slider_2.jpg" alt=""
              style="width: 100%; height: 100%" /></a>
          </div>
        </div>
      </div>
      <div class="banner clearfix">
        <div class="col-xs-12 col-sm-6">
          <img src="images/banner2.jpg" alt="">
        </div>
        <div class="col-xs-12 col-sm-6">
          <img src="images/banner1.jpg" alt="">
        </div>
      </div>
    </section>
    <section id="main">
      <div id="left" class="col-xs-12 col-sm-4 col-md-3">
        <div class="boxleft hidden-xs">
          <div class="titboxl">
            <i class="fa fa-random fa-x2 fa-lg" aria-hidden="true"></i> <span>Sản phẩm bán chạy</span>
          </div>
          <div class="ctboxleft">
            <%
            	CategoryImpl categoryImpl = new CategoryImpl();
            %>
            <%
            	for (SanPham sanPham : categoryImpl.getAllSanPham()) {
            			Random rd = new Random();
            			boolean bl = rd.nextBoolean();
            			if (bl) {
            %>
            <div class="boxspl">
              <div class="col-xs-4 p0">
                <a href="${pageContext.servletContext.contextPath}/thongtinsanpham.jsp?txt_search=<%out.print(sanPham.getMasp());%>">
                    <%if(sanPham.getAnhsp() == null || sanPham.getAnhsp().isEmpty()) {%>
                      <img class="imgproduct" src="<%=sanPham.getImage()%>" height=600px width=600px>
                    <%} else {%>
                      <img class="imgproduct" src="<%=request.getContextPath()%><%=sanPham.getAnhsp()%>" height=600px width=600px>
                    <%}%>
                </a>
              </div>
              <div class="col-xs-8 p5">
                <div class="tit-boxspl">
                  <a href="<%=request.getContextPath()%>/thongtinsanpham.jsp?txt_search=<%=sanPham.getMasp()%>">
                    <%=sanPham.getTensp()%>
                  </a>
                </div>
                <div class="price-boxspl"><%=sanPham.getGiasp()%>
                  Đ
                </div>
              </div>
            </div>
            <%
            	}
            		
            	}
            %>
          </div>
        </div>
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
              <span>Sản phẩm mới</span>
            </h3>
          </div>
          <div class="ct-boxmain">
            <div class="row">
              <div id="spmoi" class="owl-carousel">
                <%
                	for (SanPham sanPham : categoryImpl.getAllSanPham()) {
                			Random rd = new Random();
                			boolean bl = rd.nextBoolean();
                			if (bl) {
                %>
                <div class="item">
                  <div class="boxsp">
                    <div class="imgsp">
                      <a href="<%=request.getContextPath()%>/thongtinsanpham.jsp?txt_search=<%out.print(sanPham.getMasp());%>">
                        <%if(sanPham.getAnhsp() == null || sanPham.getAnhsp().isEmpty()) {%>
                          <img class="imgproduct" src="<%=sanPham.getImage()%>" height=600px width=600px>
                        <%} else {%>
                          <img class="imgproduct" src="<%=request.getContextPath()%><%=sanPham.getAnhsp()%>" height=600px width=600px>
                        <%}%>
                      </a>
                      <div class="img-label">
                        <img src="">
                      </div>
                    </div>
                    <div class="namesp">
                      <a href="<%=request.getContextPath()%>/thongtinsanpham.jsp?txt_search=<%out.print(sanPham.getMasp());%>"> <%
 	out.print(sanPham.getTensp());
 %>
                      </a>
                    </div>
                    <div class="pricesp"><%=sanPham.getGiasp()%>
                      Đ
                    </div>
                    <div class="button-hd">
                      <a href="<%=request.getContextPath()%>/thongtinsanpham.jsp?txt_search=<%out.print(sanPham.getMasp());%>"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                      <a href="<%=request.getContextPath()%>/thongtinsanpham.jsp?txt_search=<%out.print(sanPham.getMasp());%>"><i class="fa fa-eye" aria-hidden="true"></i></a>
                    </div>
                  </div>
                </div>
                <%
                	}
                		
                	}
                %>
              </div>
            </div>
          </div>
        </div>
        <div class="boxmain">
          <div class="tit-boxmain">
            <h3>
              <%
              	String back = "";
              	String color = "";
              	String back1 = "";
              	String color1 = "";
              	String temp = "" + request.getAttribute("id");
              	if (request.getAttribute("id") == null) {
              		back = "#ff2d37";
              		color = "#ffffff";
              		back1 = "#ffffff";
              		color1 = "#ff2d37";
              	} else {
              		back = "#ffffff";
              		color = "#ff2d37";
              	}
              %>
              <a href="<%=request.getContextPath()%>/index.jsp"><button style="background:<%=back%>;color:<%=color%>;border: 2px solid #ff2d37;" class="btn btn-danger"
                  type="button">Tất cả</button></a>
              <%
              	for (Category category : categoryImpl.getAllCategorys()) {
              		if (temp.equalsIgnoreCase(category.getId())) {
              			back1 = "#ff2d37";
              			color1 = "#ffffff";
              		} else {
              			back1 = "#ffffff";
              			color1 = "#ff2d37";
              		}
              %>
              <a href="<%=request.getContextPath()%>/Category?id=<%=category.getId()%>"><button style="background:<%=back1%>;color:<%=color1%>;border: 2px solid #ff2d37;"
                  class="btn btn-danger" type="button">
                  <%
                  	out.print(category.getName());
                  %>
                </button></a>
              <%
              	}
              %>
            </h3>
          </div>
          <br>
          <div class="ct-boxmain row m0">
            <c:if test="${empty param.id}">
            <c:forEach items="${resultList}" var="item">
            <div class="col-xs-6 col-sm-4 col-md-3 p5">
              <div class="boxsp">
                <div class="imgsp">
                  <a href="${pageContext.servletContext.contextPath}/thongtinsanpham.jsp?txt_search=${item.masp}">
                    <c:if test="${empty item.anhsp}">
                      <img class="imgproduct" src="${item.image}" height=600px width=600px>
                    </c:if>
                    <c:if test="${not empty item.anhsp}">
                      <img class="imgproduct" src="${pageContext.servletContext.contextPath}${item.anhsp}" height=600px width=600px>
                    </c:if>
                  </a>
                  <div class="img-label">
                    <img src="">
                  </div>
                </div>
                <div class="namesp">
                  <a href="${pageContext.servletContext.contextPath}/thongtinsanpham.jsp?txt_search=${item.masp}">
                  ${item.tensp}</a>
                </div>
                <div class="pricesp">
                  ${item.giasp}Đ
                </div>
                <div class="button-hd">
                  <a href="<%=request.getContextPath()%>/thongtinsanpham.jsp?txt_search=${item.masp}"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                  <a href="<%=request.getContextPath()%>/thongtinsanpham.jsp?txt_search=${item.masp}"><i class="fa fa-eye" aria-hidden="true"></i></a>
                </div>
              </div>
            </div>
            </c:forEach>
            </c:if>
            <%
            if (request.getAttribute("id") != null) {
            	for (SanPham sanPham : categoryImpl.getSanPham(request.getAttribute("id").toString())) {
            %>
            <div class="col-xs-6 col-sm-4 col-md-3 p5">
              <div class="boxsp">
                <div class="imgsp">
                  <a href="<%=request.getContextPath()%>/thongtinsanpham.jsp?txt_search=<%out.print(sanPham.getMasp());%>">
                    <%if(sanPham.getAnhsp() == null || sanPham.getAnhsp().isEmpty()) {%>
                      <img class="imgproduct" src="<%=sanPham.getImage()%>" height=600px width=600px>
                    <%} else {%>
                      <img class="imgproduct" src="<%=request.getContextPath()%><%=sanPham.getAnhsp()%>" height=600px width=600px>
                    <%}%>
                  </a>
                  <div class="img-label">
                    <img src="">
                  </div>
                </div>
                <div class="namesp">
                  <a href="<%=request.getContextPath()%>/thongtinsanpham.jsp?txt_search=<%out.print(sanPham.getMasp());%>"><%=sanPham.getTensp()%></a>
                </div>
                <div class="pricesp"><%=sanPham.getGiasp()%>
                  Đ
                </div>
                <div class="button-hd">
                  <a href="<%=request.getContextPath()%>/thongtinsanpham.jsp?txt_search=<%out.print(sanPham.getMasp());%>"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                  <a href="<%=request.getContextPath()%>/thongtinsanpham.jsp?txt_search=<%out.print(sanPham.getMasp());%>"><i class="fa fa-eye" aria-hidden="true"></i></a>
                </div>
              </div>
            </div>
            <%
            	}
            		
            	}
            %>
            <c:if test="${totalPage != null}">
            <ul class="pagination">
            <c:forEach var="i" begin="1" end="${totalPage}">
              <c:choose>
                <c:when test="${i == param.page}">
                  <li class="active"><a href="${pageContext.servletContext.contextPath}/PagingController?page=${i}">${i}</a></li>
                </c:when>
                <c:when test="${0 == param.page and 1 == i}">
                  <li class="active"><a href="${pageContext.servletContext.contextPath}/PagingController?page=${i}">${i}</a></li>
                </c:when>
              <c:otherwise>
                <li><a href="${pageContext.servletContext.contextPath}/PagingController?page=${i}">${i}</a></li>
               </c:otherwise>
              </c:choose>
            </c:forEach>
            </ul>
            </c:if>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
</body>
</html>
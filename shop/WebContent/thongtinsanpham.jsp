<%@page import="dao.SanPhamDAO"%>
<%@page import="model.SanPham"%>
<%@page import="dao.CategoryImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <%@include file="style.jsp" %>
        <style>
            .jumbotron{
                text-align: center;
            }</style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div id="home">
                <div class="container">

                    <section id="main">
                        <div id="left" class="col-xs-12 col-sm-4 col-md-3">
                            <div class="boxleft hidden-xs">
                                <div class="ctboxleft qc">
                                    <a href=""><img src="<%=request.getContextPath()%>/images/banner.jpg"></a>
                                </div>
                            </div>
                        </div>
                        <div id="maincontent" class="col-xs-12 col-sm-8 col-md-9">
                            <div class="boxmain spmoi">
                                <div class="jumbotron">
                                <%CategoryImpl categoryImpl = new CategoryImpl();%>
                                <%SanPham sanPham = categoryImpl.getSanPhamByMaSP(Integer.parseInt(request.getParameter("txt_search")));%>
                                <%if(sanPham.getTensp()==null){
                                	response.sendRedirect(request.getContextPath()+"/index.jsp");
                                }	%>
                                
                                <h1>Thông tin sản phẩm</h1>
                                <%if(sanPham.getAnhsp() == null || sanPham.getAnhsp().isEmpty()) {%>
                                  <img class="imgproduct" src="<%=sanPham.getImage()%>" height=600px width=600px>
                                <%} else {%>
                                  <img class="imgproduct" src="<%=request.getContextPath()%><%=sanPham.getAnhsp()%>" style="max-width: 50%; height: auto">
                                <%}%>
                                <p>Tên sản phẩm: <%request.getContextPath();%><%out.print(sanPham.getTensp());%></p>
                                <p>Giá: <%out.print(sanPham.getGiasp());%></p>
                                <p>Mô tả: <%out.print(sanPham.getMota());%></p>
                                <a href="<%=request.getContextPath()%>/ShoppingCartController?action=MuaHang&id=<%out.print(sanPham.getMasp());%>&count=1"class="btn btn-lg btn-success">Đặt hàng</a>
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
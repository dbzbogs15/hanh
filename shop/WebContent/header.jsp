<%@page import="model.Category"%>
<%@page import="model.SanPham"%>
<%@page import="dao.CategoryImpl"%>
<%@page import="model.User"%>
<%@page import="java.util.Map"%>
<%@page import="model.Order"%>
<%@page import="dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header id="header">
<div class="topbar">
  <div class="container">
    <div class="col-xs-12 col-sm-6 p0 hotline-top">
      <img src="<%=request.getContextPath()%>/images/phone-24.png" alt="hotline" />
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
        <a href="index.jsp"><img src="<%=request.getContextPath()%>/images/mylogo2.png" alt=""></a>
      </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-4">
      <div id="search">
        <form action="thongtinsanpham.jsp" method="get">
          <input type="text" name="txt_search" id="inputSearch" placeholder="Tìm sảm phẩm" />
          <button type="submit">
            <i>Tìm kiếm</i>
          </button>
        </form>
        <div id="box-result" class="list-group" style="position: absolute; width: 100%; z-index: 999; max-height: 300px; overflow: scroll; ;">
        </div>
      </div>
    </div>
    <%
    	Map<String, Order> mapGioHang = ShoppingCartDAO.mapOpenCart;
    %>
    <%
    	int count = 0;
    	for (Order sp : mapGioHang.values()) {
    		count++;
    	}
    %>
    <div class="col-xs-12 col-sm-6 col-md-4">
      <div class="cart">
        <div class="discart">
          <a href="<%=request.getContextPath()%>/giohang.jsp"><span class="mycart">Giỏ hàng:</span></a> <span class="count_products_cart"><%=count%> sản phẩm</span>
        </div>
        <div class="top-cart-content"></div>
      </div>
    </div>
  </div>
</div>
<nav id="mainmenu" class="hidden-xs hidden-sm ">
<div class="container">
  <ul class="x1">
    <li><a href="index.jsp">Trang chủ</a></li>
    <li><a href="<%=request.getContextPath()%>/index.jsp">Sản phẩm</a> <i class="fa fa-caret-down" aria-hidden="true"></i> <%
 	CategoryImpl categoryImpl1 = new CategoryImpl();
 %>
      <ul class="drop2">
        <li class="li1"><a class="a1" href="<%=request.getContextPath()%>/index.jsp">Giày nam</a>
          <ul class="drop3">
            <%
            	for (Category category : categoryImpl1.getAllCategorys()) {
            %>
            <li><a href="<%=request.getContextPath()%>/Category?id=<%=category.getId()%>"> <%
             	out.print(category.getName());
             	}
            %>
            </a></li>
          </ul></li>
        <li class="li1"><a href="<%=request.getContextPath()%>/index.jsp">Giày nữ</a>
          <ul class="drop3">
            <%
            	for (Category category : categoryImpl1.getAllCategorys()) {
            %>
            <li><a class="a1" href="<%=request.getContextPath()%>/Category?id=<%=category.getId()%>"> <%
             	out.print(category.getName());
             	}
             %>
            </a></li>
          </ul></li>
      </ul></li>
    <li><a href="<%=request.getContextPath()%>/gioithieu.jsp">Giới thiệu</a></li>
    <li><a href="<%=request.getContextPath()%>/news.jsp">Tin tức</a></li>
    <li><a href="<%=request.getContextPath()%>/diary.jsp">Liên hệ</a></li>
    <li>
      <%
      	if (session.getAttribute("user") == null) {
      %> <a href="<%=request.getContextPath()%>/login.jsp">Đăng nhập</a> <a href="<%=request.getContextPath()%>/register.jsp">Đăng ký</a> <%
 	    } else {
      %> <%
      	User user = (User) session.getAttribute("user");
      %> <%
       	out.print("Chào " + user.getUsername());
      %> <a href="Logout">Đăng xuất</a> <%
       	}
      %>
    </li>
</div>
</nav>
</header>

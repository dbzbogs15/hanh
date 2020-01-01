<%@page import="dao.SanPhamImpl"%>
<%@page import="model.NhaCungCap"%>
<%@page import="dao.NhaCungCapImpl"%>
<%@page import="model.Category"%>
<%@page import="model.SanPham"%>
<%@page import="dao.CategoryImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý sản phẩm</title>
<link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">

<!-- Datatables -->
<link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
<link href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
<link href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
<link href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
<style>
.tb {
	margin-top: 10px;
}

.popover-content {
	text-align: center;
}

.dropdown {
	display: inline;
}
</style>
<!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
<!--        <script src="js/jquery.js"></script>
        <script src="adminjs/bootstrap.min.jscript>-->
</head>
<body>
  <jsp:include page="header.jsp"></jsp:include>

  <%
  	CategoryImpl categoryImpl = new CategoryImpl();
  %>

  <div class="col-md-10 col-md-offset-1 tb">
    <h3>
      <div class="dropdown">
        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
          Chọn loại sản phẩm <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
          <li><a href="<%=request.getContextPath()%>/quanlisanpham.jsp">Tất cả</a></li>
          <%
          	for (Category category : categoryImpl.getAllCategorys()) {
          %>
          <li><a href="<%=request.getContextPath()%>/Category?id=<%=category.getId()%>">
              <%
              	out.print(category.getName());
              %>
          </a></li>
          <%
          	}
          %>
        </ul>
      </div>
      <div class="dropdown">
        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
          Chọn nhà cung cấp <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
          <li><a href="<%=request.getContextPath()%>/quanlisanpham.jsp">Tất cả</a></li>
          <%
          	for (NhaCungCap nhaCungCap : new NhaCungCapImpl().getAllNhaCungCaps()) {
          %>
          <li><a href="<%=request.getContextPath()%>/NCCController?hidAction=Cate&mancc=<%out.print(nhaCungCap.getMancc());%>">
              <%
              	out.print(nhaCungCap.getTenncc());
              %>
          </a></li>
          <%
          	}
          %>
        </ul>
      </div>
      <a href="addsp.jsp">
        <button class="btn btn-primary">
          <i class="fa fa-plus" aria-hidden="true"></i> Thêm sản phẩm
        </button>
      </a>
    </h3>
    <%
    	if (request.getSession().getAttribute("success") != null) {
    %>
    <h4><%=request.getSession().getAttribute("success")%></h4>
    <%
    	request.getSession().removeAttribute("success");
    %>
    <%
    	}
    %>
    <table id="datatable-buttons" class="table table-striped table-bordered">
      <thead>
        <tr>
          <th>Mã sản phẩm</th>
          <th>Loại sản phẩm</th>
          <th>Tên sản phẩm</th>
          <th>Ảnh sản phảm</th>
          <th>Giá sản phẩm</th>
          <th>Mô tả</th>
          <th>Nhà cung cấp</th>
          <th>Tùy chọn</th>
        </tr>
      </thead>


      <tbody>
        <%
        	if (request.getAttribute("id") == null && request.getAttribute("mancc") == null) {
        %>
        <%
        	for (SanPham sanPham : categoryImpl.getAllSanPham()) {
        %>
        <tr>
          <td><%=sanPham.getMasp()%></td>
          <td><%=sanPham.getId()%></td>
          <td><%=sanPham.getTensp()%></td>
          <td>
            <%
            	if (sanPham.getAnhsp() == null || sanPham.getAnhsp().isEmpty()) {
            %> <img class="imgproduct" src="<%=sanPham.getImage()%>" height=100px width=100px> <%
 	} else {
 %> <img
            class="imgproduct" src="<%=request.getContextPath()%><%=sanPham.getAnhsp()%>" height=100px width=100px> <%
 	}
 %>
          </td>
          <td><%=sanPham.getGiasp()%> Đ</td>
          <td><%=sanPham.getMota()%></td>
          <td>
            <%
            	out.print(sanPham.getNcc());
            %>
          </td>
          <td style="width: 15%; text-align: center;"><a class="btn btn-primary"
            href="<%=request.getContextPath()%>/ProductController?hidAction=EditSP&masp=<%=sanPham.getMasp()%>"><span
              class="glyphicon glyphicon-edit"></span></a>
            <button class="btn btn-danger" title="Bạn có muốn xóa sản phẩm này ?" data-toggle="popover" data-html="true" data-placement="left" data-trigger="focus"
              data-content="<a href='<%=request.getContextPath()%>/ProductController?hidAction=DelSP&masp=<%out.print(sanPham.getMasp());%>'>Xóa</a>">
              <span class="glyphicon glyphicon-trash"></span>
            </button></td>
        </tr>
        <%
        	}
        		
        %>
        <%
        	} else
        %>
        <%
        	if (request.getAttribute("id") != null) {
        %>
        <%
        	for (SanPham sanPham : categoryImpl.getSanPham(request.getAttribute("id").toString())) {
        %>
        <tr>
          <td><%=sanPham.getMasp()%></td>
          <td><%=sanPham.getId()%></td>
          <td><%=sanPham.getTensp()%></td>
          <td><img src="<%=request.getContextPath() + sanPham.getAnhsp()%>" alt="" border=3 height=100 width=100></td>
          <td><%=sanPham.getGiasp()%></td>
          <td><%=sanPham.getMota()%></td>
          <td>
            <%
            	out.print(sanPham.getNcc());
            %>
          </td>
          <td style="width: 15%; text-align: center;"><a class="btn btn-primary"
            href="<%=request.getContextPath()%>/ProductController?hidAction=EditSP&masp=<%=sanPham.getMasp()%>"><span
              class="glyphicon glyphicon-edit"></span></a>
            <button class="btn btn-danger" title="Bạn có muốn xóa nhà cung cấp này ?" data-toggle="popover" data-html="true" data-placement="left" data-trigger="focus"
              data-content="<a href='<%=request.getContextPath()%>/ProductController?hidAction=DelSP&masp=<%out.print(sanPham.getMasp());%>'>Xóa</a>">
              <span class="glyphicon glyphicon-trash"></span>
            </button></td>
        </tr>
        <%
        	}
        %>
        <%
        	} else
        %>
        <%
        	if (request.getAttribute("mancc") != null) {
        %>
        <%
        	for (SanPham sanPham : new SanPhamImpl().getSanPhamByNCC(request.getAttribute("mancc").toString())) {
        %>
        <tr>
          <td><%=sanPham.getMasp()%></td>
          <td><%=sanPham.getId()%></td>
          <td><%=sanPham.getTensp()%></td>
          <td><img src="<%=request.getContextPath() + sanPham.getAnhsp()%>" alt="" border=3 height=100 width=100></td>
          <td><%=sanPham.getGiasp()%></td>
          <td><%=sanPham.getMota()%></td>
          <td>
            <%
            	out.print(sanPham.getNcc());
            %>
          </td>
          <td style="width: 15%; text-align: center;"><a class="btn btn-primary"
            href="<%=request.getContextPath()%>/ProductController?hidAction=EditSP&masp=<%=sanPham.getMasp()%>"><span
              class="glyphicon glyphicon-edit"></span></a>
            <button class="btn btn-danger" title="Bạn có muốn xóa sản phẩm này ?" data-toggle="popover" data-html="true" data-placement="left" data-trigger="focus"
              data-content="<a href='%=request.getContextPath()%>/ProductController?hidAction=DelSP&masp=<%out.print(sanPham.getMasp());%>'>Xóa</a>">
              <span class="glyphicon glyphicon-trash"></span>
            </button></td>
        </tr>
        <%
        	}
        		}
        %>
      </tbody>
    </table>
  </div>
  <script>
			$(document).ready(function() {
				$('[data-toggle="popover"]').popover();
			});
		</script>

  <!--   jQuery 
        <script src="vendors/jquery/dist/jquery.min.js"></script>
         Bootstrap 
        <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>-->
  <!-- FastClick -->

  <!-- Datatables -->
  <script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
  <script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
  <script src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
  <script src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
  <script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
  <script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
  <script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>

  <!-- Custom Theme Scripts -->
  <script src="build/js/custom.min.js"></script>
</body>
</html>

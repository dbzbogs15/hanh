
<%@page import="java.util.HashMap"%>
<%@page import="model.Order"%>
<%@page import="dao.ThongKeDAO"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thống kê theo khoảng ngày</title>
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
        <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <script src="<%request.getContextPath();%>/js/jquery.js"></script>

        <link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    </head>
    <body>
        <jsp:include page="../header.jsp"></jsp:include>
            <div class="container">

                <div class="row">

                    <form action="/ThongKeDoanhThu?action=KhoangNgay" method="post" >
                        <div class="col-sm-3">
                            <h5><strong>Từ ngày:</strong></h5>
                            <input type="date" name="ngayBatDau">
                        </div>
                        <div class="col-sm-3">
                            <h5><strong>Đến ngày:</strong></h5>
                            <input type="date" name="ngayKetThuc">
                            <button class="btn btn-sm btn-info" type="submit">Thống kê</button>
                        </div>

                    </form>

                </div>


                <div class="row">
                    <h4 >I.   BẢNG SỐ LIỆU CHI TIẾT </h4>
                <%Map<String, Order> maphd = new HashMap<>();
                    String ok = (String) session.getAttribute("okkn");
                    String ngayBatDau = (String) session.getAttribute("ngayBatDau");
                    String ngayKetThuc = (String) session.getAttribute("ngayKetThuc");
                    String thongbao = "";
                    if (ok != null) {
                        if (ok.equals("ok")) {
                            maphd = new ThongKeDAO().thongKeTheoKhoanNgay(ngayBatDau, ngayKetThuc);
                        } else {
                            thongbao = "Ngày vừa nhập  không có doanh thu";

                        }

                    } else {
                        thongbao = "Không có dữ liệu để thống kê";
                    }
                %>
                <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Mã đơn hàng</th>
                            <th>Tên sản phẩm</th>
                            <th>Thành tiền</th>
                            <th>Số lượng bán ra</th>

                            <th>Ngày</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%int count = 0;
                            int tongSoLuong = 0;
                            int tongTien = 0;
                            for (Order order : maphd.values()) {
                                count++;
                                tongSoLuong += Integer.parseInt(order.getCount());
                                tongTien += Integer.parseInt(order.getPrice());
                        %>
                        <TR>
                            <TD> <%= count%></td>

                            <TD> <%= order.getOrderID()%></TD>
                            <td><%=order.getProductID()%></td>
                            <TD> <%= order.getPrice()%></TD>
                            <TD> <%= order.getCount()%></TD>
                            <TD> <%=order.getDate()%></TD>
                        </TR>
                        <%} %>
                    </tbody>
                </table>
            </div>

            <div class="clearfix"></div><div class="clearfix"></div>
            <div class="row">
                <h4>II. BẢNG TỔNG HỢP</h4>
                <div class="col-sm-6 well" >
                    <%if (thongbao.length() > 0) {%>
                    <p> <%out.print(thongbao);%></p>
                    <%} else {%>
                    <p>Tổng số lượng sản phẩm bán được từ ngày <%=ngayBatDau%> đẽn ngày <%=ngayKetThuc%> là: <%=tongSoLuong%></p>    
                    <p>Tổng tiền thu được từ ngày <%=ngayBatDau%> đẽn ngày <%=ngayKetThuc%> là: <%=tongTien%></p>    


                    <%}%>

                </div>
            </div></div>

    </body>
    <!-- jQuery -->
    <!--    <script src="vendors/jquery/dist/jquery.min.js"></script>
         Bootstrap 
        <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>-->
    <!-- datatable -->
    <script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="vendors/jszip/dist/jszip.min.js"></script>
    <script src="vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="vendors/pdfmake/build/vfs_fonts.js"></script>


    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
</html>
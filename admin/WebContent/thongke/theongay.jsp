

<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dao.ThongKeDAO"%>
<%@page import="model.Order"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thống kê theo ngày</title>
        <!--      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
              <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <script src="<%request.getContextPath();%>/js/jquery.js"></script>

        <link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
        <!--script bắt lỗi form-->

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    </head>
    <jsp:include page="../header.jsp"></jsp:include>
        <body class="boder">
            <div class="container">



                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-3">

                            <h5><strong>Nhập vào ngày:</strong></h5>
                            <form action="/ThongKeDoanhThu?action=TheoNgay" method="post">
                                <input type="date" name="ngay">
                                <button class="btn btn-sm btn-info" >Thống kê</button>
                            </form>
                        </div></div>


                </div>



                <br>
                <div class="row ">
                    <h4 >I.   BẢNG SỐ LIỆU CHI TIẾT </h4>
                <%  Map<String, Order> mapDH = new ThongKeDAO().thongKeTheoNgayHeThong();
                    String ok = (String) session.getAttribute("okngay");
                    String ngay = (String) session.getAttribute("ngay");
                    String thongbao = "";
                    if (ok != null) {
                        if (ok.equals("ok")) {
                            mapDH = new ThongKeDAO().thongKeTheoNgay(ngay);
                        } else {
                            thongbao = "Ngày vừa nhập không có doanh thu";
                            mapDH = new HashMap<String, Order>();

                        }
                    } %>
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
                            for (Order order : mapDH.values()) {
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
                    <p>Tổng số lượng sản phẩm bán được trong ngày <%if (ngay == null) {%> hôm nay <%} else {%> <%=ngay%> <%}%> là: <%=tongSoLuong%></p>    
                    <p>Tổng tiền thu được trong ngày <%if (ngay == null) {%> hôm nay <%} else {%> <%=ngay%> <%}%> là: <%=tongTien%></p>    

                    <%}%>

                </div>
            </div></div>



        <!-- jQuery -->
        <!--<script src="vendors/jquery/dist/jquery.min.js"></script>-->
        <!-- Bootstrap -->
        <!--<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>-->
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
    </body>
</html>
<%@page import="model.Order"%>
<%@page import="dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý đơn hàng</title>
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
        </style>
        <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>


            <div class="col-md-10 col-md-offset-1 tb">
                <h3>    <a href="donhang/addDonHang.jsp" class="btn btn-primary">
                        <i class="fa fa-plus" aria-hidden="true"></i> 
                        Thêm đơn hàng
                    </a>
                </h3>
                <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Mã đơn hàng</th>
                            <th>Tên khách hàng</th>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th>Số điện thoại</th>
                            <th>Ngày đặt hàng</th>
                            <th>Tùy chọn</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%OrderDAO orderDAO = new OrderDAO();%>
                    <%for (Order order : orderDAO.getAllOrders()) {%>
                    <tr>
                        <td><%out.print(order.getOrderID());%></td>
                        <td><%out.print(order.getCustomerUserName());%></td>
                        <td><%out.print(order.getProductID());%></td>
                        <td><%out.print(order.getCount());%></td>
                        <td><%out.print(order.getPrice());%></td>
                        <td><%out.print(order.getPhoneNumber());%></td>
                        <td><%out.print(order.getDate());%></td>
                        <td style="width: 15%; text-align: center;">
                            <a class="btn btn-primary" href="<%=request.getContextPath()%>/OrderController?hidAction=EditOrder&madh=<%out.print(order.getOrderID());%>"
                               ><span class="glyphicon glyphicon-edit"></span></a>
                            <button class="btn btn-danger"
                                    title="Bạn có muốn xóa đơn hàng ?"
                                    data-toggle="popover" data-html="true"
                                    data-placement="left"
                                    data-trigger="focus" 
                                    data-content="<a href='<%=request.getContextPath()%>/OrderController?hidAction=DeleteOrder&madh=<%out.print(order.getOrderID());%>'>Xóa</a>"><span class="glyphicon glyphicon-trash"></span></button>

                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
        <script>

            $(document).ready(function () {
                $('[data-toggle="popover"]').popover();
            });
        </script>

        <!-- jQuery -->
        <script src="vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
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

<%@page import="model.Order"%>
<%@page import="dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Sua</title>
       
        <style>
            .hid{
                visibility: hidden;
            }
            .phom{
                text-align:center;}
            h2{
                text-align: center;}
            .form-control {
                position: relative;
                height: auto;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                padding: 10px;
                font-size: 16px;
            }

            .form-control {
                max-width: 330px;
                padding: 15px;
                margin: 0 auto;
            }
        </style>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
        $(document).ready(function() {
            function validatePhone(txtPhone) {
                var filter = /^[0-9-+]+$/;
                if (filter.test(txtPhone + "") && txtPhone.length >= 10 && txtPhone.length < 12) {
                    return true;
                } else {
                    return false;
                }
            }

            
            $('#editOrder').bind({
                'submit': function() {
                    
                    if ($('#tenkh').val()=='') {
                        $('#tenkh_err').html("<font color=\"red\">"+'Bạn không được bỏ trống trường này');
                        return false;
                    }
                    if ($('#madh').val()=='') {
                        $('#madh_err').html('Bạn không được bỏ trống trường này!!!');
                        return false;
                    }
                    
                    if ($('#tensp').val()=='') {
                        $('#tensp_err').html('Bạn không được bỏ trống trường này');
                        return false;
                    }
                    if ($('#count').val()=='') {
                        $('#count_err').html('Bạn không được bỏ trống trường này');
                        return false;
                    }
                    if ($('#sum').val()=='') {
                        $('#sum_err').html('Bạn không được bỏ trống trường này');
                        return false;
                    }
                    if (!validatePhone($('#sdt').val())) {
                        $('#sdt_err').html('Số điện thoại bạn nhập vào không phù hợp!!!');
                        return false;
                    }
                    return true;
                },
                'keydown': function() {
                    if ($('#madh').val().length > 0) {
                        $('#madh_err').html('');
                    }
                    if ($('#tenkh').val().length > 0) {
                        $('#tenkh_err').html('');
                    }
                    if ($('#tensp').val().length > 0) {
                        $('#tensp_err').html('');
                    }
                    if ($('#count').val().length > 0) {
                        $('#count_err').html('');
                    }
                    if ($('#sum').val().length > 0) {
                        $('#sum_err').html('');
                    }
                    if ($('#sdt').val().length > 0) {
                        $('#sdt_err').html('');
                    }
                    
                }
            });
        });
    </script>
    </head>
    <body>
        <jsp:include page="../header.jsp"></jsp:include>
        <script src="<%request.getContextPath();%>/js/bootstrap.min.js"></script>
        <script src="<%request.getContextPath();%>/js/jquery.js"></script>

        <!-- Content Section -->
    <section>
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <h2>
                        Sửa <span class="glyphicon glyphicon-cutlery"></span>
                    </h2>
                    <div class="phom">
                        <%ServletContext context = getServletContext();%>
                        <%if(context.getAttribute("order")==null) {%>
                        <jsp:forward page="quanlydonhang.jsp"></jsp:forward> <%}%>
                        <%Order order= (Order) context.getAttribute("order");%>
                        <form action="<%=request.getContextPath()%>/OrderController" class="form-horizontal" id="editOrder" role="form" style="color: black" method="post">
                            <input type="hidden" name="hidAction" value="UpdateOrder">
                            <input type="hidden" name="key" value="<%out.print(order.getOrderID());%>">
                            Mã đơn hàng:<input name="madh" id="madh" type="text"
                                            class="form-control" value="<%out.print(order.getOrderID());%>">
                            <p id="madh_err"></p>                    
                            Tên khách hàng:<input name="tenkh" id="tendh" type="text"
                                           class="form-control" value="<%out.print(order.getCustomerUserName());%>">
                            <p id="tenkh_err"></p>
                            Tên sản phẩm:<input name="tensp" id="tensp" type="text"
                                        class="form-control" value="<%out.print(order.getProductID());%>">
                           <p id="tensp_err"></p>
                            Số lượng:<input name="count" id="count" type="text"
                                                class="form-control" value="<%out.print(order.getCount());%>">
                            <p id="count_err"></p>
                            Tổng tiền:<input name="sum" id="sum" type="text"
                                                class="form-control" value="<%out.print(order.getPrice());%>">
                            <p id="sum_err"></p>
                            Số điện thoại:<input name="sdt" id="sdt" type="text"
                                                 class="form-control" value="<%out.print(order.getPhoneNumber());%>">
                            <p id="sdt_err"></p>
                            <br>
                            <input type="submit" class="btn btn-info" value="Sửa" style="color:white;">
                            <a href="<%=request.getContextPath()%>/quanlidonhang.jsp" class="btn btn-info" style="color:white;">Quay lại</a>
                        </form>
                    </div>

                </div>
            </div>
    
    </section>



    <!-- Footer -->


    <!-- jQuery -->
    <script src="<%request.getContextPath();%>/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%request.getContextPath();%>/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</body>

</html>

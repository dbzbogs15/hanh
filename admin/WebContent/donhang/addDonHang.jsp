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
        <title>Thêm đơn hàng</title>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/full-width-pics.css" rel="stylesheet">
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
            $(document).ready(function () {
                function validatePhone(txtPhone) {
                    var filter = /^[0-9-+]+$/;
                    if (filter.test(txtPhone + "") && txtPhone.length >= 10 && txtPhone.length < 12) {
                        return true;
                    } else {
                        return false;
                    }
                }


                $('#addOrder').bind({
                    'submit': function () {

                        if ($('#madh').val() == '') {
                            $('#madh_err').html("<font color=\"red\">" + 'Bạn không được bỏ trống trường này' + "</font>");
                            return false;
                        }

                        if ($('#tenkh').val() == '') {
                            $('#tenkh_err').html("<font color=\"red\">" + 'Bạn không được bỏ trống trường này' + "</font>");
                            return false;
                        }
                        if ($('#tensp').val() == '') {
                            $('#tensp_err').html("<font color=\"red\">" + 'Bạn không được bỏ trống trường này' + "</font>");
                            return false;
                        }
                        if ($('#count').val() == '') {
                            $('#count_err').html("<font color=\"red\">" + 'Bạn không được bỏ trống trường này' + "</font>");
                            return false;
                        }
                        if ($('#sum').val() == '') {
                            $('#sum_err').html("<font color=\"red\">" + 'Bạn không được bỏ trống trường này' + "</font>");
                            return false;
                        }
                        if ($('#sdt').val() == '') {
                            $('#sdt_err').html("<font color=\"red\">" + 'Bạn không được bỏ trống trường này' + "</font>");
                        }
                        if (!validatePhone($('#sdt').val())) {
                            $('#sdt_err').html("<font color=\"red\">" + 'Số điện thoại không hợp lệ' + "</font>");
                            return false;
                        }
                        return true;
                    },
                    'keydown': function () {
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
            <!-- Content Section -->
        <section>
            <div class="container">
                <div class="jumbotron">
                    <div class="row">
                        <h2>
                            Thêm đơn hàng 
                        </h2>
                        <div class="phom">
                            <form action="<%=request.getContextPath()%>/OrderController" class="form-horizontal" role="form" style="color: black" id="addOrder" method="post">
                            <input type="hidden" name="hidAction" value="AddOrder">
                            Mã đơn hàng:<input name="madh" id="madh" type="text"
                                               class="form-control" placeholder="Nhập vào mã đơn hàng">
                            <p id="madh_err"></p>
                            <%if (request.getAttribute("madh_err") != null) {
                                    out.print("<font color=\"red\">" + (String) request.getAttribute("madh_err") + "</font><br>");
                                }%>
                            <p></p>

                            Tên khách hàng:<input name="tenkh" id="tenkh" type="text"
                                                  class="form-control" placeholder="Nhập vào tên khách hàng">
                            <p id="tenkh_err"></p>
                            Tên sản phẩm:<input name="tensp" id="tensp" type="text"
                                                class="form-control" placeholder="Nhập vào tên sản phẩm">
                            <p id="tensp_err"></p>
                            Số lượng:<input name="count" id="count" type="text"
                                            class="form-control" placeholder="Nhập vào số lượng">
                            <p id="count_err"></p>
                            Tổng tiền:<input name="sum" id="sum" type="text"
                                             class="form-control" placeholder="Tổng Tiền">
                            <p id="sum_err"></p>
                            Số điện thoại:<input name="sdt" id="sdt" type="text"
                                                 class="form-control" placeholder="Số điện thoại">
                            <p id="sdt_err"></p>
                            <br>
                            <input type="submit" class="btn btn-info" value="Thêm" style="color:white;">
                            <a href="<%=request.getContextPath() %>/quanlidonhang.jsp" class="btn btn-info" style="color:white;">Quay lại</a>
                        </form>
                    </div>

                </div>
            </div>
    </section>




    <!-- Footer -->


    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</body>

</html>

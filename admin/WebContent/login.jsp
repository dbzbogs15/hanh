<%-- 
    Document   : login
    Created on : Jun 7, 2017, 11:50:24 PM
    Author     : HongThai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Đăng nhập hệ thống</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
</head>
<body>

<div class="container">
  <h2>Đăng nhập vào hệ thống!</h2>
  <form action="<%=request.getContextPath()%>/Log?action=login" method="POST">
    <div class="form-group">
      <label for="username">Tài khoản</label>
      <input type="text" class="form-control" placeholder="Tài khoản" name="username">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Mật khẩu" name="pwd">
    </div>
      <div style="font-size: 20px; color: red">
    <%if(request.getAttribute("error") != null) {
      out.print((String)request.getAttribute("error"));
    }
    %>
      </div><br>
      <button type="Submit" class="btn btn-default">Đăng nhập!</button><br>
  </form>
</div>

</body>
</html>


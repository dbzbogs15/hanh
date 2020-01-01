
<%@page import="model.SanPham"%>
<%@page import="dao.CategoryImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%CategoryImpl dao = new CategoryImpl();%>
        <%for(SanPham sanPham : dao.getAllSanPham()) {%>
        <%out.print(sanPham.getTensp() +"+++++++++++++++++++++++++++++"+ sanPham.getAnhsp());%><br>
        <%}%>
    </body>
</html>

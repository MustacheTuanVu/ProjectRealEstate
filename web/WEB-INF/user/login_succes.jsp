<%-- 
    Document   : login_succes
    Created on : Feb 18, 2019, 1:44:40 PM
    Author     : Cuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>LOGIN SUCCES</h1>
        <h2> id ${id}</h2>
        <a href="<%= request.getContextPath()%>/Add_Infor_User?id=${id}">Add Information</a><br>
        <a href="<%= request.getContextPath()%>/Edit_Customer_Servlet?id=${id}">Detail Information</a><br>
        <a href="<%= request.getContextPath()%>/Edit_User_Servlet?id=${id}">Change Password</a><br>
    </body>
</html>

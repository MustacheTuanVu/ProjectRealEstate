<%-- 
    Document   : login_succes_admin
    Created on : Feb 21, 2019, 8:26:27 PM
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
        <h1>Pages Admin</h1>
        <a href="<%= request.getContextPath()%>/List_User_Servlet">List User</a><br>
        <a href="<%= request.getContextPath()%>/List_Contract_Servlet">List Contract</a><br>
        <a href="<%= request.getContextPath()%>/Create_Contract_Servlet">Create Contract</a><br>
        <a href="<%= request.getContextPath()%>/List_Transaction_Servlet">List Transaction</a><br>
        <a href="<%= request.getContextPath()%>/Create_Transaction_Servlet">Create Transaction</a><br>
        <a href="<%= request.getContextPath()%>/List_Contract_Details_Servlet">List Contract Details</a><br>
        <a href="<%= request.getContextPath()%>/Create_Contract_Details_Servlet">Create Contract Details</a><br>
    </body>
</html>

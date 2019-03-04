<%-- 
    Document   : list_type_contract
    Created on : Feb 13, 2019, 2:46:21 PM
    Author     : Cuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>List User</h1>
        <a href="<%= request.getContextPath()%>/Create_User_Servlet">Create</a>
        <table>
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Role</td>
                <td>Action</td>
            </tr>
            <c:forEach items="${list}" var="l">
                <tr>
                <td>${l.id}</td>
                <td>${l.username}</td>
                <td>${l.role}</td>
                <td>
                   
                    <a href="<%= request.getContextPath()%>/Delete_User_Servlet?id=${l.id}" >Remove</a>
                </td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>

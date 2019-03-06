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
        <h1>List Contract Type</h1>
        <a href="<%= request.getContextPath()%>/Create_Type_Servlet">Create</a>
        <table>
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Action</td>
            </tr>
            <c:forEach items="${list}" var="l">
                <tr>
                <td>${l.id}</td>
                <td>${l.contractTypeName}</td>
                <td>
                    <a href="<%= request.getContextPath()%>/Edit_Type_Servlet?id=${l.id}" >Edit</a>
                    <a href="<%= request.getContextPath()%>/Delete_Type_Servlet?id=${l.id}" >Remove</a>
                </td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>

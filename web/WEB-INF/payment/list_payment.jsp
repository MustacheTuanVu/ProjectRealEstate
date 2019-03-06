<%-- 
    Document   : list_payment
    Created on : Feb 16, 2019, 10:49:33 PM
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
         <h1>List Payment</h1>
        <a href="<%= request.getContextPath()%>/Create_Payment_Servlet">Create</a>
        <table>
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Action</td>
            </tr>
            
            <c:forEach items="${list}" var="l">
                <tr>
                <td>${l.id}</td>
                <td>${l.paymentFrequencyName}</td>
                <td>
                    <a href="<%= request.getContextPath()%>/Edit_Payment_Servlet?id=${l.id}" >Edit</a>
                    <a href="<%= request.getContextPath()%>/Delete_Payment_Servlet?id=${l.id}" >Remove</a>
                </td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>

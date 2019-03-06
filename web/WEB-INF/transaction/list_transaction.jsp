<%-- 
    Document   : list_contract
    Created on : Feb 20, 2019, 5:22:50 PM
    Author     : Cuong
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>List Transaction</h1>
        <table >
            <tr>
                <th>ID</th>
                <th>Customer Name</th>
                <th>Date Sign</th>
                <th>Money</th>
                <th>Transaction Note</th>
            </tr>
            <c:forEach items="${list}" var="l">
                <tr>
                <td>${l.id}</td>
                <td>${l.customerOffered.customerName}</td>
                <td><fmt:formatDate value="${l.transactionsDate}" pattern="dd-MM-yyyy"/></td>
                
                <td>${l.money}</td>
                <td>${l.transactionsNote}</td>
                <td>
                    <a href="<%= request.getContextPath()%>/Edit_Transaction_Servlet?id=${l.id}" >Edit</a>
                    <a href="<%= request.getContextPath()%>/Delete_Transaction_Servlet?id=${l.id}" >Remove</a>
                </td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>

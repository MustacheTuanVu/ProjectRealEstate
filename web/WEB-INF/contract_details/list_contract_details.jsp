<%-- 
    Document   : list_contract_details
    Created on : Feb 24, 2019, 10:14:13 PM
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
         <h1>List Contract Details</h1>
        <a href="<%= request.getContextPath()%>/Create_Contract_Details_Servlet">Create</a>
        <table>
            <tr>
                <td>ID</td>
                <td>Estate Name</td>
                <td>Contract Number</td>
                <td>Action</td>
            </tr>
            
            <c:forEach items="${list}" var="l">
                <tr>
                <td>${l.id}</td>
                <td>${l.estateId.estateName}</td>
                <td>${l.contractId.id}</td>
                <td>
                    <a href="<%= request.getContextPath()%>/Edit_Contract_Details_Servlet?id=${l.id}" >Edit</a>
                    <a href="<%= request.getContextPath()%>/List_Contract_Details_Servlet?id=${l.id}" >Remove</a>
                </td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>

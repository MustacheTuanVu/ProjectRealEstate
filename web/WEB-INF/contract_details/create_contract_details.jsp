<%-- 
    Document   : create_contract_details
    Created on : Feb 24, 2019, 10:35:12 PM
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
        <h1>Create Contract Details</h1>
         <form method="POST" action="Create_Contract_Details_Servlet"   >
            <table>
                <tr>
                    <td>Estate Name</td>
                    <td>
                        <select name="est">
                            <c:forEach items="${estCon}" var="est" >
                                <option value="${est.id}" >${est.estateName}</option> 
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Contract Number</td>
                    <td>
                        <select name="con">
                            <c:forEach items="${list}" var="con" >
                                <option value="${con.id}" >${con.id}</option> 
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Create"/></td>
                </tr>
            </table>
        </form>
                <a href="<%= request.getContextPath()%>/List_Contract_Details_Servlet">Back To List</a>
    </body>
</html>

<%-- 
    Document   : create_transaction
    Created on : Feb 24, 2019, 7:40:39 PM
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
        <h1>Create Transaction</h1>
        <form method="POST" action="Create_Transaction_Servlet">
            <table>
                <tr>
                    <td>Customer Name</td>
                    <td>
                        <select name="cus">
                            <c:forEach items="${listCus}" var="cus" >

                                <option value="${cus.id}" ${cus.id==tran.customerOffered.id}>${cus.customerName}</option> 

                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Contract Number</td>
                    <td>
                        <select name="con">
                            <c:forEach items="${listCon}" var="con" >

                                <option value="${con.id}" ${con.id==tran.contractId.id}>${con.id}</option> 

                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Date Sign
                    </td>
                    <td>
                        <input type="date" name="txtDate"/>
                    </td>
                </tr>
                <tr>
                    <td>Money</td>
                    <td><input type="number" name="txtMoney" value="${tran.money}"/></td>
                </tr>
                <tr>
                    <td>Transaction Note</td>
                    <td><textarea name="txtNote">${tran.transactionsNote}</textarea> </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Create"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>

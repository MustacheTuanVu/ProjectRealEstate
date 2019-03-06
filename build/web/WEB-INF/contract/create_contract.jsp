<%-- 
    Document   : create_contract
    Created on : Feb 13, 2019, 2:32:21 PM
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
        <h1>Create Contract</h1>
        <form method="POST" action="#" >
            <table>
                <tr>
                    <td>Customer Name</td>
                    <td>
                        <select name="cus">
                        <c:forEach items="${listCus}" var="cus" >
                            
                                <option value="${cus.id}">${cus.customerName}</option> 
                            
                        </c:forEach>
                                </select>
                    </td>
                </tr>
                <tr>
                    <td>Employee Name</td>
                    <td>
                        <select name="emp">
                        <c:forEach items="${listEmp}" var="emp" >
                            
                                <option value="${emp.id}">${emp.employeeName}</option> 
                            
                        </c:forEach>
                                </select>
                    </td>
                </tr>
                <tr>
                    <td>Contract Type</td>
                    <td>
                        <select name="type">
                        <c:forEach items="${listType}" var="type" >
                            
                                <option value="${type.id}">${type.contractTypeName}</option> 
                            
                        </c:forEach>
                                </select>
                    </td>
                </tr>
                <tr>
                    <td>Payment </td>
                    <td>
                        <select name="pay">
                        <c:forEach items="${listPay}" var="pay" >
                            
                                <option value="${pay.id}">${pay.paymentFrequencyName}</option> 
                            
                        </c:forEach>
                                </select>
                    </td>
                </tr>
                <tr>
                    <td>Payment Amount</td>
                    <td><input type="number" name="txtAmount"/></td>
                </tr>
                <tr>
                    <td>Fee Percent</td>
                    <td><input type="number" name="txtFee"/></td>
                </tr>
                <tr>
                    <td>Date Sign</td>
                    <td><input type="date" id="date" name="txtdate"/>
                        
                    </td>
                </tr>
                <tr>
                    <td>Contract Details</td>
                    <td><input type="tel" name="txtDetails"/></td>
                </tr>
                <tr>
                    <td>Document URL</td>
                    <td><input type="text" name="txtURL"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Create"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>

<%-- 
    Document   : edit_contract
    Created on : Feb 22, 2019, 1:49:28 PM
    Author     : Cuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <body>
        <h1>Edit Contract</h1>
        <form method="POST" action="#" >
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="txtID" value="${con.id}" readonly="true" /></td>
                </tr>
                <tr>
                    <td>Customer Name</td>
                    <td>
                        <select name="cus">
                        <c:forEach items="${listCus}" var="cus" >
                                <option value="${cus.id}" ${cus.id==con.customerId.id ? 'selected' : ''}>${cus.customerName}</option> 
                        </c:forEach>
                                </select>
                    </td>
                </tr>
                <tr>
                    <td>Employee Name</td>
                    <td>
                        <select name="emp">
                        <c:forEach items="${listEmp}" var="emp" >
                                <option value="${emp.id}" ${emp.id==con.employeeId.id ? 'selected' : ''}>${emp.employeeName}</option>   
                        </c:forEach>
                                </select>
                    </td>
                </tr>
                <tr>
                    <td>Contract Type</td>
                    <td>
                        <select name="type">
                        <c:forEach items="${listType}" var="type" >
                            <option value="${type.id}" ${type.id==con.contractTypeId.id ? 'selected' : ''}>${type.contractTypeName}</option> 
                        </c:forEach>
                                </select>
                    </td>
                </tr>
                <tr>
                    <td>Payment </td>
                    <td>
                        <select name="pay">
                        <c:forEach items="${listPay}" var="pay" >
                                <option value="${pay.id}" ${pay.id==con.paymentFrequency.id ? 'selected' : ''}>${pay.paymentFrequencyName}</option> 
                        </c:forEach>
                                </select>
                    </td>
                </tr>
                <tr>
                    <td>Payment Amount</td>
                    <td><input type="number" value="${con.paymentAmount}" name="txtAmount"/></td>
                </tr>
                <tr>
                    <td>Fee Percent</td>
                    <td><input type="number" value="${con.feePrecentage}" name="txtFee"/></td>
                </tr>
                <tr>
                    <td>Date Sign</td>
                    <td>
                        <input type="date"  value="12/12/2018" id="date" name="txtdate"/>
                    </td>
                </tr>
                <tr>
                    <td>Contract Details</td>
                    <td><input type="tel" value="${con.contractDetails}" name="txtDetails"/></td>
                </tr>
                <tr>
                    <td>Document URL</td>
                    <td><input type="text" value="${con.documentUrl}" name="txtURL"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Edit"/></td>
                </tr>
            </table>
        </form>
                
                    <a href="<%= request.getContextPath()%>/List_Contract_Servlet">Back to list</a>
    </body>
</html>

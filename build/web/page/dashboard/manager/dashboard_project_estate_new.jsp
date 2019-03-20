<%-- 
    Document   : dashboard_project_estate_new
    Created on : Mar 18, 2019, 1:29:03 PM
    Author     : kiems
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
        <form>
            <label>Nhap Block</label>
            <input type="text" name="block">
            <button type="submit" name="step" value="1">OKE</button>
        </form>
        <c:forEach begin="1" end="${floorNumber}" var="floor" step="1">
            <form>
                <label>NHAP BAO NHIEU LOAI GIA</label>
                <input type="text" id="floor${floor}RangerNumber" name="floor${floor}RangerNumber">
                <button type="submit" name="step" value="2">OKE</button>
            </form>
        </c:forEach>
        
    </body>
</html>

<%-- 
    Document   : edit_contract_details
    Created on : Feb 24, 2019, 10:52:24 PM
    Author     : Cuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form method="POST" action="Edit_Contract_Details_Servlet"   >
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" value="${delCon.id}" readonly="true"</td>
                </tr>
                <tr>
                    <td>Estate Name</td>
                    <td>
                        <select name="est">
                            <c:forEach items="${estCon}" var="est" >
                                <option value="${est.id}"  >${est.estateName}</option> 
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Contract Number</td>
                    <td>
                        <select name="con">
                            <c:forEach items="${list}" var="con" >
                                <option value="${con.id}" ${delCon.id==con.id ? 'selected':''}>${con.id}</option> 
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

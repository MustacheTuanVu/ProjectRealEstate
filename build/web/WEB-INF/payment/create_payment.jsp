<%-- 
    Document   : create_payment
    Created on : Feb 16, 2019, 10:48:58 PM
    Author     : Cuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script >
            function validation(){
                var type=document.getElementById('txtPay').value;
                
                if (type==="") {
                    document.getElementById('errType').innerHTML='Enter Payment Name';
                }
                else{
                    return true;
                }
                return false;
            }
        </script>
    </head>
    <body>
         <h1>Create Payment</h1>
        
        <form method="POST" action="Create_Payment_Servlet"  onsubmit="return validation()" >
            <table>
                <tr>
                    <td>Payment</td>
                    <td><input type="text" id="txtPay" name="txtPay"/><span id="errType">${err}</span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Create"/></td>
                </tr>
            </table>
        </form>
                <a href="<%= request.getContextPath()%>/List_Payment_Servlet">Back To List</a>
    </body>
</html>

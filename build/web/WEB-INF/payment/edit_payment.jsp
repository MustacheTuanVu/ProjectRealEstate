<%-- 
    Document   : edit_payment
    Created on : Feb 16, 2019, 10:49:16 PM
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
         <h1>Edit Payment</h1>
        
        <form method="POST" action="Edit_Payment_Servlet" onsubmit="return validation()" >
            <table>
                <tr>
                    <td>Payment ID</td>
                    <td><input type="text" name="txtID" readonly="true" value="${list.id}"/></td>
                </tr>
                <tr>
                    <td>Payment Name</td>
                    <td><input type="text" name="txtPay" id="txtPay" value="${list.paymentFrequencyName}"/><span id="errType">${err}</span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Edit"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>

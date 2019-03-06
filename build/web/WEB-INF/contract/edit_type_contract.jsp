<%-- 
    Document   : create_type_contract
    Created on : Feb 12, 2019, 9:58:09 PM
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
                var type=document.getElementById('txtType').value;
                
                if (type==="") {
                    document.getElementById('errType').innerHTML='Enter Type Name';
                }
                else{
                    return true;
                }
                return false;
            }
        </script>
    </head>
    <body>
        <h1>Edit Type Contract</h1>
        
        <form method="POST" action="Edit_Type_Servlet" onsubmit="return validation()" >
            <table>
                <tr>
                    <td>Type Contract ID</td>
                    <td><input type="text" name="txtID" readonly="true" value="${list.id}"/></td>
                </tr>
                <tr>
                    <td>Type Contract Name</td>
                    <td><input type="text" name="txtType" id="txtType" value="${list.contractTypeName}"/><span id="errType">${err}</span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Edit"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>

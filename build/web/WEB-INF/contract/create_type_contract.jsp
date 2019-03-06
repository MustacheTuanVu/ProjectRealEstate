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
        <h1>Create Type Contract</h1>
        
        <form method="get" action="Create_Type_Servlet"  onsubmit="return validation()" >
            <table>
                <tr>
                    <td>Type Contract</td>
                    <td><input type="text" id="txtType" name="txtType"/><span id="errType">${err}</span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Create"/></td>
                </tr>
            </table>
        </form>
                <a href="<%= request.getContextPath()%>/List_Type_Servlet">Back To List</a>
    </body>
</html>

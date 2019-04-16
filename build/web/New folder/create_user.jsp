<%-- 
    Document   : create_user
    Created on : Feb 17, 2019, 12:19:16 AM
    Author     : Cuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function validation(){
                var user=document.getElementById('txtUser').value;
                var pass=document.getElementById('txtPass').value;
                
                if (user==="") {
                    document.getElementById('errUser').innerHTML='Enter Username';
                } if(pass===""){
                     document.getElementById('errPass').innerHTML='Enter PassWord';
                }else{
                    return true;
                }
                return false;
            }
        </script>
    </head>
    <body>
        <h1>Create Customer</h1>
        <form action="Create_User_Servlet" method="POST" onsubmit="return validation()">
            <table>
                <tr>
                    <td>UserName</td>
                    <td><input type="text" name="txtUser" value="${u.username}" id="txtUser"/><span id="errUser"></span></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtPass" value="${u.password}" id="txtPass"/><span id="errPass"></span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Register"/></td>
                </tr>
            </table>
        </form>
        <a href="<%=request.getContextPath()%>/List_User_Servlet">Back to list</a>
    </body>
</html>

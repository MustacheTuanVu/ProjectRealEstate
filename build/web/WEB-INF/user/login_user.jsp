<%-- 
    Document   : login_user
    Created on : Feb 17, 2019, 12:46:46 PM
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
        <h1>Login User</h1>
        <form method="POST" action="Login_User_Servlet" >
            <table>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="txtUser" id="txtUser"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtPass" id="txtPass"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Login"/></td>
                </tr>
            </table>
        </form>
       
    </body>
</html>

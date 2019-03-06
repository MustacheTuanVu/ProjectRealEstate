<%-- 
    Document   : edit_user
    Created on : Feb 19, 2019, 11:17:44 PM
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
        <h1>Change Password</h1>
         <form action="Edit_User_Servlet" method="POST" >
            <table>
                <tr>
                    <td>UserName</td>
                    <td><input type="text" name="txtUser" value="${u.username}" id="txtUser"/><span id="errUser"></span></td>
                </tr>
                <tr>
                    <td>Old Password</td>
                    <td><input type="password" name="txtPass" id="txtPass"/><span id="errPass"></span></td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input type="password" name="txtNewPass"  id="txtPass"/><span id="errPass"></span></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" name="txtConPass"  id="txtPass"/><span id="errPass"></span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Save"/></td>
                </tr>
            </table>
        </form>
      
    </body>
</html>

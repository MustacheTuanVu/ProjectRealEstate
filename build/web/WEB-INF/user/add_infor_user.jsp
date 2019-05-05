1    <%-- 
    Document   : add_infor_user
    Created on : Feb 18, 2019, 2:51:06 PM
    Author     : Cuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
               <script>
             function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('#profile-img-tag').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#profile-img").change(function(){
        readURL(this);
    });
            
    function validateform() {
        
        
        var img = document.getElementById('profile-img').value;
        var name = document.getElementById('txtName').value;
        var address = document.getElementById('txtAddress').value;
        var card = document.getElementById('txtCard').value;
        var phone = document.getElementById('txtPhone').value;
        var mail = document.getElementById('txtMail').value;
        var content = document.getElementById('txtContent').value;
 
        if (img==null||img=="") {
               document.getElementById('errImg').innerHTML='Choose Image'; 
        }else
         if(name==""){
            document.getElementById('errName').innerHTML='Enter Name';
        }else
        if(address==null|| address==""){
            document.getElementById('errAddress').innerHTML='Enter Address';
        }else
        if(card==""){
            document.getElementById('errCard').innerHTML='Enter Card';
        }else
        if(phone==null|| phone==""){
            document.getElementById('errPhone').innerHTML='Enter Phone';
        }else
        if(mail==""){
            document.getElementById('errMail').innerHTML='Enter Mail';
        }else
        if(content==null|| content==""){
            document.getElementById('errContent').innerHTML='Enter Content';
        }else return true;
        
        return false;
        
    }
</script>
    </head>
    <body>
        <h1>Add Information Customer</h1>
        
        <img alt="Image" src="#" width="100" height="100" id="profile-img-tag" />
            <form action="Add_Infor_User" method="POST"   >
            <table>
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="txtImg" id="profile-img" onchange="readURL(this)"><span id="errImg"></span></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtName" id="txtName" ><span id="errName"></span></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txtAddress" id="txtAddress" ><span id="errAddress"></span></td>
                </tr>
                <tr>
                    <td>Indentity Card</td>
                    <td><input type="text" name="txtCard" id="txtCard" value="card"><span id="errCard"></span></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="text" name="txtPhone" id="txtPhone" value="phone"><span id="errPhone"></span></td>
                </tr>
                <tr>
                    <td>Mail</td>
                    <td><input type="text" name="txtMail" id="txtMail" value="mail"><span id="errMail"></span></td>
                </tr>
                
                <tr>
                    <td>Content</td>
                    <td><input type="text" name="txtContent" id="txtContent" value="content"><span id="errContent"></span></td>
                </tr>
                
             
            </table>
            <input type="submit" value="Create" />
        </form>
    </body>
</html>

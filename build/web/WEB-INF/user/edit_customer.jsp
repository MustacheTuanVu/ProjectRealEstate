    <%-- 
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
        <script type="text/javascript" src="<%=request.getContextPath()%>/ckfinder/ckfinder.js"></script>
	<script type="text/javascript">

function BrowseServer()
{
	// You can use the "CKFinder" class to render CKFinder in a page:
	var finder = new CKFinder();
	finder.basePath = '../';	// The path for the installation of CKFinder (default = "/ckfinder/").
	finder.selectActionFunction = SetFileField;
	finder.popup();
}
function SetFileField( fileUrl )
{
	document.getElementById( 'xFilePath' ).value = fileUrl;
}

	</script>
    </head>
    <body>
        <h1>Add Information Customer:</h1>
        
        <img alt="Image" src="${list.customerImg}" width="100" height="100" id="profile-img-tag" />
            <form action="Edit_Customer_Servlet" method="POST"   >
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" value="${list.id}" name="txtID"  ><span id="errID"></span></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" value="${list.customerName}" name="txtName" ><span id="errName"></span></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" value="${list.customerAddress}" name="txtAddress"  ><span id="errAddress"></span></td>
                </tr>
                <tr>
                    <td>Indentity Card</td>
                    <td><input type="text" value="${list.customerIndentityCard}" name="txtCard" value="card"><span id="errCard"></span></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="text" value="${list.phone}" name="txtPhone"  value="phone"><span id="errPhone"></span></td>
                </tr>
                <tr>
                    <td>Mail</td>
                    <td><input type="text" value="${list.mail}" name="txtMail"  value="mail"><span id="errMail"></span></td>
                </tr>
                
                <tr>
                    <td>Content</td>
                    <td><input type="text" value="${list.customerContent}" name="txtContent"  value="content"><span id="errContent"></span></td>
                </tr> 
                <tr>
                    <td>Image</td>
                    <td><input id="xFilePath" type="hidden" value="${list.customerImg}" name="txtImg"><span id="errContent"></span></td>
                    <td><input type="button" value="Browse Server" onclick="BrowseServer();" /></td>
                    
                </tr>
            </table>
            <input type="submit" value="Edit" />
        </form>
    </body>
</html>

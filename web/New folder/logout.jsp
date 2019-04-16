<%-- 
    Document   : logout
    Created on : Feb 28, 2019, 6:41:26 PM
    Author     : Cuong
--%>

    <%
        session.invalidate();
        response.sendRedirect(request.getContextPath()+"/LoginUser");
        %>

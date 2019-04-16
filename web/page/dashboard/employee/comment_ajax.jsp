<%-- 
    Document   : comment_ajax
    Created on : Apr 9, 2019, 10:19:52 PM
    Author     : Cuong
--%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="java.io.File"%>
<%@page import="javax.xml.transform.dom.DOMSource"%>
<%@page import="javax.xml.transform.Transformer"%>
<%@page import="javax.xml.transform.TransformerFactory"%>
<%@page import="org.w3c.dom.Attr"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%
    String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String connectionUrl = "jdbc:sqlserver://DESKTOP-EOI1GRB\\SQLEXPRESS:1433;databaseName=RealEstate";

    Connection connection = null;
    Statement statement = null;
    ResultSet rsReply = null;
    try {
        String idComment = request.getParameter("idComment");
        Class.forName(driver);
        connection = DriverManager.getConnection(connectionUrl, "sa", "123456");
        statement = connection.createStatement();

       // String sqlComment = "select * from comment where id_post ='" + idPost + "' and status_comment like 'accept'";
        String sqlReply = "select * from reply_comment where id_comment ='"+idComment+"' and status_reply like 'accept'";
        rsReply = statement.executeQuery(sqlReply);

        String table = "";
            while (rsReply.next()) {
                if (rsReply.getString("role_reply").equals("customer")) {
                        table += "<li class=comment__item>"
                                + "<div class=comment__item-body js-comment-item>"
                                + "<div class=comment__avatar><img src=" + rsReply.getString("id_user") + " ></div>"
                                + "<div class=comment__item-right>"
                                + "<button class=comment__item-btn>Edit</button>"
                                + "<button class=comment__item-btn>Delete</button>"
                                + "<div class=comment__content>"
                                + "<h4 class=comment__warning-title>Your comment is awaiting moderation.</h4>"
                                + "<p class=comment__warning-text>" + rsReply.getString("content") + "</p>"
                                + "</div>"
                                + "<button class=comment__reply js-comment-reply>Reply</button>"
                                + "</div>"
                                + "</div>"
                                + "</li>";
                    }
        }
        out.println(table);
        
        connection.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

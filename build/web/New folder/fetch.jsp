<%-- 
    Document   : fetch
    Created on : Apr 4, 2019, 1:50:16 PM
    Author     : Cuong
--%>

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
<%@page import="java.sql.Connection"%>
<%
    String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String connectionUrl = "jdbc:sqlserver://DESKTOP-EOI1GRB\\SQLEXPRESS:1433;databaseName=RealEstate";
    // public static final String xmlFilePath = "C:\\Users\\nikos7\\Desktop\\files\\xmlfile.xml";
    final String xmlFilePath = "D:\\Test GlassFish\\ProjectRealEstate\\web\\xmlfile.xml";

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    try {
        String roll_no = request.getParameter("d");
        Class.forName(driver);
        connection = DriverManager.getConnection(connectionUrl, "sa", "123456");
        statement = connection.createStatement();
        String sql = "SELECT * FROM assign_details WHERE date_to like '" + roll_no + "'";
        resultSet = statement.executeQuery(sql);

        int i = 0;
        String table = "<table id=123123><tr><th>Estate ID</th></tr>";
        while (resultSet.next()) {
            String city_name = resultSet.getString("estate_id");
            i++;
            

            table += "<tr><td>" + city_name + "</td></tr>";

        }
        table+="</table>";
        out.println(table);
        connection.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

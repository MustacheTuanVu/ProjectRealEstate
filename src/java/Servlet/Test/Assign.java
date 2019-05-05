/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Test;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "Assign", urlPatterns = {"/Assign"})
public class Assign extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String date = request.getParameter("d");
        System.out.println("Date " + date);

        //request.setContentType("application/json");
       // PrintWriter out = request.getWriter();
// JDBC driver name and database URL String 

        String JDBC_DRIVER = "com.sqlserver.jdbc.Driver";
        String DB_URL = "jdbc:sqlserver://DESKTOP-EOI1GRB\\SQLEXPRESS:1433;databaseName=RealEstate";
// Database credentials String USER = "root"; String PASS = "root"; 
        
        try {
            Class.forName(JDBC_DRIVER);
            Connection conn = DriverManager.getConnection(DB_URL, "sa", "123456");
            String query = "SELECT * FROM assign_details WHERE date_to=?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, date);
            ResultSet resultSet = preparedStatement.executeQuery();
           // JSONArray jsonArray = new JSONArray();
            while (resultSet.next()) {
                //jsonArray.put(resultSet.getString("country"));
            }
            //out.println(jsonArray);
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
        public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

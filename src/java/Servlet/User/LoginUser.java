/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.User;

import Controller.UsersJpaController;
import Entity.Users;
import java.io.IOException;
import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "LoginUser", urlPatterns = {"/LoginUser"})
public class LoginUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    UserTransaction utx;

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
        //processRequest(request, response);

        EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.UsersJpaController userCon = new UsersJpaController(utx, em);

        String username = request.getParameter("username");
        String pass = request.getParameter("password");

        HttpSession session = request.getSession();
        Users idUser = userCon.checkLogin(username, pass);

        if (idUser == null) {
            // Login fail*******
            System.out.println("sdfsd null");
        } else {
            switch (idUser.getRole()) {
                case "employee":
                    session.setAttribute("user", idUser);
                    session.setAttribute("employeePanel", "employeePanel");
                    response.sendRedirect(request.getContextPath() + "/index");
                    break;
                case "manager":
                    session.setAttribute("user", idUser);
                    session.setAttribute("ManagePanel", "ManagePanel");
                    response.sendRedirect(request.getContextPath() + "/index");
                    break; 
                case "director":
                    session.setAttribute("user", idUser);
                    session.setAttribute("DirectorPanel", "DirectorPanel");
                    response.sendRedirect(request.getContextPath() + "/index");
                    break; 
                case "customer":
                    session.setAttribute("user", idUser);
                    response.sendRedirect(request.getContextPath() + "/index");
                    break;
            }
        }
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

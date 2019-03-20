/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Director;

import Controller.AssignDetailsJpaController;
import Controller.EmployeeJpaController;
import Controller.EstateJpaController;
import Controller.exceptions.PreexistingEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.AssignDetails;
import Servlet.Estate.EstateCreate;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
@WebServlet(name = "AgreeSaleRequest", urlPatterns = {"/AgreeSaleRequest"})
public class AgreeSaleRequest extends HttpServlet {

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
        System.out.println("this 2");
        String estateID = request.getParameter("estateID");
        int employeeID = Integer.parseInt(request.getParameter("employeeID"));
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        AssignDetailsJpaController assignDetailsJpaController = new AssignDetailsJpaController(utx, emf);
        EmployeeJpaController employeeJpaController = new EmployeeJpaController(utx, emf);
        EstateJpaController estateJpaController = new EstateJpaController(utx, emf);
        AssignDetails assignDetails = new AssignDetails();
        assignDetails.setEstateId(estateJpaController.findEstate(estateID));
        assignDetails.setEmployeeId(employeeJpaController.findEmployee(employeeID));

        SimpleDateFormat sdff = new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
        Date date = new Date();
        try {
            assignDetails.setDateTo(sdff.parse(date.toString()));
            System.out.println("this 1");
        } catch (ParseException ex) {
            Logger.getLogger(EstateCreate.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            assignDetailsJpaController.create(assignDetails);
            
        } catch (PreexistingEntityException ex) {
            Logger.getLogger(AgreeSaleRequest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (RollbackFailureException ex) {
            Logger.getLogger(AgreeSaleRequest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(AgreeSaleRequest.class.getName()).log(Level.SEVERE, null, ex);
        }
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

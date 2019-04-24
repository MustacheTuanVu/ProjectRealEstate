/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Contract_Details;

import Controller.ContractDetailsJpaController;
import Controller.ContractJpaController;
import Controller.EstateJpaController;
import Controller.EstateStatusJpaController;
import Controller.EstateTypeJpaController;
import Controller.exceptions.PreexistingEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.Contract;
import Entity.ContractDetails;
import Entity.Estate;
import Entity.EstateStatus;
import Entity.EstateType;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Cuong
 */
@WebServlet(name = "Create_Contract_Details_Servlet", urlPatterns = {"/Create_Contract_Details_Servlet"})
public class Create_Contract_Details_Servlet extends HttpServlet {

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

        EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.ContractJpaController type = new ContractJpaController(utx, em);
        Controller.EstateJpaController estCon = new EstateJpaController(utx, em);
        
        request.setAttribute("list", type.findContractEntities());
        request.setAttribute("estCon", estCon.findEstateEntities());
        request.getRequestDispatcher("WEB-INF/contract_details/create_contract_details.jsp").forward(request, response);


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
        try {
            //processRequest(request, response);
            
            
            
            EntityManagerFactory em=(EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.EstateJpaController estCon= new EstateJpaController(utx, em);
            
            
            Entity.EstateStatus estSta= new EstateStatus(1);
            Entity.EstateType type= new EstateType((request.getParameter("estateTypeId")));
            
            Entity.Estate est=new Estate();
            String tam=String.valueOf(estCon.getEstateCount());
            est.setId("est"+tam);
            est.setEstateName(request.getParameter("estateName"));
            est.setEstateTypeId(type);
            est.setEstateDescription(null);
            est.setEstateStatusId(estSta);
            
            estCon.create(est);
            System.out.println("Create Completed...");
        } catch (RollbackFailureException ex) {
            Logger.getLogger(Create_Contract_Details_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Create_Contract_Details_Servlet.class.getName()).log(Level.SEVERE, null, ex);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Estate;

import Controller.EstateJpaController;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.Estate;
import Entity.EstateStatus;
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

/**
 *
 * @author Cuong
 */
@WebServlet(name = "EstateUpdateStatus", urlPatterns = {"/EstateUpdateStatus"})
public class EstateUpdateStatus extends HttpServlet {

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
         try {
            EntityManagerFactory emf=(EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.EstateJpaController estCon= new EstateJpaController(null, emf);
            
            String action=request.getParameter("action");
            String id=request.getParameter("id");
            
            Entity.Estate est= estCon.findEstate(id);
            Entity.EstateStatus sta= new EstateStatus();
            switch(action){
                case "Public":
                    sta.setId(2);
                    est.setEstateStatusId(sta);
                    estCon.edit(est);
                    
                    response.sendRedirect(request.getContextPath()+"/EstateListWaiting");
                    break;
                case "Trash":
                    sta.setId(3);
                    est.setEstateStatusId(sta);
                    estCon.edit(est);
                    
                    response.sendRedirect(request.getContextPath()+"/EstateListWaiting");
                    break;
            }
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(EstateUpdateStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (RollbackFailureException ex) {
            Logger.getLogger(EstateUpdateStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(EstateUpdateStatus.class.getName()).log(Level.SEVERE, null, ex);
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

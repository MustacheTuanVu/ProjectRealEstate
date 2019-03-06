/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.ContractType;

import Controller.ContractTypeJpaController;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.ContractType;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "ContractTypeEdit", urlPatterns = {"/ContractTypeEdit"})
public class ContractTypeEdit extends HttpServlet {

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
        
    
         EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.ContractTypeJpaController conType = new ContractTypeJpaController(utx, em);

        
        String a = request.getParameter("txtType");
        String id=request.getParameter("txtID");
        String message = "";
        String hasError = "";
        String display = "none";
        String modal="";
        List<ContractType> listType = conType.findContractTypeName(a);

        if (listType.size() > 0) {
            message = "Type exits !";
            hasError = "has-error";
            display = "block";
            modal = "show";

            request.setAttribute("id", id);
            request.setAttribute("estateTypeName", a);
            request.setAttribute("messageEdit", message);
            request.setAttribute("hasErrorEdit", hasError);
            request.setAttribute("displayEdit", display);
            request.setAttribute("modal", modal);

            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/ContractTypeList");
            dispatcher.forward(request, response);
        } else {
            
             try {
                 id = request.getParameter("txtID");
                 ContractType con= conType.findContractType(Integer.parseInt(id));
                 con.setContractTypeName((request.getParameter("txtType")));
                 conType.edit(con);
                 //response.sendRedirect(request.getContextPath()+"/ContractTypeList");
                 request.setAttribute("message","Edit Completed !!!");
                 request.getRequestDispatcher("/ContractTypeList").forward(request, response);
             } catch (NonexistentEntityException ex) {
                 Logger.getLogger(ContractTypeEdit.class.getName()).log(Level.SEVERE, null, ex);
             } catch (RollbackFailureException ex) {
                 Logger.getLogger(ContractTypeEdit.class.getName()).log(Level.SEVERE, null, ex);
             } catch (Exception ex) {
                 Logger.getLogger(ContractTypeEdit.class.getName()).log(Level.SEVERE, null, ex);
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

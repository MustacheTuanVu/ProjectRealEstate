/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.ContractType;

import Controller.ContractJpaController;
import Controller.ContractTypeJpaController;
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
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
@WebServlet(name = "ContractTypeCreate", urlPatterns = {"/ContractTypeCreate"})
public class ContractTypeCreate extends HttpServlet {

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

        HttpSession session = request.getSession();
        Entity.Users user = (Entity.Users) session.getAttribute("user");
        if (user != null) {
            if (user.getRole().equals("Admin")) {
                request.getRequestDispatcher("/page/dashboard/dashboard_contract_type.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/LoginUser");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/LoginUser");
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
        //processRequest(request, response);
        EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.ContractTypeJpaController conType = new ContractTypeJpaController(utx, em);

        String a = request.getParameter("txtType");
        String message = "";
        String hasError = "";
        String display = "none";
        List<ContractType> listType = conType.findContractTypeName(a);

        if (listType.size() > 0) {
            message = "Type exits !";
            hasError = "has-error";
            display = "block";
            request.setAttribute("message", message);
            request.setAttribute("hasError", hasError);
            request.setAttribute("display", display);

            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/ContractTypeList");
            dispatcher.forward(request, response);
        } else {
            Entity.ContractType type = new ContractType();
            type.setContractTypeName(a);
            try {

                conType.create(type);
                message = "Create New Completed !";
                
                request.setAttribute("message", message);
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/ContractTypeList");
                dispatcher.forward(request, response);
            } catch (RollbackFailureException ex) {
                Logger.getLogger(ContractTypeCreate.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ContractTypeCreate.class.getName()).log(Level.SEVERE, null, ex);
            }
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

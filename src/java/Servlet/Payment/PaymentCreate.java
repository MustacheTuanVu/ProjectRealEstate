/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Payment;

import Controller.PaymentFrequencyJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.ContractType;
import Entity.PaymentFrequency;
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
@WebServlet(name = "PaymentCreate", urlPatterns = {"/PaymentCreate"})
public class PaymentCreate extends HttpServlet {

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

        Controller.PaymentFrequencyJpaController pay = new PaymentFrequencyJpaController(utx, em);

        String a = request.getParameter("txtPay");
        String message = "";
        String hasError = "";
        String display = "none";
        List<ContractType> listType = pay.findPaymentName(a);

        if (listType.size() > 0) {
            message = "Payment Name exits !";
            hasError = "has-error";
            display = "block";
            request.setAttribute("message", message);
            request.setAttribute("hasError", hasError);
            request.setAttribute("display", display);

            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/PaymentList");
            dispatcher.forward(request, response);
        } else {

            Entity.PaymentFrequency type = new PaymentFrequency();
            type.setPaymentFrequencyName(a);
            try {
                //type.setContractList(listCon);
                pay.create(type);
                request.setAttribute("message", "Create New Completed !!!");
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/PaymentList");
                dispatcher.forward(request, response);
                // response.sendRedirect(request.getContextPath()+"/List_Payment_Servlet");
            } catch (RollbackFailureException ex) {
                Logger.getLogger(PaymentCreate.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(PaymentCreate.class.getName()).log(Level.SEVERE, null, ex);
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

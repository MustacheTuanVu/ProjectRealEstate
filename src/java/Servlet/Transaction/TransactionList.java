/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Transaction;

import Controller.ContractJpaController;
import Controller.CustomerJpaController;
import Controller.TransactionsJpaController;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "TransactionList", urlPatterns = {"/TransactionList"})
public class TransactionList extends HttpServlet {

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

        try {
            HttpSession session = request.getSession();
            Entity.Users user = (Entity.Users) session.getAttribute("user");

            if (user.getRole().equals("Admin")) {
                EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
                Controller.TransactionsJpaController con = new TransactionsJpaController(utx, em);
                Controller.CustomerJpaController cusCon = new CustomerJpaController(utx, em);
                Controller.ContractJpaController conCon = new ContractJpaController(utx, em);

                request.setAttribute("listCon", conCon.findContractEntities());
                request.setAttribute("listCus", cusCon.findCustomerEntities());
                request.setAttribute("list", con.findTransactionsEntities());

                request.getRequestDispatcher("/page/dashboard/dashboard_transaction.jsp").forward(request, response);

            } else {
                response.sendRedirect(request.getContextPath() + "/LoginUser");
            }
        } catch (NullPointerException e) {
            System.out.println("Err "+e.getMessage());
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

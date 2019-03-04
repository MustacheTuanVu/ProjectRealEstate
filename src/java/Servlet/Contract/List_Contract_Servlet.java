/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Contract;

import Controller.ContractJpaController;
import Controller.ContractTypeJpaController;
import Controller.CustomerJpaController;
import Controller.EmployeeJpaController;
import Controller.PaymentFrequencyJpaController;
import java.io.IOException;
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
@WebServlet(name = "ContractList", urlPatterns = {"/ContractList"})
public class List_Contract_Servlet extends HttpServlet {

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
        
        EntityManagerFactory em= (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.ContractJpaController con= new ContractJpaController(utx, em);
        
        Controller.ContractTypeJpaController conType= new ContractTypeJpaController(utx, em);
        Controller.CustomerJpaController cusCon= new CustomerJpaController(utx, em);
        Controller.EmployeeJpaController empCon= new EmployeeJpaController(utx, em);
        Controller.PaymentFrequencyJpaController payCon= new PaymentFrequencyJpaController(utx, em);
        //Controller.ContractJpaController conCon= new ContractJpaController(utx, em);
        
        request.setAttribute("listType", conType.findContractTypeEntities());
        request.setAttribute("listCus", cusCon.findCustomerEntities());
        request.setAttribute("listEmp", empCon.findEmployeeEntities());
        request.setAttribute("listPay", payCon.findPaymentFrequencyEntities());
        
        request.setAttribute("list", con.findContractEntities());
        request.getRequestDispatcher("/page/dashboard/dashboard_contract.jsp").forward(request, response);
        
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

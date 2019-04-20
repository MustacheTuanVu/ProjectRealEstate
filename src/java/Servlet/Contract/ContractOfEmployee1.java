/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Contract;

import Controller.ContractDetailsJpaController;
import Controller.EmployeeJpaController;
import Controller.EstateTypeJpaController;
import Entity.ContractDetails;
import Entity.Estate;
import Entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
 * @author kiems
 */
@WebServlet(name = "ContractOfEmployee1", urlPatterns = {"/ContractOfEmployee1"})
public class ContractOfEmployee1 extends HttpServlet {

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
        // BEGIN SESSION HEADER FONTEND //
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");
        
        if (users != null) {
            request.setAttribute("user", "user");
            request.setAttribute("displayLogin", "none");
            request.setAttribute("displayUser", "block");
            switch (users.getRole()) {
                case "employee":
                    session.setAttribute("name", users.getEmployee().getEmployeeName());
                    request.setAttribute("role", "employee");
                    session.setAttribute("image", users.getEmployee().getEmployeeImg());
                    break;
                case "manager":
                    session.setAttribute("name", users.getManager().getManagerName());
                    session.setAttribute("image", users.getManager().getManagerImg());
                    break;
                case "director":
                    session.setAttribute("name", "Boss");
                    request.setAttribute("role", "director");
                    session.setAttribute("image", "http://localhost:8080/ProjectRealEstate/assets/media-demo/boss.png");
                    break;
                case "customer":
                    session.setAttribute("name", users.getCustomer().getCustomerName());
                    session.setAttribute("image", users.getCustomer().getCustomerImg());
                    break;
            }
            
            /*-----------------------------------------------------------*/
            
            EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
            //CustomerJpaController customerControl = new CustomerJpaController(utx, emf);
            EmployeeJpaController employeeControl= new EmployeeJpaController(utx, emf);
            EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
            ContractDetailsJpaController contractDetailsControl = new ContractDetailsJpaController(utx, emf);
            
            EmployeeJpaController employeeJpaController = new EmployeeJpaController(utx, emf);
            
            request.setAttribute("employeeList", employeeJpaController.findEmployeeEntities());
            request.setAttribute("contractList", contractDetailsControl.findContractDetailsEntities());
            request.setAttribute("active","ContractOfEmployee1");
            request.getRequestDispatcher("/admin/page/dashboard/director/transaction.jsp").forward(request, response);
        
        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
            response.sendRedirect(request.getContextPath()+"/LoginUser");
        }
        // END SESSION HEADER FONTEND //
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

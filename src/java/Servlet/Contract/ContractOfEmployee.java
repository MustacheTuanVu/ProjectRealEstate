/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Contract;

import Controller.ContractDetailsJpaController;
import Controller.EmployeeJpaController;
import Controller.EstateTypeJpaController;
import Entity.Contract;
import Entity.ContractDetails;
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
 * @author Cuong
 */
@WebServlet(name = "ContractOfEmployee", urlPatterns = {"/ContractOfEmployee"})
public class ContractOfEmployee extends HttpServlet {

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
            request.setAttribute("users", "user");
            request.setAttribute("displayLogin", "none");
            request.setAttribute("displayUser", "block");
            session.setAttribute("name", users.getEmployee().getEmployeeName());
                    request.setAttribute("role", "customer");
            session.setAttribute("image", users.getEmployee().getEmployeeImg());
            
            /*-----------------------------------------------------------*/
            
            EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
            //CustomerJpaController customerControl = new CustomerJpaController(utx, emf);
            EmployeeJpaController employeeControl= new EmployeeJpaController(utx, emf);
            EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
            ContractDetailsJpaController contractDetailsControl = new ContractDetailsJpaController(utx, emf);
            //Customer customer = customerControl.findCustomer(users.getId());
            Entity.Employee employee=employeeControl.findEmployee(users.getEmployee().getId());
            
            //String keyword=(request.getParameter("searchInput")!=null)? request.getParameter("searchInput"):"";
            
            List<Entity.ContractDetails> listDetails=contractDetailsControl.getContractDetailsByContractID(employee.getId()) ;
            if (request.getParameter("searchInput")== "" || request.getParameter("searchInput")== null) {
               request.setAttribute("contractDetails", listDetails);
            }
            else{
                List<Entity.ContractDetails> listDetails1= new ArrayList<ContractDetails>();
                for (ContractDetails listDetail : listDetails) {
                    if (listDetail.getContractId().getCustomerId().getCustomerName().contains(request.getParameter("searchInput"))) {
                        System.out.println("name 1 "+listDetail.getContractId().getCustomerId().getCustomerName());
                    System.out.println("name key "+request.getParameter("searchInput"));
                        listDetails1.add(listDetail);
                    }
                }
                request.setAttribute("contractDetails", listDetails1);
            }
            
            request.setAttribute("employee", employee);
            
            request.setAttribute("estateTypeList", estateTypeControl.findEstateTypeEntities());
            request.getRequestDispatcher("/page/dashboard/employee/dashboard_contract_list.jsp").forward(request, response);
        
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

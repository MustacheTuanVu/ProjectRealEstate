/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Employee;

import Controller.ContractDetailsJpaController;
import Controller.CustomerJpaController;
import Controller.EmployeeJpaController;
import Controller.EstateTypeJpaController;
import Entity.Contract;
import Entity.ContractDetails;
import Entity.Customer;
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
@WebServlet(name = "CustomerOfEmployee", urlPatterns = {"/CustomerOfEmployee"})
public class CustomerOfEmployee extends HttpServlet {

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
            CustomerJpaController customerControl = new CustomerJpaController(utx, emf);
            EmployeeJpaController employeeControl = new EmployeeJpaController(utx, emf);
            EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
            ContractDetailsJpaController contractDetailsControl = new ContractDetailsJpaController(utx, emf);
            //System.out.println("employee id "+users.getEmployee().getId());
            List<Customer> customerList = customerControl.findCustomerByEMployeeID(users.getEmployee().getId());
            
            if (request.getParameter("searchInput")== "" || request.getParameter("searchInput")== null) {
               request.setAttribute("customerList", customerList);
            }
            else{
                List<Entity.Customer> listDetails1= new ArrayList<Customer>();
                for (Customer listDetail : customerList) {
                    if (listDetail.getCustomerName().contains(request.getParameter("searchInput"))) {
                        listDetails1.add(listDetail);
                    }
                }
                request.setAttribute("customerList", listDetails1);
            }
            //Entity.Employee employee = employeeControl.findEmployee(users.getEmployee().getId());

           // request.setAttribute("customer", customer);
            //request.setAttribute("contractDetails", contractDetailsControl.getContractDetailsByContractID(employee.getId()));
            request.setAttribute("estateTypeList", estateTypeControl.findEstateTypeEntities());
            //request.setAttribute("customerList", customerList);
            request.getRequestDispatcher("/admin/page/dashboard/employee/customer.jsp").forward(request, response);
        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
            response.sendRedirect(request.getContextPath() + "/LoginUser");
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

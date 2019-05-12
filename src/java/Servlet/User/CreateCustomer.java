/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.User;

import Controller.CustomerJpaController;
import Controller.EmployeeJpaController;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.Customer;
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
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "CreateCustomer", urlPatterns = {"/CreateCustomer"})
public class CreateCustomer extends HttpServlet {

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
        processRequest(request, response);
        HttpSession session = request.getSession();
        Entity.Users user = (Entity.Users) session.getAttribute("user");

        switch (user.getRole()) {
            case "customer":
                try {
                    EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                    Controller.CustomerJpaController customerControl = new CustomerJpaController(utx, emf);
                    
                    //String id = request.getParameter("txtID");
                    Entity.Customer customer = new Customer();
                    
                    System.out.println("customer "+customer);
                    customer.setCustomerName(request.getParameter("txtName"));
                    customer.setCustomerIndentityCard(request.getParameter("txtCard"));
                    customer.setCustomerAddress(request.getParameter("txtAddress"));
                    customer.setPhone(request.getParameter("txtPhone"));
                    customer.setMail(request.getParameter("txtMail"));
                    customer.setCustomerContent(request.getParameter("txtContent"));
                    customer.setCustomerImg(request.getParameter("txtImg"));
                    customer.setUserId(user);

                    customerControl.create(customer);

                    System.out.println("Create Completed !!!");

                    response.sendRedirect(request.getContextPath() + "/index?modal1=show");
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(CustomerDetails.class.getName()).log(Level.SEVERE, null, ex);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(CustomerDetails.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(CustomerDetails.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "employee":
                try {
                    EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                    Controller.EmployeeJpaController employeeControl = new EmployeeJpaController(utx, emf);
                    String id = request.getParameter("txtID");
                    Entity.Employee employee = employeeControl.findEmployee(Integer.valueOf(id));

                    employee.setEmployeeName(request.getParameter("txtName"));
                    employee.setEmployeeIndentityCard(request.getParameter("txtCard"));
                    employee.setEmployeeAddress(request.getParameter("txtAddress"));
                    employee.setEmployeePhone(request.getParameter("txtPhone"));
                    employee.setEmployeeMail(request.getParameter("txtMail"));
                    employee.setEmployeeContent(request.getParameter("txtContent"));
                    employee.setEmployeeImg(request.getParameter("txtImg"));

                    employeeControl.edit(employee);

                    System.out.println("Edit Completed !!!");

                    response.sendRedirect(request.getContextPath() + "/EditEmployee");
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(CustomerDetails.class.getName()).log(Level.SEVERE, null, ex);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(CustomerDetails.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(CustomerDetails.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
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

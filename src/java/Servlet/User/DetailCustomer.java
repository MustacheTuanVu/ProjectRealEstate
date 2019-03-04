/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.User;

import Controller.CustomerJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.Customer;
import Entity.Users;
import java.io.IOException;
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
@WebServlet(name = "DetailCustomer", urlPatterns = {"/DetailCustomer"})
public class DetailCustomer extends HttpServlet {

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

        System.out.println("12312312");
        HttpSession session= request.getSession();
        Entity.Users user=(Entity.Users) session.getAttribute("user");
        
        if ( user.getRole().equals("Customer")) {
            EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.CustomerJpaController cusCon = new CustomerJpaController(null, em);
            request.setAttribute("list", cusCon.findByIdUser(user));
            request.getRequestDispatcher("/page/dashboard/dashboard_profile.jsp").forward(request, response);
        }
        else
        {
            request.getRequestDispatcher("/page/dashboard/dashboard_login.jsp").include(request, response);
            System.out.println("123431");
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
//        processRequest(request, response);
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
        try {
            
            EntityManagerFactory em=(EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.CustomerJpaController cusCon= new CustomerJpaController(utx, em);
            
            HttpSession session = request.getSession();
            
            Entity.Users user = new Users(Integer.parseInt((String) session.getAttribute("id").toString())); // point
            Customer customer = cusCon.findCustomer(Integer.parseInt(request.getParameter("txtID")));
            
            customer.setCustomerName(request.getParameter("txtName"));
            customer.setCustomerAddress(request.getParameter("txtAddress"));
            customer.setCustomerIndentityCard(request.getParameter("txtCard"));
            customer.setPhone(request.getParameter("txtPhone"));
            customer.setMail(request.getParameter("txtMail"));
            customer.setCustomerContent(request.getParameter("txtContent"));
            customer.setUserId(user);
            customer.setCustomerImg(request.getParameter("txtImg"));
            
            cusCon.edit(customer);
            
            System.out.println("edit completrd ...");
        } catch (RollbackFailureException ex) {
            Logger.getLogger(DetailCustomer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DetailCustomer.class.getName()).log(Level.SEVERE, null, ex);
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

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
import javax.persistence.EntityManager;
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
@WebServlet(name = "Add_Infor_User", urlPatterns = {"/Add_Infor_User"})
public class Add_Infor_User extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.getRequestDispatcher("WEB-INF/user/add_infor_user.jsp").forward(request, response);
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
    UserTransaction utx;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            //processRequest(request, response);

            EntityManagerFactory emf= (EntityManagerFactory) getServletContext().getAttribute("emf");
            EntityManager em = emf.createEntityManager();
            Controller.CustomerJpaController cusCon= new CustomerJpaController(utx, emf);  
            
            HttpSession session = request.getSession();
            Entity.Customer customer = new Customer();

            int user = Integer.parseInt((String) session.getAttribute("id").toString());
            Users users = em.getReference(Users.class, user);

            customer.setCustomerName(request.getParameter("txtName"));
            customer.setCustomerAddress(request.getParameter("txtAddress"));
            customer.setCustomerIndentityCard(request.getParameter("txtCard"));
            customer.setPhone(request.getParameter("txtPhone"));
            customer.setMail(request.getParameter("txtMail"));
            customer.setCustomerContent(request.getParameter("txtContent"));
            customer.setUserId(users);
            customer.setCustomerImg("123");
            
            cusCon.create(customer);
            
            System.out.println("add new completrd ...");
        } catch (RollbackFailureException ex) {
            Logger.getLogger(Add_Infor_User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Add_Infor_User.class.getName()).log(Level.SEVERE, null, ex);
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

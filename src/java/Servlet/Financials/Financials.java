/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Financials;

import Controller.EstateJpaController;
import Controller.PostJpaController;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "Financials", urlPatterns = {"/Financials"})
public class Financials extends HttpServlet {

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

            request.setAttribute("users", "user");
            request.setAttribute("displayLogin", "none");
            request.setAttribute("displayUser", "block");
            session.setAttribute("name", user.getEmployee().getEmployeeName());
            request.setAttribute("role", "employee");
            session.setAttribute("image", user.getEmployee().getEmployeeImg());
            /*-----------------------------------------------------------*/

            EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");

            Controller.EstateJpaController estCon = new EstateJpaController(utx, emf);
            Controller.PostJpaController postController = new PostJpaController(utx, emf);

        //List<String> listEstate=estCon.getEstateByEmployee(user.getEmployee().getId().toString());
            //count total post by employee
            request.setAttribute("countPost", postController.getCountPostByEmployeeID(user.getEmployee().getId()));
            // count total customer of employee
            request.setAttribute("countCustomer", postController.getCountCustomerByEmployeeID(user.getEmployee().getId()));
            // count total Contract
            request.setAttribute("countContract", estCon.countContract(user.getEmployee().getId()));
            
            
            // count total Money
            request.setAttribute("countMoney", estCon.countMoney().toString());
            // count total Transaction
            request.setAttribute("countTransaction", estCon.countTransaction().toString());
            
            // count total Customer
            request.setAttribute("countCustomer", estCon.countCustomer().toString());
            // count total Employee
            request.setAttribute("countEmployee", estCon.countEmployee().toString());
            // count total estate sold
            request.setAttribute("countEstateSold", estCon.countEstateSold().toString());
            // count total estate
            request.setAttribute("countEstate", estCon.countEstate().toString());
            request.getRequestDispatcher("/page/dashboard/employee/dashboard_financials.jsp").forward(request, response);

        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
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

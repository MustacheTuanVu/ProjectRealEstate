/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.User;

import Controller.UsersJpaController;
import Controller.exceptions.RollbackFailureException;
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
import javax.transaction.UserTransaction;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "EditUser", urlPatterns = {"/EditUser"})
public class Edit_User_Servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String action=null;
    String id = null;
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.UsersJpaController user = new UsersJpaController(utx, em);

        action = request.getParameter("action");
        id = request.getParameter("id");

        request.setAttribute("u", user.findUsers(Integer.valueOf(id)));
        request.getRequestDispatcher("WEB-INF/user/edit_user.jsp").forward(request, response);
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
//        processRequest(request, response);
        
        System.out.println("doPost "+id);
        EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
                Controller.UsersJpaController userCon = new UsersJpaController(utx, em);
                Entity.Users user = new Users();
        
        if (!request.getParameter("txtOldPass").equals((userCon.findUsers(Integer.valueOf(id))).getPassword())) {
                System.out.println("Old password is not correct");
            }
            else {
                
                try {

                    user.setId(Integer.valueOf(id));
                    user.setUsername(request.getParameter("txtUser"));
                    user.setPassword(request.getParameter("txtNewPass"));
                    user.setStatus(true);
                    user.setRole(("Customer"));
                    userCon.edit(user);
                    
                    
                    System.out.println("Edit Completed");
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, ex);
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

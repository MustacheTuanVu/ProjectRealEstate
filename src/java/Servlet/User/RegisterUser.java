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
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "RegisterUser", urlPatterns = {"/RegisterUser"})
public class RegisterUser extends HttpServlet {

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
        session.invalidate();
        request.getRequestDispatcher("/page/guest/dashboard_register.jsp").forward(request, response);
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
        //processRequest(request, response);

        EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.UsersJpaController userCon = new UsersJpaController(utx, em);
        Entity.Users user = new Users();

        String a = request.getParameter("name");
        String returnPage="/page/guest/dashboard_register.jsp";

        String message = (request.getParameter("message") != null) ? request.getParameter("message") : "";
        String display = (request.getParameter("display") != null) ? request.getParameter("display") : "none";
        String hasError = (request.getParameter("hasError") != null) ? request.getParameter("hasError") : "";
        request.setAttribute("message", message);
        request.setAttribute("display", display);
        
        if (userCon.checkUser(a).size() > 0) {
            System.out.println("Username exsit !!!");
            message = "Username exsit !!!";
            display = "block";
            hasError = "has-error";
            request.setAttribute("message", message);
            request.setAttribute("display", display);
            response.sendRedirect(request.getContextPath() + "/RegisterUser?"
                                + "message="+message+"&"
                                + "display="+display+"&"
                                + "hasError="+hasError+""
                        );
           // request.getRequestDispatcher("/page/guest/dashboard_register.jsp").forward(request, response);
        } else {
            try {
                user.setUsername(request.getParameter("name"));
                user.setPassword(request.getParameter("password"));
                user.setStatus(true);
                user.setRole("customer");

                userCon.create(user);
                System.out.println("Register completed !!!");
                //response.sendRedirect(request.getContextPath()+"/LoginUser");
               // request.getRequestDispatcher("/page/dashboard_login.jsp").forward(request, response);
                returnPage="/page/dashboard_login.jsp";
            } catch (RollbackFailureException ex) {
                Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        request.getRequestDispatcher(returnPage).forward(request, response);
        
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

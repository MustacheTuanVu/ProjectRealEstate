/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Employee;

import Controller.EmployeeJpaController;
import Controller.ManagerJpaController;
import Controller.UsersJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.Customer;
import Entity.Employee;
import Entity.Users;
import Servlet.User.RegisterUser;
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
@WebServlet(name = "EditEmployee", urlPatterns = {"/EditEmployee"})
public class EditEmployee extends HttpServlet {

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
        String message = (request.getParameter("message") != null) ? request.getParameter("message") : "";
        String display = (request.getParameter("display") != null) ? request.getParameter("display") : "none";
        String hasError = (request.getParameter("hasError") != null) ? request.getParameter("hasError") : "";
        request.setAttribute("message", message);
        request.setAttribute("display", display);
        request.setAttribute("hasError", hasError);
        if (user != null) {
            request.setAttribute("users", "user");
            request.setAttribute("displayLogin", "none");
            request.setAttribute("displayUser", "block");
            session.setAttribute("name", user.getEmployee().getEmployeeName());
            request.setAttribute("role", "employee");
            session.setAttribute("image", user.getEmployee().getEmployeeImg());

            /*-----------------------------------------------------------*/
            EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.EmployeeJpaController managerController = new EmployeeJpaController(utx, emf);

            //request.getParameter("employeeID");
            Employee customer = managerController.findEmployee(user.getEmployee().getId());
            request.setAttribute("customer", customer);
            request.getRequestDispatcher("/admin/page/dashboard/employee/info_employee.jsp").forward(request, response);
        }
        else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
            response.sendRedirect(request.getContextPath()+"/LoginUser");
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
            
            HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        System.out.println("User ID " + user.getId());
        EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.UsersJpaController userCon = new UsersJpaController(utx, em);

        String txtOldPass=request.getParameter("txtOldPass");
        String oldPass=(user.getPassword());
        
        String message = (request.getParameter("message") != null) ? request.getParameter("message") : "";
        String display = (request.getParameter("display") != null) ? request.getParameter("display") : "none";
        String hasError = (request.getParameter("hasError") != null) ? request.getParameter("hasError") : "";
        request.setAttribute("message", message);
        request.setAttribute("display", display);
        if (!txtOldPass.equals(oldPass)) {
            System.out.println("new Pass "+txtOldPass);
            System.out.println("old pass "+oldPass);
            message = "Old Password Incorrect !!!";
            display = "block";
            hasError = "has-error";
            request.setAttribute("message", message);
            request.setAttribute("display", display);
            response.sendRedirect(request.getContextPath() + "/EditEmployee?"
                                + "message="+message+"&"
                                + "display="+display+"&"
                                + "hasError="+hasError+""
                        );
        } else {
            try {
                user.setPassword(request.getParameter("txtNewPass"));
                user.setStatus(true);
                user.setRole(("employee"));
                userCon.edit(user);

                session.invalidate();
                System.out.println("Edit Completed");
                response.sendRedirect(request.getContextPath()+"/LoginUser");
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
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }

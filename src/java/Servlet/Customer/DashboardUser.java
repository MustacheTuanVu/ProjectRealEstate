/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Customer;

import Controller.CustomerJpaController;
import Controller.EstateJpaController;
import Controller.EstateTypeJpaController;
import Controller.UsersJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.Customer;
import Entity.Users;
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
 * @author kiems
 */
@WebServlet(name = "DashboardUser", urlPatterns = {"/DashboardUser"})
public class DashboardUser extends HttpServlet {

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
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.EstateJpaController estateController = new EstateJpaController(utx, emf);
        if (users != null) {
            request.setAttribute("users", "user");
            request.setAttribute("displayLogin", "none");
            request.setAttribute("displayUser", "block");
            if (estateController.checkInforUser(users.getId().toString()) == 1) {
                session.setAttribute("name", users.getCustomer().getCustomerName());
                request.setAttribute("role", "customer");
                session.setAttribute("image", users.getCustomer().getCustomerImg());
            } else {
                session.setAttribute("name", users.getUsername());
                request.setAttribute("role", "customer");
            }

            /*-----------------------------------------------------------*/
            String message = (request.getParameter("message") != null) ? request.getParameter("message") : "";
            String display = (request.getParameter("display") != null) ? request.getParameter("display") : "none";
            String hasError = (request.getParameter("hasError") != null) ? request.getParameter("hasError") : "";
            request.setAttribute("message", message);
            request.setAttribute("display", display);
            request.setAttribute("hasError", hasError);

            CustomerJpaController customerControl = new CustomerJpaController(utx, emf);
            EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);

            if (estateController.checkInforUser(users.getId().toString()) == 1) {
                Customer customer = customerControl.findCustomer(users.getCustomer().getId());
                request.setAttribute("customer", customer);
            }
            request.setAttribute("estateTypeList", estateTypeControl.findEstateTypeEntities());
            switch (users.getRole()) {
                case "customer":
                    if (estateController.checkInforUser(users.getId().toString()) == 1) {
                        request.getRequestDispatcher("/page/guest/dashboard_user.jsp").forward(request, response);
                    }else{
                        request.getRequestDispatcher("/page/guest/dashboard_user_create.jsp").forward(request, response);
                    }
                    
                    break;
                case "employee":
                    request.getRequestDispatcher("/page/guest/dashboard_infor_employee.jsp").forward(request, response);
                    break;
            }
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
        //processRequest(request, response);
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        System.out.println("User ID " + user.getId());
        EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.UsersJpaController userCon = new UsersJpaController(utx, em);

        String txtOldPass = request.getParameter("txtOldPass");
        String oldPass = (user.getPassword());

        String message = (request.getParameter("message") != null) ? request.getParameter("message") : "";
        String display = (request.getParameter("display") != null) ? request.getParameter("display") : "none";
        String hasError = (request.getParameter("hasError") != null) ? request.getParameter("hasError") : "";
        request.setAttribute("message", message);
        request.setAttribute("display", display);
        if (!txtOldPass.equals(oldPass)) {
            System.out.println("new Pass " + txtOldPass);
            System.out.println("old pass " + oldPass);
            message = "Mật Khẩu Cũ Không Đúng !!!";
            display = "block";
            hasError = "has-error";
            request.setAttribute("message", message);
            request.setAttribute("display", display);
            response.sendRedirect(request.getContextPath() + "/DashboardUser?"
                    + "message=" + message + "&"
                    + "display=" + display + "&"
                    + "hasError=" + hasError + ""
            );
        } else {
            try {
                user.setPassword(request.getParameter("txtNewPass"));
                user.setStatus(true);
                user.setRole(("customer"));
                userCon.edit(user);
                session.invalidate();

                response.sendRedirect(request.getContextPath() + "/LoginUser");
            } catch (RollbackFailureException ex) {
                Logger.getLogger(DashboardUser.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(DashboardUser.class.getName()).log(Level.SEVERE, null, ex);
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

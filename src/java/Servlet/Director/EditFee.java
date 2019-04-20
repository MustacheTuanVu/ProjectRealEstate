/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Director;

import Controller.EmployeeJpaController;
import Controller.EstateTypeJpaController;
import Controller.FeeJpaController;
import Controller.ManagerJpaController;
import Controller.UsersJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.Employee;
import Entity.EstateType;
import Entity.Fee;
import Entity.Manager;
import Entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "EditFee", urlPatterns = {"/EditFee"})
public class EditFee extends HttpServlet {

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
        Entity.Users user = (Entity.Users) session.getAttribute("user");
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
        if (user != null) {
            request.setAttribute("user", "user");
            request.setAttribute("displayLogin", "none");
            request.setAttribute("displayUser", "block");
            switch (user.getRole()) {
                case "employee":
                    session.setAttribute("name", user.getEmployee().getEmployeeName());
                    request.setAttribute("role", "employee");
                    session.setAttribute("image", user.getEmployee().getEmployeeImg());
                    break;
                case "manager":
                    session.setAttribute("name", user.getManager().getManagerName());
                    session.setAttribute("image", user.getManager().getManagerImg());
                    break;
                case "director":
                    session.setAttribute("name", "Boss");
                    request.setAttribute("role", "director");
                    session.setAttribute("image", "http://localhost:8080/ProjectRealEstate/assets/media-demo/boss.png");
                    break;
                case "customer":
                    session.setAttribute("name", user.getCustomer().getCustomerName());
                    session.setAttribute("image", user.getCustomer().getCustomerImg());
                    break;
            }
            FeeJpaController feeJpaController = new FeeJpaController(utx, emf);
            Fee fee = feeJpaController.findFee(1);
            request.setAttribute("fee", fee);
            if (request.getParameter("submit") != null) {
                String feeEmployee = request.getParameter("feeEmployee");
                String feeCompany = request.getParameter("feeCompany");

                UsersJpaController usersJpaController = new UsersJpaController(utx, emf);
                
                fee.setFeeEmployee(Integer.parseInt(feeEmployee));
                fee.setFeeEstate(Integer.parseInt(feeCompany));

                EmployeeJpaController employeeJpaController = new EmployeeJpaController(utx, emf);
                ManagerJpaController managerJpaController = new ManagerJpaController(utx, emf);

                try {
                    feeJpaController.edit(fee);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(EditFee.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(EditFee.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
        }
        // END SESSION HEADER FONTEND //

        // BEGIN NAVBAR HEADER FONTEND //
        List<EstateType> estateTypeList = estateTypeControl.findEstateTypeEntities();
        request.setAttribute("estateTypeList", estateTypeList);
        request.getRequestDispatcher("/page/dashboard/director/dashboard_fee.jsp").forward(request, response);
        // END NAVBAR HEADER FONTEND //
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

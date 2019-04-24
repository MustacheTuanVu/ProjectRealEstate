/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Director;

import Controller.AssignDetailsJpaController;
import Controller.EmployeeJpaController;
import Controller.EstateJpaController;
import Controller.EstateTypeJpaController;
import Controller.FeatureDetailsJpaController;
import Controller.UsersJpaController;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.AssignDetails;
import Entity.Employee;
import Entity.Estate;
import Entity.EstateType;
import Entity.FeatureDetails;
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
@WebServlet(name = "EstateArgree", urlPatterns = {"/EstateArgree"})
public class EstateArgree extends HttpServlet {

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
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        UsersJpaController usersJpaController = new UsersJpaController(utx, emf);
        EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
        EstateJpaController estateJpaController = new EstateJpaController(utx, emf);
        EmployeeJpaController employeeJpaController = new EmployeeJpaController(utx, emf);
        AssignDetailsJpaController assignDetailsJpaController = new AssignDetailsJpaController(utx, emf);
        FeatureDetailsJpaController featureDetailsJpaController = new FeatureDetailsJpaController(utx, emf);
        

        // BEGIN SESSION HEADER FONTEND //
        HttpSession session = request.getSession();
        Entity.Users user = (Entity.Users) session.getAttribute("user");
        if (user.getRole().equals("director")) {
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

            String choice = (request.getParameter("choice") != null) ? request.getParameter("choice") : "";
            if(choice.equals("add")){
                String estateID = request.getParameter("estateID");
                Estate estate = estateJpaController.findEstate(estateID);
                estate.setEstateStatus("publish");
                try {
                    estateJpaController.edit(estate);
                    response.sendRedirect(request.getContextPath()+"/EstateList?user=director&filter=waitting%20for%20director");
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(EstateArgree.class.getName()).log(Level.SEVERE, null, ex);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(EstateArgree.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(EstateArgree.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }else if(choice.equals("remove")){
                String estateID = request.getParameter("estateID");
                Estate estate = estateJpaController.findEstate(estateID);
                List<FeatureDetails> featureDetails = estate.getFeatureDetailsList();
                AssignDetails assignDetails = estate.getAssignDetails();
                try {
                    assignDetailsJpaController.destroy(assignDetails.getId());
                    for (FeatureDetails featureDetail : featureDetails) {
                        featureDetailsJpaController.destroy(featureDetail.getFeatureDetailsId());
                    }
                    estateJpaController.destroy(estateID);
                    response.sendRedirect(request.getContextPath()+"/EstateList?user=director&filter=waitting%20for%20director");
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(EstateArgree.class.getName()).log(Level.SEVERE, null, ex);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(EstateArgree.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(EstateArgree.class.getName()).log(Level.SEVERE, null, ex);
                }
            }else{
                // BEGIN NAVBAR HEADER FONTEND //
                List<EstateType> estateTypeList = estateTypeControl.findEstateTypeEntities();
                request.setAttribute("estateTypeList", estateTypeList);
                request.getRequestDispatcher("/page/dashboard/director/dashboard_userList.jsp").forward(request, response);
                // END NAVBAR HEADER FONTEND //
            }
        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
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

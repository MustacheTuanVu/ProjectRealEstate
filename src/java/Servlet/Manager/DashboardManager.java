/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Manager;

import Controller.EstateTypeJpaController;
import Entity.EstateType;
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
 * @author kiems
 */
@WebServlet(name = "DashboardManager", urlPatterns = {"/DashboardManager"})
public class DashboardManager extends HttpServlet {

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
        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
        }
        // END SESSION HEADER FONTEND //
        
        // BEGIN NAVBAR HEADER FONTEND //
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
        List<EstateType> estateTypeList = estateTypeControl.findEstateTypeEntities();
        request.setAttribute("estateTypeList", estateTypeList);
        request.getRequestDispatcher("/page/dashboard/manager/index.jsp").forward(request, response);
        // END NAVBAR HEADER FONTEND //
       HttpSession session = request.getSession();
        Entity.Users user = (Entity.Users) session.getAttribute("user");
        if (user != null) {
            if(user.getRole().equals("manager")){
                session.setAttribute("name", user.getManager().getManagerName());
                request.setAttribute("role", "manager");
                session.setAttribute("image", user.getManager().getManagerImg());
                request.setAttribute("active","Manager");
                request.getRequestDispatcher("/admin/page/dashboard/manager/index.jsp").forward(request, response);
            }else{
                response.sendRedirect(request.getContextPath()+"/admin");
            }
        }else{
            response.sendRedirect(request.getContextPath()+"/admin");
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

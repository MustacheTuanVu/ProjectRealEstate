/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.User;

import Controller.EstateTypeJpaController;
import Controller.UsersJpaController;
import Entity.EstateType;
import Entity.Users;
import java.io.IOException;
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
@WebServlet(name = "LoginUser", urlPatterns = {"/LoginUser"})
public class LoginUser extends HttpServlet {

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
        String modal = (request.getParameter("modal") != null) ? request.getParameter("modal") : "";
        String mess = (request.getParameter("err") != null) ? request.getParameter("err") : "";
        request.setAttribute("modal", modal);
        request.setAttribute("err", mess);
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
                    request.setAttribute("role", "manager");
                    session.setAttribute("image", user.getManager().getManagerImg());
                    break;
                case "director":
                    session.setAttribute("name", "Boss");
                    request.setAttribute("role", "director");
                    session.setAttribute("image", "http://localhost:8080/ProjectRealEstate/assets/media-demo/boss.png");
                    break;
                case "customer":
                    session.setAttribute("name", user.getCustomer().getCustomerName());
                    request.setAttribute("role", "customer");
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
        // END NAVBAR HEADER FONTEND //
        request.getRequestDispatcher("/page/dashboard/dashboard_login.jsp").forward(request, response);
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

        String username = request.getParameter("username");
        String pass = request.getParameter("password");

        HttpSession session = request.getSession();
        Users idUser = userCon.checkLogin(username, pass);

        if (idUser == null) {
            /* cuong add */
            //response.sendRedirect(request.getContextPath()+"/Login?modal=show&err=Login");
            request.setAttribute("modal", "show");
            request.setAttribute("err", "Login Fail !!!");
            request.getRequestDispatcher("/page/dashboard/dashboard_login.jsp").forward(request, response);
        } else {
            switch (idUser.getRole()) {
                case "employee":
                    session.setAttribute("user", idUser);
                    session.setAttribute("employeePanel", "employeePanel");
                    response.sendRedirect(request.getContextPath() + "/index?"
                        + "modal=show&"
                        + "nameLogin="+idUser.getEmployee().getEmployeeName()+""
                    );
                    break;
                case "manager":
                    session.setAttribute("user", idUser);
                    session.setAttribute("ManagePanel", "ManagePanel");
                    response.sendRedirect(request.getContextPath() + "/index?"
                        + "modal=show&"
                        + "nameLogin="+idUser.getManager().getManagerName()+""
                    );
                    break; 
                case "director":
                    session.setAttribute("user", idUser);
                    session.setAttribute("DirectorPanel", "DirectorPanel");
                    response.sendRedirect(request.getContextPath() + "/index?"
                        + "modal=show&"
                        + "nameLogin=Boss"
                    );
                    break; 
                case "customer":
                    session.setAttribute("user", idUser);
                    response.sendRedirect(request.getContextPath() + "/index?"
                        + "modal=show&"
                        + "nameLogin="+idUser.getCustomer().getCustomerName()+""
                    );
                    break;
            }
            
            /*cuong add*/
            /*
                response.sendRedirect(request.getContextPath() + "/index?"
                    + "modal=show&"
                    + "nameLogin="+idUser.getEmployee().getEmployeeName()+""
                );
            */
            
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

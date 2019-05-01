/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Employee;

import Controller.ContractDetailsJpaController;
import Controller.EstateJpaController;
import Entity.ContractDetails;
import Entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "RequestSaleList", urlPatterns = {"/RequestSaleList"})
public class RequestSaleList extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    /* cuong add */
    //--------------------------
    // Cuong request Sale List
    UserTransaction utx;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");

        if (users != null) {
            
                request.setAttribute("users", "user");
            request.setAttribute("displayLogin", "none");
            request.setAttribute("displayUser", "block");
            session.setAttribute("name", users.getEmployee().getEmployeeName());
            session.setAttribute("employeeID", users.getEmployee().getId());
            request.setAttribute("role", "employee");
            session.setAttribute("image", users.getEmployee().getEmployeeImg());

            //*********************************************
            
            EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
            ContractDetailsJpaController contractDetailsJpaController = new ContractDetailsJpaController(utx, emf);
            Controller.EstateJpaController estateController= new EstateJpaController(utx, emf);
            
            //List<ContractDetails> contracttDetailList = contractDetailsJpaController.getContractDetailsByEmployeeIDSale(users.getEmployee().getId());
            
            List<Entity.Estate> listEstate=new ArrayList<>();
//            for (ContractDetails contracttDetailList1 : contracttDetailList) {
//                listEstate.add(estateController.findEstate(contracttDetailList1.getEstateId().getId()));
//            }
            
            request.setAttribute("estateList", listEstate);
            request.getRequestDispatcher("/page/dashboard/employee/dashboard_requestsale_list.jsp").forward(request, response);
        } else {
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

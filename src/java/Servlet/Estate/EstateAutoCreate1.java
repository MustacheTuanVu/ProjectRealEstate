/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Estate;

import Controller.EstateTypeJpaController;
import Entity.EstateType;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
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
@WebServlet(name = "EstateAutoCreate1", urlPatterns = {"/EstateAutoCreate1"})
public class EstateAutoCreate1 extends HttpServlet {

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
            if (user.getRole().equals("manager")) {
                EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                EntityManager em = emf.createEntityManager();

                request.setAttribute("user", "user");
                request.setAttribute("displayLogin", "none");
                request.setAttribute("displayUser", "block");

                session.setAttribute("name", user.getManager().getManagerName());
                request.setAttribute("role", "manager");
                session.setAttribute("image", user.getManager().getManagerAddress());
                EstateTypeJpaController estateType = new EstateTypeJpaController(utx, emf);
                List<EstateType> estateTypeList = estateType.findEstateTypeEntities();
                request.setAttribute("estateTypeList", estateTypeList);

                String block = null;
                String estateNumber = null;
                String estateNumbers = null;
                String projectID = request.getParameter("projectID");
                request.setAttribute("projectID", projectID);
                System.out.println(projectID);
                if (request.getParameter("getBlock") != null) {
                    block = request.getParameter("block");
                    estateNumber = request.getParameter("estateNumber");
                    estateNumbers = request.getParameter("estateNumber");
                    response.sendRedirect(request.getContextPath() + "/EstateAutoCreate?"
                            + "projectID=" + projectID + "&"
                            + "block=" + block + "&"
                            + "estateNumbers=" + estateNumbers + "&"
                            + "getBlock=yes&"
                            + "estateNumber=" + estateNumber + "");
                }else{
                    request.getRequestDispatcher("/admin/page/dashboard/manager/create_estate_of_project_1.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/LoginUser");
            }
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

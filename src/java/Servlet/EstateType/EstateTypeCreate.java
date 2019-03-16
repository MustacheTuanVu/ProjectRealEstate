/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.EstateType;

import Controller.EstateTypeJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.EstateType;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "EstateTypeCreate", urlPatterns = {"/EstateTypeCreate"})
public class EstateTypeCreate extends HttpServlet {

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
            if (user.getRole().equals("employee")) {
                request.setAttribute("user", "user");
                request.setAttribute("displayLogin", "none");
                request.setAttribute("displayUser", "block");

                session.setAttribute("name", user.getEmployee().getEmployeeName());
                request.setAttribute("role", "employee");
                session.setAttribute("image", user.getEmployee().getEmployeeImg());

                EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);

                String estateTypeName = request.getParameter("estateTypeName");

                int indexID = 1;
                //String estateID = estateTypeName + indexID;
                String estateID = "1";

                while (true) {
                    if (estateTypeControl.findEstateType(estateID) != null) {
                        indexID = indexID + 1;
                        estateID = String.valueOf(indexID);
                    } else {
                        break;
                    }
                }

                String message = "";
                String hasError = "";
                String display = "none";
                List<EstateType> estateTypeList = (List<EstateType>) estateTypeControl.getEstateTypeByName(estateTypeName);
                if (estateTypeList.size() > 0) {
                    message = "Type exits !";
                    hasError = "has-error";
                    display = "block";
                    request.setAttribute("message", message);
                    request.setAttribute("hasError", hasError);
                    request.setAttribute("display", display);

                    RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/EstateTypeList");
                    dispatcher.forward(request, response);
                } else {
                    EstateType estateType = new EstateType();
                    estateType.setId(estateID);
                    estateType.setTypeName(estateTypeName);
                    try {
                        estateTypeControl.create(estateType);
                        response.sendRedirect(request.getContextPath() + "/EstateTypeList");
                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(EstateTypeCreate.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(EstateTypeCreate.class.getName()).log(Level.SEVERE, null, ex);
                    }
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.EstateType;

import Controller.EstateTypeJpaController;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.EstateType;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "EstateTypeEdit", urlPatterns = {"/EstateTypeEdit"})
public class EstateTypeEdit extends HttpServlet {

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
            if (user.getRole().equals("director")) {
                request.setAttribute("user", "user");
                request.setAttribute("displayLogin", "none");
                request.setAttribute("displayUser", "block");

                session.setAttribute("name", "Boss");
                request.setAttribute("role", "director");
                session.setAttribute("image", "http://localhost:8080/ProjectRealEstate/assets/media-demo/boss.png");

                EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);

                String id = request.getParameter("estateTypeID");
                String estateTypeName = request.getParameter("estateTypeName");
                System.out.println(id);
                EstateType find = estateTypeControl.findEstateType(id);
                find.setTypeName(estateTypeName);

                String message = "";
                String hasError = "";
                String display = "none";
                String modal = "hidden";
                List<EstateType> estateTypeList = (List<EstateType>) estateTypeControl.getEstateTypeByName(estateTypeName);

                if (estateTypeList.size() > 0) {
                    message = "Type exits !";
                    hasError = "has-error";
                    display = "block";
                    modal = "show";

                    request.setAttribute("id", id);
                    request.setAttribute("estateTypeName", estateTypeName);
                    request.setAttribute("messageEdit", message);
                    request.setAttribute("hasErrorEdit", hasError);
                    request.setAttribute("displayEdit", display);
                    request.setAttribute("modal", modal);

                    RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/EstateTypeList");
                    dispatcher.forward(request, response);
                } else {
                    try {
                        estateTypeControl.edit(find);
                    } catch (NonexistentEntityException ex) {
                        Logger.getLogger(EstateTypeEdit.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(EstateTypeEdit.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(EstateTypeEdit.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    response.sendRedirect(request.getContextPath() + "/EstateTypeList");
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Feature;

import Controller.FeaturesJpaController;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.Features;
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
@WebServlet(name = "FeatureEdit", urlPatterns = {"/FeatureEdit"})
public class FeatureEdit extends HttpServlet {

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
                FeaturesJpaController featuresControl = new FeaturesJpaController(utx, emf);

                String id = request.getParameter("featureID");
                String featureName = request.getParameter("featureName");
                System.out.println(id);
                Features find = featuresControl.findFeatures(id);
                find.setFeatureName(featureName);

                String message = "";
                String hasError = "";
                String display = "none";
                String modal = "hiden";
                List<Features> estateTypeList = (List<Features>) featuresControl.getFeatureByName(featureName);

                if (estateTypeList.size() > 0) {
                    message = "Type exits !";
                    hasError = "has-error";
                    display = "block";
                    modal = "show";

                    request.setAttribute("id", id);
                    request.setAttribute("featureName", featureName);
                    request.setAttribute("messageEdit", message);
                    request.setAttribute("hasErrorEdit", hasError);
                    request.setAttribute("displayEdit", display);
                    request.setAttribute("modal", modal);

                    RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/FeatureList");
                    dispatcher.forward(request, response);
                } else {
                    try {
                        featuresControl.edit(find);
                    } catch (NonexistentEntityException ex) {
                        Logger.getLogger(FeatureEdit.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(FeatureEdit.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(FeatureEdit.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    response.sendRedirect(request.getContextPath() + "/FeatureList");
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.CategoryJpaController;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.Category;
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
 * @author Cuong
 */
@WebServlet(name = "CategoryEdit", urlPatterns = {"/CategoryEdit"})
public class CategoryEdit extends HttpServlet {

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
    UserTransaction utx;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
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
                Controller.CategoryJpaController featuresControl = new CategoryJpaController(utx, emf);

                String id = request.getParameter("categoryID");
                String featureName = request.getParameter("categoryName");
                System.out.println(" qwe "+id);
                Entity.Category find = featuresControl.findCategory(Integer.valueOf(id));
                find.setCategoryName(featureName);

                String message = "";
                String hasError = "";
                String display = "none";
                String modal = "hiden";
                List<Category> estateTypeList = (List<Category>) featuresControl.getCategoryByName(featureName);

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

                    RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/CategoryList");
                    dispatcher.forward(request, response);
                } else {
                    try {
                        featuresControl.edit(find);
                        
                        response.sendRedirect(request.getContextPath() + "/CategoryList");
                    } catch (NonexistentEntityException ex) {
                        Logger.getLogger(CategoryEdit.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(CategoryEdit.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(CategoryEdit.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/LoginUser");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/LoginUser");
        }
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

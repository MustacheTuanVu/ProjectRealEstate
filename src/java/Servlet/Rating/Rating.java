/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Rating;

import Controller.RatingJpaController;
import Entity.Project;
import Entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Cuong
 */
@WebServlet(name = "Rating", urlPatterns = {"/Rating"})
public class Rating extends HttpServlet {

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
        
        EntityManagerFactory emf=(EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.RatingJpaController ratingController= new RatingJpaController(utx, emf);
        
        String point=request.getParameter("point");
        String id=request.getParameter("idProject");
        Entity.Users user= null;
        HttpSession session=request.getSession();
        // chua dang nhap
        if (session.getAttribute("user")== null) {
            response.getWriter().write("0");
            return;
        }else 
            // dang nhap thanh cong nhung da rating cho du an nay roi
            if (true) {
            user=(Users) session.getAttribute("user");
            if (ratingController.checkUserRatingByIdUser(user.getId(),id)>0) {
                response.getWriter().write("1");
                return;
            }else{
                try {
                    // dang nhap thanh cong va rating cho du an
                    Entity.Rating rating=new Entity.Rating();
                    rating.setCatRating("project");
                    rating.setIdProject(new Project(id));
                    rating.setIdUser(user);
                    rating.setPointRating(Integer.valueOf(point));
                    
                    ratingController.create(rating);
                    
                    response.getWriter().write("2");
                } catch (Exception ex) {
                    Logger.getLogger(Rating.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
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

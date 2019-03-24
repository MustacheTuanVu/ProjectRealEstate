/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Customer;

import Controller.CategoryJpaController;
import Controller.PostJpaController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "BlogListAllUser", urlPatterns = {"/BlogListAllUser"})
public class BlogListAllUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /* cuong add*/
    UserTransaction utx;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.PostJpaController postController = new PostJpaController(utx, emf);
            Controller.CategoryJpaController catController= new CategoryJpaController(utx, emf);

        if (request.getParameter("cat").equals("all") || request.getParameter("cat")== null) {
            request.setAttribute("listPost", postController.getAllPost());
            request.setAttribute("listCat", catController.findCategoryEntities());
            request.getRequestDispatcher("/page/dashboard/guest/blog.jsp").forward(request, response);
        }
        else{
            int cat=Integer.valueOf(request.getParameter("cat"));
            
            request.setAttribute("listPost", postController.getPostByCategoryName(cat));
            request.setAttribute("listCat", catController.findCategoryEntities());
            request.getRequestDispatcher("/page/dashboard/guest/blog.jsp").forward(request, response);
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

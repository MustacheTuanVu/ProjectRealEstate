/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Post;

import Controller.CategoryJpaController;
import Controller.EmployeeJpaController;
import Controller.PostJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.Category;
import Entity.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "PostCreate", urlPatterns = {"/PostCreate"})
public class PostCreat extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        Entity.Users user = (Entity.Users) session.getAttribute("user");

        if (user != null) {
            if (user.getRole().equals("Employee")) {
                EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                Controller.CategoryJpaController catCon = new CategoryJpaController(null, emf);
                request.setAttribute("list", catCon.findCategoryEntities());
                request.getRequestDispatcher("/page/dashboard/dashboard_blog_new.jsp").forward(request, response);
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try {
                processRequest(request, response);

                EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                Controller.PostJpaController postCon = new PostJpaController(null, emf);
                Controller.EmployeeJpaController empCon = new EmployeeJpaController(null, emf);

                Date date = new Date();
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

                HttpSession session = request.getSession();

                Entity.Users user = (Entity.Users) session.getAttribute("user");
                Entity.Employee emp = empCon.findEmployee(user.getEmployee().getId());
                Entity.Category cat = new Category(Integer.valueOf(request.getParameter("cat")));
                Entity.Post post = new Entity.Post();

                post.setEmployee(emp);
                post.setPostCategory(cat);
                post.setPostContent(request.getParameter("editor1"));
                post.setPostDate(date);
                post.setPostImage("123");
                post.setPostTilte(request.getParameter("title"));

                postCon.create(post);

            } catch (RollbackFailureException ex) {
                Logger.getLogger(PostCreat.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(PostCreat.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Employee;

import Controller.CategoryJpaController;
import Controller.PostJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.Category;
import Entity.Employee;
import Entity.Post;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;
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
@WebServlet(name = "CreateBlog", urlPatterns = {"/CreateBlog"})
public class CreateBlog extends HttpServlet {

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

            request.setAttribute("users", "user");
            request.setAttribute("displayLogin", "none");
            request.setAttribute("displayUser", "block");
            session.setAttribute("name", user.getEmployee().getEmployeeName());
            request.setAttribute("role", "employee");
            session.setAttribute("image", user.getEmployee().getEmployeeImg());
            /*-----------------------------------------------------------*/

            
        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
            response.sendRedirect(request.getContextPath() + "/LoginUser");
        }
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.CategoryJpaController catController = new CategoryJpaController(utx, emf);

            String myModalFail = (request.getParameter("myModalFail") != null) ? request.getParameter("myModalFail") : "";
            request.setAttribute("myModalFail", myModalFail);
            request.setAttribute("list", catController.findCategoryEntities());
            request.getRequestDispatcher("/page/dashboard/employee/dashboard_blog_new.jsp").forward(request, response);
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
        try {
            //processRequest(request, response);

            HttpSession session = request.getSession();
            Entity.Users user = (Entity.Users) session.getAttribute("user");

            EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.PostJpaController postController = new PostJpaController(utx, emf);

            Entity.Post post = new Post();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            post.setEmployee(new Employee(user.getEmployee().getId()));
            post.setPostCategory(new Category(Integer.valueOf(request.getParameter("cat"))));
            post.setPostContent(request.getParameter("editor1"));
            post.setPostImage(request.getParameter("txtImg"));
            post.setPostTilte(request.getParameter("title"));
            post.setPostDate(format.parse(format.format(date)));

            if (postController.checkPostByNameAndCat(Integer.valueOf(request.getParameter("cat")), request.getParameter("title")) == 0) {
                postController.create(post);
                System.out.println("Create Completed !!!");
                response.sendRedirect(request.getContextPath() + "/BlogList?action=Create&modal=show");
            } else {
                response.sendRedirect(request.getContextPath() + "/CreateBlog?myModalFail=show");
            }
        } catch (RollbackFailureException ex) {
            Logger.getLogger(CreateBlog.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CreateBlog.class.getName()).log(Level.SEVERE, null, ex);
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

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
@WebServlet(name = "EditBlog", urlPatterns = {"/EditBlog"})
public class EditBlog extends HttpServlet {

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
            try {
                request.setAttribute("users", "user");
                request.setAttribute("displayLogin", "none");
                request.setAttribute("displayUser", "block");
                session.setAttribute("name", user.getEmployee().getEmployeeName());
                request.setAttribute("role", "employee");
                session.setAttribute("image", user.getEmployee().getEmployeeImg());
                /*-----------------------------------------------------------*/

                String action = request.getParameter("action");
                int idPost = Integer.valueOf(request.getParameter("idPost"));
                EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                Controller.PostJpaController postController = new PostJpaController(utx, emf);

                switch (action) {
                    case "edit":
                        Controller.CategoryJpaController catController = new CategoryJpaController(utx, emf);
                        request.setAttribute("list", catController.findCategoryEntities());
                        request.setAttribute("post", postController.findPost(idPost));
                        request.getRequestDispatcher("/admin/page/dashboard/employee/edit_blog.jsp").forward(request, response);
                        break;
                    case "delete":
                        postController.destroy(idPost);
                        response.sendRedirect(request.getContextPath() + "/BlogList");
                        break;
                }
            } catch (RollbackFailureException ex) {
                Logger.getLogger(EditBlog.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(EditBlog.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
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
        
//        String title=request.getParameter("title")!=null ? request.getParameter("title") :" ";
//        String cat=request.getParameter("cat")!=null ? request.getParameter("cat") :"0";
//        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
//        
//        Controller.PostJpaController postController= new PostJpaController(utx, emf);
//        if (postController.checkPostByNameAndCat(Integer.valueOf(cat), title)==0) {
//            response.getWriter().write("0");
//            
//        }else {
//            response.getWriter().write("1");
//            
//        }
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
//            processRequest(request, response);
            HttpSession session = request.getSession();
            Entity.Users user = (Entity.Users) session.getAttribute("user");
            EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.PostJpaController postController = new PostJpaController(utx, emf);
            
            Entity.Post post = postController.findPost(Integer.valueOf(request.getParameter("idPost")));

            //post.setEmployee(new Employee(user.getEmployee().getId()));
            post.setPostCategory(new Category(Integer.valueOf(request.getParameter("cat"))));
            post.setPostContent(request.getParameter("editor1"));
            post.setPostImage(request.getParameter("txtImg"));
            post.setPostTilte(request.getParameter("title"));

            postController.edit(post);

            response.sendRedirect(request.getContextPath() + "/BlogList?action=Edit&modalEdit=show");
        } catch (RollbackFailureException ex) {
            Logger.getLogger(EditBlog.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(EditBlog.class.getName()).log(Level.SEVERE, null, ex);
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

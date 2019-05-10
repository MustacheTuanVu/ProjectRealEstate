/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Employee;

import Controller.CategoryJpaController;
import Controller.PostJpaController;
import java.io.IOException;
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
@WebServlet(name = "BlogList", urlPatterns = {"/BlogList"})
public class BlogList extends HttpServlet {

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

        String modal = (request.getParameter("modal") != null) ? request.getParameter("modal") : "";
        request.setAttribute("modal", modal);
        String modalEdit = (request.getParameter("modalEdit") != null) ? request.getParameter("modalEdit") : "";
        request.setAttribute("modalEdit", modalEdit);
        String action = (request.getParameter("action") != null) ? request.getParameter("action") : "";
        request.setAttribute("action", action);
        
        System.out.println("action "+action);

        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.PostJpaController postController = new PostJpaController(utx, emf);
        Controller.CategoryJpaController catController = new CategoryJpaController(utx, emf);

        
        request.setAttribute("listCat", catController.findCategoryEntities());
        request.setAttribute("listPost", postController.getPostByEmployee(user.getEmployee().getId().toString()));
        request.getRequestDispatcher("/admin/page/dashboard/employee/blog.jsp").forward(request, response);

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
        //processRequest(request, response);
        
        HttpSession session= request.getSession();
        Entity.Users user= (Entity.Users) session.getAttribute("user");
        EntityManagerFactory emf=(EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.PostJpaController postController= new PostJpaController(utx, emf);
        Controller.CategoryJpaController catController = new CategoryJpaController(utx, emf);
        
        if (request.getParameter("cat")== null && request.getParameter("dateTu")== null && request.getParameter("dateDen")== null) {
            request.setAttribute("listCat", catController.findCategoryEntities());
        request.setAttribute("listPost", postController.getPostByEmployee(user.getEmployee().getId().toString()));
        request.getRequestDispatcher("/admin/page/dashboard/employee/blog.jsp").forward(request, response);
        }else{
            int cat= Integer.valueOf(request.getParameter("cat"));
        String dateTu=request.getParameter("dateTu");
        String dateDen=request.getParameter("dateDen");
        
        
        //postController.searchPostByFilter(key, dateTu, dateDen, cat);
       
        request.setAttribute("listCat", catController.findCategoryEntities());
        request.setAttribute("listPost", postController.searchPostByFilter(user.getEmployee().getId(), dateTu, dateDen, cat));
        request.getRequestDispatcher("/admin/page/dashboard/employee/blog.jsp").forward(request, response);
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
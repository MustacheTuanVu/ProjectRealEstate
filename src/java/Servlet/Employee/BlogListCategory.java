/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Employee;

import Controller.PostJpaController;
import Entity.Post;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "BlogListCategory", urlPatterns = {"/BlogListCategory"})
public class BlogListCategory extends HttpServlet {

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

        HttpSession session = request.getSession();
        Entity.Users user = (Entity.Users) session.getAttribute("user");

        if (user != null) {
            if (user.getRole().equals("employee")) {

                request.setAttribute("users", "user");
                request.setAttribute("displayLogin", "none");
                request.setAttribute("displayUser", "block");
                session.setAttribute("name", user.getEmployee().getEmployeeName());
                request.setAttribute("role", "employee");
                session.setAttribute("image", user.getEmployee().getEmployeeImg());
            } else if (user.getRole().equals("customer")) {

                request.setAttribute("users", "user");
                request.setAttribute("displayLogin", "none");
                request.setAttribute("displayUser", "block");
                session.setAttribute("name", user.getCustomer().getCustomerName());
                request.setAttribute("role", "customer");
                session.setAttribute("image", user.getCustomer().getCustomerImg());
            }
            /*-----------------------------------------------------------*/
            int idCat = Integer.valueOf(request.getParameter("cat"));
            EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                Controller.PostJpaController postController = new PostJpaController(utx, emf);
                
                //request.setAttribute("listCount", postController.getPostByCategory());
                request.setAttribute("listCount", postController.getPostByCategory1());
                //request.setAttribute("listCat", catController.getCategoryCount());
                request.setAttribute("listPost", postController.getPostByCategoryName(idCat));
                System.out.println("post "+postController.getPostByCategoryName(idCat));
                
                List<Post> postList = postController.getPostByCategoryName(idCat);
                
                for (Post postList1 : postList) {
                    System.out.println("------" + postList1.getPostCategory() + "------");
                    System.out.println("this 1: " + postList1.getPostId());
                    System.out.println("this 2: " + postList1.getPostTilte());
                    System.out.println("this 3: " + postList1.getPostImage());
                    System.out.println("this 4: " + postList1.getEmployee());
                    System.out.println("this 5: " + postList1.getPostDate());
                }
                
                request.getRequestDispatcher("/page/dashboard/employee/dashboard_blog.jsp").forward(request, response);

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
       // processRequest(request, response);
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

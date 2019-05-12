/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Employee;

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
@WebServlet(name = "TestCheckBlog", urlPatterns = {"/TestCheckBlog"})
public class TestCheckBlog extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TestCheckBlog</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TestCheckBlog at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //processRequest(request, response);
        
        String title=request.getParameter("title")!=null ? request.getParameter("title") :" ";
        int cat=Integer.valueOf(request.getParameter("cat")!=null ? request.getParameter("cat") :"0");
        String idPost=request.getParameter("idPost")!=null ? request.getParameter("idPost") :"0";
        
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        
        Controller.PostJpaController postController= new PostJpaController(utx, emf);
        
        if (postController.checkPostByNameEdit(title, idPost)== 1) {
            if ((cat)== postController.checkPostByCatEdit(title)) {
                
                response.getWriter().write("1");
            }else{
                response.getWriter().write("0");
            }
        }else{
                response.getWriter().write("0");
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
        //processRequest(request, response);
        String title=request.getParameter("title")!=null ? request.getParameter("title") :" ";
        String cat=request.getParameter("cat")!=null ? request.getParameter("cat") :"0";
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        
        Controller.PostJpaController postController= new PostJpaController(utx, emf);
        if (postController.checkPostByNameAndCat(Integer.valueOf(cat), title)==0) {
            response.getWriter().write("0");
            
        }else {
            response.getWriter().write("1");
            
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

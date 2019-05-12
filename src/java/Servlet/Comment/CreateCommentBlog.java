/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Comment;

import Controller.CommentJpaController;
import Controller.ReplyCommentJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.Comment;
import Entity.Post;
import Entity.ReplyComment;
import Servlet.Employee.BlogDetails;
import Servlet.Project.ProjectDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "CreateCommentBlog", urlPatterns = {"/CreateCommentBlog"})
public class CreateCommentBlog extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateCommentBlog</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateCommentBlog at " + request.getContextPath() + "</h1>");
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
    UserTransaction utx;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
        
         HttpSession session = request.getSession();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String a = format.format(new Date());
        EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.CommentJpaController commentController = new CommentJpaController(utx, em);
        Controller.ReplyCommentJpaController replyController = new ReplyCommentJpaController(utx, em);
        String action = request.getParameter("action");
        Entity.Comment comment = new Comment();
        Entity.ReplyComment reply = new ReplyComment();
        String role = null;
        String idProject = request.getParameter("txtIDPost");;
        // create comment 
        if (action.equals("comment")) {
            try {
                comment.setIdPost(new Post(Integer.valueOf(request.getParameter("txtIDPost"))));
                comment.setContent(request.getParameter("txtComment"));
                comment.setDateComment(format.parse(a));

                // not login and comment
                if (session.getAttribute("user") == null) {
                    try {
                        comment.setRoleComment("guest");
                        comment.setEmailComment(request.getParameter("txtEmailComment"));
                        comment.setNameComment(request.getParameter("txtNameComment"));
                        comment.setStatusComment("wait");

                        commentController.create(comment);
                        response.sendRedirect(request.getContextPath() + "/BlogDetails?id=" + idProject+"&modal=show");
                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(BlogDetails.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(BlogDetails.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    Entity.Users user = (Entity.Users) session.getAttribute("user");
                    switch (user.getRole()) {
                        case "employee":
                            role = "employee";
                            comment.setStatusComment("accept");
                            break;
                        case "customer":
                            role = "customer";
                            comment.setStatusComment("wait");
                            break;
                    }
                    comment.setIdUser(user);
                    comment.setRoleComment(role);
                    commentController.create(comment);
                    response.sendRedirect(request.getContextPath() + "/BlogDetails?id=" + idProject+"&modal=show");
                }
            } catch (ParseException ex) {
                Logger.getLogger(BlogDetails.class.getName()).log(Level.SEVERE, null, ex);
            } catch (RollbackFailureException ex) {
                Logger.getLogger(BlogDetails.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(BlogDetails.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else // reply comment
        if (action.equals("reply")) {

            reply.setIdComment(new Comment(Integer.valueOf(request.getParameter("txtIdComment"))));
            reply.setContent(request.getParameter("txtReplyContent"));
            try {
                reply.setDateReply(format.parse(a));
            } catch (ParseException ex) {
                Logger.getLogger(ProjectDetails.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (session.getAttribute("user") == null) {
                try {
                    reply.setEmailReply(request.getParameter("txtEmailReply"));
                    reply.setNameReply(request.getParameter("txtNameReply"));
                    reply.setRoleReply("guest");
                    reply.setStatusReply("wait");

                    replyController.create(reply);
                    response.sendRedirect(request.getContextPath() + "/BlogDetails?id=" + idProject+"&modal=show");
                } catch (Exception ex) {
                    Logger.getLogger(ProjectDetails.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                Entity.Users user = (Entity.Users) session.getAttribute("user");
                switch (user.getRole()) {
                    case "employee":
                        role = "employee";
                        reply.setStatusReply("accept");
                        break;
                    case "customer":
                        role = "customer";
                        reply.setStatusReply("wait");
                        break;
                }
                reply.setIdUser(user);
                reply.setRoleReply(role);

                System.out.println("id_comment " + reply.getIdComment());
                System.out.println("id_user " + reply.getIdUser());
                System.out.println("[content] " + reply.getContent());
                System.out.println("date_reply " + reply.getDateReply());
                System.out.println("status_reply " + reply.getStatusReply());
                System.out.println("role_reply " + reply.getRoleReply());
                System.out.println("role_reply " + reply.getRoleReply());

                try {
                    replyController.create(reply);
                    response.sendRedirect(request.getContextPath() + "/BlogDetails?id=" + idProject+"&modal=show");
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(BlogDetails.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(BlogDetails.class.getName()).log(Level.SEVERE, null, ex);
                }

                //response.sendRedirect(request.getContextPath() + "/ProjectDetails?projectId=" + idProject);

            }
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

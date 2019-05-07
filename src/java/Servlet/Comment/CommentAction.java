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
import Entity.ReplyComment;
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
import javax.transaction.UserTransaction;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "CommentAction", urlPatterns = {"/CommentAction"})
public class CommentAction extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            
            System.out.println("lít comment "+request.getParameter("Comment"));
            
            EntityManagerFactory em= (EntityManagerFactory) getServletContext().getAttribute("emf");
            
            String action=request.getParameter("action");
            String id=request.getParameter("id");
            System.out.println("action "+action);
            System.out.println("id "+id);
            
            Controller.CommentJpaController commentController= new CommentJpaController(utx, em);
            Controller.ReplyCommentJpaController replyController= new ReplyCommentJpaController(utx, em);
            
            Entity.Comment comment= commentController.findComment(Integer.valueOf(id));
            Entity.ReplyComment reply= replyController.findReplyComment(Integer.valueOf(id));
            
            switch(action){
                case "acceptComment":
                    comment.setStatusComment("accept");
                    commentController.edit(comment);
                    response.sendRedirect(request.getContextPath()+"/ListCommentWait");
                    break;
                case "deleteComment":
                    comment.setStatusComment("delete");
                    commentController.edit(comment);
                    response.sendRedirect(request.getContextPath()+"/ListCommentWait");
                    break;
                case "acceptReply":
                    reply.setStatusReply("accept");
                    replyController.edit(reply);
                    response.sendRedirect(request.getContextPath()+"/ListCommentWait");
                    break;
                case "deleteReply":
                    reply.setStatusReply("delete");
                    replyController.edit(reply);
                    response.sendRedirect(request.getContextPath()+"/ListCommentWait");
                    break;
            }
        } catch (RollbackFailureException ex) {
            Logger.getLogger(CommentAction.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CommentAction.class.getName()).log(Level.SEVERE, null, ex);
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

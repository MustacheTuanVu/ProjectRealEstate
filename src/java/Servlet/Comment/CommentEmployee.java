/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Comment;

import Controller.CommentJpaController;
import Controller.ReplyCommentJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.ReplyComment;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
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
@WebServlet(name = "CommentEmployee", urlPatterns = {"/CommentEmployee"})
public class CommentEmployee extends HttpServlet {

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
        HttpSession session = request.getSession();
        Entity.Users user = (Entity.Users) session.getAttribute("user");

        int idCom = Integer.valueOf(request.getParameter("idComment"));
        
        EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.ReplyCommentJpaController replyController = new ReplyCommentJpaController(utx, em);

        List<Entity.ReplyComment> reply = replyController.getReplyComment(idCom);
        SimpleDateFormat format= new SimpleDateFormat("dd-MM-yyyy");

        String table = "";
        if (session.getAttribute("user") != null) {

            if (user.getRole().equals("employee")) {
                for (ReplyComment reply1 : reply) {
                    // login employee and display info employee
                    if (reply1.getRoleReply().equals("employee")) {
                        table += "<li class=comment__item>"
                                + "<div class=comment__item-body js-comment-item>"
                                + "<div class=comment__avatar><img width=\"64px\" height=\"64px\" src="+reply1.getIdUser().getEmployee().getEmployeeImg()+" ></div>"
                                + "<div class=comment__item-right>"
                                + "<button class=\"comment__item-btn\" onclick=\"deleteCommentOrReply("+reply1.getIdReply()+", 'reply')\" >Xóa</button>"
                                + "</div>"
                                + "<div class=comment__info><span class=comment__author>" + reply1.getIdUser().getEmployee().getEmployeeName() + "&nbsp-Admin</span><span class=comment__date>"+format.format(reply1.getDateReply())+"</span>"
                                + "<div class=comment__content>"
                                + "<p >" + reply1.getContent() + "</p>"
                                + "</div>"
                                + "</div>"
                                + "</div>"
                                + "</li>";
                    }
                    // login employee and display info customer
                    if (reply1.getRoleReply().equals("customer")) {
                        table += "<li class=comment__item>"
                                + "<div class=comment__item-body js-comment-item>"
                                + "<div class=comment__avatar><img width=\"64px\" height=\"64px\" src=" + reply1.getIdUser().getCustomer().getCustomerImg() + " ></div>"
                                + "<div class=comment__item-right>"
                                + "<button class=\"comment__item-btn\" onclick=\"deleteCommentOrReply("+reply1.getIdReply()+", 'reply')\" >Xóa</button>"
                                + "</div>"
                                + "<div class=comment__info><span class=comment__author>" + reply1.getIdUser().getCustomer().getCustomerName() + "</span><span class=comment__date>"+format.format(reply1.getDateReply())+"</span>"
                                + "<div class=comment__content>"
                                + "<p >" + reply1.getContent() + "</p>"
                                + "</div>"
                                + "</div>"
                                + "</div>"
                                + "</li>";
                    }
                    // login employee and display info guest
                    if (reply1.getRoleReply().equals("guest")) {
                        table += "<li class=comment__item>"
                                + "<div class=comment__item-body js-comment-item>"
                                + "<div class=comment__avatar><img width=\"64px\" height=\"64px\" src=CKFinderJava/userfiles/images/123.png ></div>"
                                + "<div class=comment__item-right>"
                                + "<button class=\"comment__item-btn\" onclick=\"deleteCommentOrReply("+reply1.getIdReply()+", 'reply')\" >Xóa"
                                + "</button>"
                                + "</div>"
                                + "<div class=comment__info><span class=comment__author>" + reply1.getNameReply() + " - " + reply1.getEmailReply() + "</span><span class=comment__date>"+format.format(reply1.getDateReply())+"</span>"
                                + "<div class=comment__content>"
                                + "<p >" + reply1.getContent() + "</p>"
                                + "</div>"
                                + "</div>"
                                + "</div>"
                                + "</li>";
                    }
                }
                response.getWriter().write(table);
            } // login other 
            else {
                for (ReplyComment reply1 : reply) {
                    // login other and display info employee
                    if (reply1.getRoleReply().equals("employee")) {
                        table += "<li class=comment__item>"
                                + "<div class=comment__item-body js-comment-item>"
                                + "<div class=comment__avatar><img width=\"64px\" height=\"64px\" src=" + reply1.getIdUser().getEmployee().getEmployeeImg() + " ></div>"
                                + "<div class=comment__item-right>"
                                + "</div>"
                                + "<div class=comment__info><span class=comment__author>" + reply1.getIdUser().getEmployee().getEmployeeName() + "&nbsp-Admin</span><span class=comment__date>"+format.format(reply1.getDateReply())+"</span>"
                                + "<div class=comment__content>"
                                + "<p >" + reply1.getContent() + "</p>"
                                + "</div>"
                                + "</div>"
                                + "</div>"
                                + "</li>";
                    }
                    // login other and display info customer
                    if (reply1.getRoleReply().equals("customer")) {
                        table += "<li class=comment__item>"
                                + "<div class=comment__item-body js-comment-item>"
                                + "<div class=comment__avatar><img width=\"64px\" height=\"64px\" src=" + reply1.getIdUser().getCustomer().getCustomerImg() + " ></div>"
                                + "<div class=comment__item-right>"
                                + "</div>"
                                + "<div class=comment__info><span class=comment__author>" + reply1.getIdUser().getCustomer().getCustomerName() + "</span><span class=comment__date>"+format.format(reply1.getDateReply())+"</span>"
                                + "<div class=comment__content>"
                                + "<p >" + reply1.getContent() + "</p>"
                                + "</div>"
                                + "</div>"
                                + "</div>"
                                + "</li>";
                    }
                    // login other and display info guest
                    if (reply1.getRoleReply().equals("guest")) {
                        table += "<li class=comment__item>"
                                + "<div class=comment__item-body js-comment-item>"
                                + "<div class=comment__avatar><img width=\"64px\" height=\"64px\" src=CKFinderJava/userfiles/images/123.png ></div>"
                                + "<div class=comment__item-right>"
                                + "</div>"
                                + "<div class=comment__info><span class=comment__author>" + reply1.getNameReply() + " - " + reply1.getEmailReply() + "</span><span class=comment__date>"+format.format(reply1.getDateReply())+"</span>"
                                + "<div class=comment__content>"
                                + "<p >" + reply1.getContent() + "</p>"
                                + "</div>"
                                + "</div>"
                                + "</div>"
                                + "</li>";
                    }
                }
                response.getWriter().write(table);
            }
            // when session == null
        } else {
            for (ReplyComment reply1 : reply) {
                // session == null and display info employee
                
                if (reply1.getRoleReply().equals("employee")) {
                    table += "<li class=comment__item>"
                            + "<div class=comment__item-body js-comment-item>"
                            + "<div class=comment__avatar><img width=\"64px\" height=\"64px\" src=" + reply1.getIdUser().getEmployee().getEmployeeImg() + " ></div>"
                            + "<div class=comment__item-right>"
                            + "</div>"
                            + "<div class=comment__info><span class=comment__author>" + reply1.getIdUser().getEmployee().getEmployeeName() + "&nbsp-Admin</span><span class=comment__date>"+format.format(reply1.getDateReply())+"</span>"
                            + "<div class=comment__content>"
                            + "<p >" + reply1.getContent() + "</p>"
                            + "</div>"
                            + "</div>"
                            + "</div>"
                            + "</li>";
                }
                // session == null and display info customer
                if (reply1.getRoleReply().equals("customer")) {
   //                 System.out.println("id user "+reply1.getIdUser().getCustomer());
                    table += "<li class=comment__item>"
                            + "<div class=comment__item-body js-comment-item>"
                            + "<div class=comment__avatar><img width=\"64px\" height=\"64px\" src=" + reply1.getIdUser().getCustomer().getCustomerImg() + " ></div>"
                            + "<div class=comment__item-right>"
                            + "</div>"
                            + "<div class=comment__info><span class=comment__author>" + reply1.getIdUser().getCustomer().getCustomerName() + "</span><span class=comment__date>"+format.format(reply1.getDateReply())+"</span>"
                            + "<div class=comment__content>"
                            + "<p >" + reply1.getContent() + "</p>"
                            + "</div>"
                            + "</div>"
                            + "</div>"
                            + "</li>";
                }
                // session == null and display info guest
                if (reply1.getRoleReply().equals("guest")) {
                    table += "<li class=comment__item>"
                            + "<div class=comment__item-body js-comment-item>"
                            + "<div class=comment__avatar><img width=\"64px\" height=\"64px\" src=CKFinderJava/userfiles/images/123.png ></div>"
                            + "<div class=comment__item-right>"
                            + "</div>"
                            + "<div class=comment__info><span class=comment__author>" + reply1.getNameReply() + " - " + reply1.getEmailReply() + "</span><span class=comment__date>"+format.format(reply1.getDateReply())+"</span>"
                            + "<div class=comment__content>"
                            + "<p >" + reply1.getContent() + "</p>"
                            + "</div>"
                            + "</div>"
                            + "</div>"
                            + "</li>";
                }
            }
            response.getWriter().write(table);
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
        try {
            processRequest(request, response);
            
            EntityManagerFactory emf=(EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.CommentJpaController commentController= new CommentJpaController(utx, emf);
            Controller.ReplyCommentJpaController replyCommet= new ReplyCommentJpaController(utx, emf);
            
            String id=request.getParameter("id");
            String action=request.getParameter("action");
            
            switch(action){
                case "comment":
                    Entity.Comment comment=commentController.findComment(Integer.valueOf(id));
                    comment.setStatusComment("delete");
                    commentController.edit(comment);
                    break;
                case "reply":
                    Entity.ReplyComment reply=replyCommet.findReplyComment(Integer.valueOf(id));
                    reply.setStatusReply("delete");
                    replyCommet.edit(reply);
                    break;
            }
        } catch (RollbackFailureException ex) {
            Logger.getLogger(CommentEmployee.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CommentEmployee.class.getName()).log(Level.SEVERE, null, ex);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Employee;

import Controller.CategoryJpaController;
import Controller.CommentJpaController;
import Controller.PostJpaController;
import Controller.ReplyCommentJpaController;
import Controller.exceptions.PreexistingEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.Comment;
import Entity.Post;
import Entity.ReplyComment;
import Servlet.Comment.CommentEmployee;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.jboss.weld.servlet.SessionHolder;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "BlogDetails", urlPatterns = {"/BlogDetails"})
public class BlogDetails extends HttpServlet {

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
        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
            //response.sendRedirect(request.getContextPath() + "/LoginUser");
        }
        int countCommnet = 0;
        int idPost = Integer.valueOf(request.getParameter("id"));
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.PostJpaController postController = new PostJpaController(utx, emf);
        Controller.CategoryJpaController catControler = new CategoryJpaController(utx, emf);
        Controller.CommentJpaController commentController = new CommentJpaController(utx, emf);
        Controller.ReplyCommentJpaController replyController = new ReplyCommentJpaController(utx, emf);

        countCommnet = commentController.countCommentAccept(idPost).getIdComment();
        List<Comment> listComment = commentController.getCommentByIdPost(postController.findPost(idPost));
        for (Comment listComment1 : listComment) {
            countCommnet +=replyController.countReplyCommentAccept(listComment1.getIdComment()).getIdReply();
//            System.out.println("list comment 01 " + listComment1.getIdComment());
//            System.out.println("list comment 02 " + listComment1.getRoleComment());
            
        }

        request.setAttribute("listComment", listComment);
        request.setAttribute("totalComment", countCommnet);
        request.setAttribute("listCount", postController.getPostByCategory1());
        request.setAttribute("listCat", catControler.findCategoryEntities());
        request.setAttribute("post", postController.findPost(idPost));
        request.getRequestDispatcher("/page/dashboard/employee/dashboard_blog_details.jsp").forward(request, response);

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

        System.out.println("reply 123 "+request.getParameter("txtIdComment"));
        HttpSession session = request.getSession();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String a = format.format(new Date());
        EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.CommentJpaController commentController = new CommentJpaController(utx, em);
        Controller.ReplyCommentJpaController replyController= new ReplyCommentJpaController(utx, em);
        String action = request.getParameter("action");
        Entity.Comment comment = new Comment();
        Entity.ReplyComment reply= new ReplyComment();
        String role = null;

        // create comment 
        if (action.equals("comment")) {
            try {
                comment.setIdPost(new Post(Integer.valueOf(request.getParameter("txtIDPost"))));
                comment.setContent(request.getParameter("txtComment"));
                comment.setDateComment(format.parse(a));
                comment.setStatusComment("wait");

                // not login and comment
                if (session.getAttribute("user") == null) {
                    try {
                        comment.setRoleComment("guest");
                        comment.setEmailComment(request.getParameter("txtEmailComment"));
                        comment.setNameComment(request.getParameter("txtNameComment"));

                        commentController.create(comment);
                        System.out.println("create comment guest completed ");
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
                            break;
                        case "customer":
                            role = "customer";
                            break;
                    }
                    comment.setIdUser(user);
                    comment.setRoleComment(role);
                    
                    commentController.create(comment);
                    System.out.println("create comment user completed");
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
            
            try {
                
                reply.setIdComment(new Comment(Integer.valueOf(request.getParameter("txtIdComment"))));
                reply.setContent(request.getParameter("txtReplyContent"));
                reply.setDateReply(format.parse(a));
                reply.setStatusReply("wait");
                
                if (session.getAttribute("user")== null) {
                    try {
                        reply.setEmailReply(request.getParameter("txtEmailReply"));
                        reply.setNameReply(request.getParameter("txtNameReply"));
                        reply.setRoleReply("guest");
                        
                        replyController.create(reply);
                        System.out.println("create reply guest completed");
                    } catch (Exception ex) {
                        Logger.getLogger(BlogDetails.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }else{
                    try {
                        Entity.Users user= (Entity.Users) session.getAttribute("user");
                        switch (user.getRole()) {
                            case "employee":
                                role = "employee";
                                break;
                            case "customer":
                                role = "customer";
                                break;
                        }
                        reply.setIdUser(user);
                        reply.setRoleReply(role);
                        
                        replyController.create(reply);
                        System.out.println("create reply user completed");
                    } catch (Exception ex) {
                        Logger.getLogger(BlogDetails.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                }
            } catch (ParseException ex) {                
                Logger.getLogger(BlogDetails.class.getName()).log(Level.SEVERE, null, ex);
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

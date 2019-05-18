/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Project;


import Controller.CommentJpaController;
import Controller.EstateJpaController;
import Controller.EstateTypeJpaController;
import Controller.ManagerJpaController;
import Controller.ProjectJpaController;
import Controller.ViewEmployeeAssignJpaController;
import Entity.Estate;
import Entity.Manager;
import Entity.Project;
import Entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import Controller.RatingJpaController;
import Controller.ReplyCommentJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.Comment;
import Entity.Estate;
import Entity.Project;
import Entity.ReplyComment;
import Entity.Users;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

/**
 *
 * @author kiems
 */
@WebServlet(name = "ProjectDetails", urlPatterns = {"/ProjectDetails"})
public class ProjectDetails extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        // BEGIN SESSION HEADER FONTEND //
        
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");
        if (users != null) {
            request.setAttribute("user", "user");
            request.setAttribute("displayLogin", "none");
            request.setAttribute("displayUser", "block");
            switch (users.getRole()) {
                case "employee":
                    session.setAttribute("name", users.getEmployee().getEmployeeName());
                    request.setAttribute("role", "employee");
                    session.setAttribute("image", users.getEmployee().getEmployeeImg());
                    break;
                case "manager":
                    session.setAttribute("name", users.getManager().getManagerName());
                    request.setAttribute("role", "manager");
                    session.setAttribute("image", users.getManager().getManagerImg());
                    break;
                case "director":
                    session.setAttribute("name", "Boss");
                    request.setAttribute("role", "director");
                    session.setAttribute("image", "http://localhost:8080/ProjectRealEstate/assets/media-demo/boss.png");
                    break;
                case "customer":
                    session.setAttribute("name", users.getCustomer().getCustomerName());
                    request.setAttribute("role", "customer");
                    session.setAttribute("image", users.getCustomer().getCustomerImg());
                    break;
            }
        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
        }
        // END SESSION HEADER FONTEND //
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
        ProjectJpaController projectControl = new ProjectJpaController(utx, emf);
        ManagerJpaController managerControl = new ManagerJpaController(utx, emf);
        EstateJpaController estateControl = new EstateJpaController(utx, emf);
        request.setAttribute("estateTypeList", estateTypeControl.findEstateTypeEntities());

        

        RatingJpaController ratingController = new RatingJpaController(utx, emf);
        Controller.CommentJpaController commentController = new CommentJpaController(utx, emf);
        Controller.ReplyCommentJpaController replyController = new ReplyCommentJpaController(utx, emf);
        
        String id = request.getParameter("projectId");
        
        System.out.println("point "+ratingController.getPointByProject((id)));
        request.setAttribute("point", ratingController.getPointByProject((id)));
        request.setAttribute("estateTypeList", estateTypeControl.findEstateTypeEntities());

        Project find = projectControl.findProject(id);

        List<String> estateIDList = estateControl.getEstateByProject(id);
        List<Estate> estateList = new ArrayList<>();

        for (String string : estateIDList) {
            estateList.add(estateControl.findEstate(string));
        }

//        int countProject = projectControl.getManagerByProjectCount(find.getManagerId().getManagerId());
        int countEstate = estateControl.getEstateByProjectCount(id);

        int countCommnet = 0;
        int countEstateSold = 0;
        int countEstateUnSold = 0;
        Double sumPrice = 0.0;
        Double sumPriceSold = 0.0;
        Double sumPriceUnSold = 0.0;
        for (Estate estate : estateList) {
            sumPrice = sumPrice + estate.getPrice();
            if(estate.getEstateStatus().equalsIgnoreCase("sold")){
                countEstateSold = countEstateSold + 1;
                sumPriceSold = sumPriceSold + estate.getPrice();
            }
        }
        countEstateUnSold = countEstate - countEstateSold;
        sumPriceUnSold = sumPrice - sumPriceSold;
        String displayManager = "yes";
        if(true){
//            int managerID = projectControl.getManagerByProject(Integer.parseInt(id));
         //   request.setAttribute("manager", managerControl.findManager(managerID));
         //   request.setAttribute("countProject", countProject);
        }else{
            displayManager = "no";
        }
        // cuong add 
        countCommnet = commentController.countCommentAcceptProject(id).getIdComment();
        List<Comment> listComment = commentController.getCommentByIdPost_Project(id);
        for (Comment listComment1 : listComment) {
            countCommnet += replyController.countReplyCommentAccept(listComment1.getIdComment()).getIdReply();
        }
     

        countEstateUnSold = countEstate - countEstateSold;
        sumPriceUnSold = sumPrice - sumPriceSold;
        
        request.setAttribute("countRating", projectControl.countRating(id));
        request.setAttribute("totalComment", countCommnet);
        request.setAttribute("listComment", listComment);
        request.setAttribute("estateList", estateList);
        request.setAttribute("countEstate", countEstate);
        request.setAttribute("countEstateSold", countEstateSold);
        request.setAttribute("countEstateUnSold", countEstateUnSold);
        request.setAttribute("sumPrice", sumPrice);
        request.setAttribute("sumPriceUnSold", sumPriceUnSold);
        request.setAttribute("sumPriceSold", sumPriceSold);
        
        
        request.setAttribute("displayManager", displayManager);
        request.setAttribute("find", find);
        request.getRequestDispatcher("/page/guest/project_details.jsp").forward(request, response);
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
        String idProject = null;
        // create comment 
        if (action.equals("comment")) {
            try {
                idProject = request.getParameter("txtIDProject");
                comment.setIdProject(new Project((request.getParameter("txtIDProject"))));
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
                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(ProjectDetails.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(ProjectDetails.class.getName()).log(Level.SEVERE, null, ex);
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
                    response.sendRedirect(request.getContextPath() + "/ProjectDetails?projectId=" + idProject);
                }
            } catch (ParseException ex) {
                Logger.getLogger(ProjectDetails.class.getName()).log(Level.SEVERE, null, ex);
            } catch (RollbackFailureException ex) {
                Logger.getLogger(ProjectDetails.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ProjectDetails.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else // reply comment
        if (action.equals("reply")) {

            String txtIDProject=request.getParameter("txtIDProject");
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

               
                try {
                    replyController.create(reply);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(ProjectDetails.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(ProjectDetails.class.getName()).log(Level.SEVERE, null, ex);
                }
                System.out.println("id_reply " + reply.getIdReply());

                response.sendRedirect(request.getContextPath() + "/ProjectDetails?projectId=" + txtIDProject);

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

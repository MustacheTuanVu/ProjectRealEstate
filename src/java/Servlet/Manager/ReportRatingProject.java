/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Manager;

import Controller.EstateJpaController;
import Controller.ProjectDetailsJpaController;
import Controller.ProjectJpaController;
import Controller.RatingJpaController;
import Entity.Project;
import Entity.ProjectDetails;
import Entity.Rating;
import Entity.ReportProject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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
@WebServlet(name = "ReportRatingProject", urlPatterns = {"/ReportRatingProject"})
public class ReportRatingProject extends HttpServlet {

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

        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");

        Controller.ProjectJpaController projectController = new ProjectJpaController(utx, emf);
        Controller.RatingJpaController ratingController = new RatingJpaController(utx, emf);
        Controller.ProjectDetailsJpaController detailsController= new ProjectDetailsJpaController(utx, emf);
        Controller.EstateJpaController estateController= new EstateJpaController(utx, emf);

        
        String idProject=request.getParameter("id");
        Entity.Project project = projectController.findProject("7");
        Entity.Rating rating = new Rating();

        List<Project> listProject = projectController.findProjectEntities();
        List<Entity.ReportProject> listreport = new ArrayList<>();
        List<Entity.ProjectDetails> listDetails= detailsController.getProjectDetailByProject(idProject);
        List<Entity.Estate> listEstate= new ArrayList<>();

        for (int i = 0; i < listProject.size(); i++) {
            Entity.ReportProject report = new ReportProject();
            List<Rating> listRating = ratingController.getListRatingByIdProject(listProject.get(i).getProjectId());
            report.setIdProject(listProject.get(i).getProjectId());
            for (int j = 0; j < listRating.size(); j++) {
                if (listRating.get(j).getPointRating() == 1) {
                    report.mark1++;
                } else if (listRating.get(j).getPointRating() == 2) {
                    report.mark2++;
                } else if (listRating.get(j).getPointRating() == 3) {
                    report.mark3++;
                } else if (listRating.get(j).getPointRating() == 4) {
                    report.mark4++;
                } else if (listRating.get(j).getPointRating() == 5) {
                    report.mark5++;
                }
            }
            listreport.add(report);
        }
        for (ProjectDetails listDetail : listDetails) {
            Entity.Estate estate=estateController.findEstate(listDetail.getEstateId().getId());
            listEstate.add(estate);
        }
        
        
        

//        for (ReportProject listreport1 : listreport) {
//            System.out.println("1 " + listreport1.getIdProject() + " 3:" + listreport1.getMark4());
//        }
        
        //request.setAttribute("list", listreport);
        request.setAttribute("listEstate", listEstate);
        //request.getRequestDispatcher("/admin/page/dashboard/manager/report_project_rating.jsp").forward(request, response);
        request.getRequestDispatcher("/admin/page/dashboard/manager/report_project_estate.jsp").forward(request, response);
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

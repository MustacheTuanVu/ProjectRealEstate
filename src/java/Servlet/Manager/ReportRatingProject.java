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
import Controller.TransactionsJpaController;
import Entity.Estate;
import Entity.Project;
import Entity.ProjectDetails;
import Entity.Rating;
import Entity.Transactions;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
        Controller.ProjectDetailsJpaController detailsController = new ProjectDetailsJpaController(utx, emf);
        Controller.EstateJpaController estateController = new EstateJpaController(utx, emf);

        List<Entity.Project> listProject = projectController.getListProjectPublish();

        for (Project listProject1 : listProject) {
            //System.out.println(listProject1.getProjectId()+"-"+listProject1.getProjectName());
        }

//        for (ReportProject listreport1 : listreport) {
//            System.out.println("1 " + listreport1.getIdProject() + " 3:" + listreport1.getMark4());
//        }
        //request.setAttribute("list", listreport);
        request.setAttribute("listProject", listProject);
        //request.setAttribute("listEstate", listEstate);
        //request.getRequestDispatcher("/admin/page/dashboard/manager/report_project_rating.jsp").forward(request, response);
        request.getRequestDispatcher("/admin/page/dashboard/manager/report_project_estate.jsp").include(request, response);
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
        response.setContentType("text/html;charset=UTF-8");

        String idProject = request.getParameter("idProject");
        String dateTo = request.getParameter("dateTo");
        String dateFrom = request.getParameter("dateFrom");

        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");

        Controller.ProjectDetailsJpaController detailsController = new ProjectDetailsJpaController(utx, emf);

        List<Entity.ProjectDetails> listIDEstate = detailsController.getListEstateIDByProjectID(idProject);

        Controller.EstateJpaController estate = new EstateJpaController(utx, emf);
        Controller.TransactionsJpaController tranController = new TransactionsJpaController(utx, emf);

        List<String> listIdEstate = new ArrayList<>();
        List<Entity.Estate> listEstate = new ArrayList<>();
        List<Entity.Transactions> listTran = tranController.listTransactionByDate(dateTo, dateFrom);

        SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");

        String table = "<tr>";
        Double total=0d;
        for (ProjectDetails listIDEstate1 : listIDEstate) {
            if (listIDEstate1.getEstateId().getEstateStatus().equals("sold")) {
                for (Transactions listTran1 : listTran) {
                    if (listIDEstate1.getEstateId().getContractDetails().getContractId().getId() == listTran1.getContractId().getId()) {
                        table += "<td>" + listIDEstate1.getEstateId().getId() + "</td>"
                                + "<td>" + listIDEstate1.getEstateId().getBlock() + "</td>"
                                + "<td>" + listIDEstate1.getEstateId().getAreas() + "</td>"
                                + "<td>" + listIDEstate1.getEstateId().getFloor() + "</td>";
                        table += "<td>" + format.format(listTran1.getContractId().getDateSigned()) + "</td>";
                        table += "<td>" + listIDEstate1.getEstateId().getPrice() / 1000000000 + " Tỷ VNĐ</td>";
                        total+=total+ listIDEstate1.getEstateId().getPrice();
                    }
                }
            }
        }
        table += "</tr>"
                +"<tr colspan=\"4\"><td><strong>Tổng Tiền</strong></td><td></td><td></td><td></td><td></td><td>"+total/1000000000+" Tỷ VND</td></tr>";
        if (listEstate.size() >= 0) {
            response.getWriter().write(table);
        } else {
            System.out.println("0");
            response.getWriter().write(0);
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
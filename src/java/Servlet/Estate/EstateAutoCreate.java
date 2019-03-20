/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Estate;

import Controller.AssignDetailsJpaController;
import Controller.EmployeeJpaController;
import Controller.EstateJpaController;
import Controller.EstateStatusJpaController;
import Controller.EstateTypeJpaController;
import Controller.ProjectDetailsJpaController;
import Controller.ProjectJpaController;
import Controller.exceptions.PreexistingEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.AssignDetails;
import Entity.Employee;
import Entity.Estate;
import Entity.Project;
import Entity.ProjectDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
@WebServlet(name = "EstateAutoCreate", urlPatterns = {"/EstateAutoCreate"})
public class EstateAutoCreate extends HttpServlet {

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
        EntityManager em = emf.createEntityManager();
        EstateJpaController estateControl = new EstateJpaController(utx, emf);
        ProjectJpaController projectJpaController = new ProjectJpaController(utx, emf);
        ProjectDetailsJpaController detailsJpaController = new ProjectDetailsJpaController(utx, emf);
        EstateTypeJpaController estateTypeJpaController = new EstateTypeJpaController(utx, emf);
        EstateStatusJpaController estateStatusJpaController = new EstateStatusJpaController(utx, emf);
        EmployeeJpaController employeeJpaController = new EmployeeJpaController(utx, emf);
        AssignDetailsJpaController assignDetailsJpaController = new AssignDetailsJpaController(utx, emf);

        String projectID = request.getParameter("projectID");
        Project project = projectJpaController.findProject(projectID);
        int floorNumber = (int) project.getFloorNumber();
        request.setAttribute("floorNumber", floorNumber);

        String block = request.getParameter("block");
        if (request.getParameter("step").equals("1")) {
            for (int i = 1; i <= floorNumber; i++) {
                //NHAP BAO NHIEU LOAI GIA
                int priceRanger = Integer.valueOf(request.getParameter("floor" + i + "RangerNumber"));
                int index = 0;
                for (int j = 1; j <= priceRanger; j++) {
                    index = index + 1;
                    Estate estate = new Estate();
                    estate.setId("B" + block + "F" + i + "R" + index);
                    estate.setEstateName("Room " + estate.getId() + " Type" + j);
                    estate.setEstateTypeId(estateTypeJpaController.findEstateType("PR"));
                    estate.setEstateDescription(project.getProjectContent());
                    estate.setEstateContent(project.getProjectContent());
                    estate.setBedRoom(Integer.parseInt(request.getParameter("bedRoomB" + block + "F" + i + "Type" + j)));
                    estate.setBathRoom(Integer.parseInt(request.getParameter("bathRoomB" + block + "F" + i + "Type" + j)));
                    estate.setGarages(0.0);
                    estate.setPrice(Double.parseDouble(request.getParameter("priceB" + block + "F" + i + "Type" + j)));
                    estate.setAreas(Double.parseDouble(request.getParameter("areasB" + block + "F" + i + "Type" + j)));
                    estate.setImage1st(project.getImage1st());
                    estate.setImage2st(project.getImage2st());
                    estate.setImage3st(project.getImage3st());
                    estate.setImage4st(project.getImage4st());
                    estate.setImage5st(project.getImage5st());
                    estate.setDirection("none");
                    estate.setYearBuild(project.getYearBuild());
                    estate.setEstateStatusId(estateStatusJpaController.findEstateStatus(2));
                    estate.setEstateStatus("publish");
                    estate.setDateAdd(project.getDateAdd());
                    estate.setBlock(block);
                    estate.setFloor(String.valueOf(i));
                    try {
                        estateControl.create(estate);
                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(EstateAutoCreate.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(EstateAutoCreate.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    /*-----------------------------------------------------------------------------------*/
                    Employee employee = employeeJpaController.findEmployee(Integer.parseInt("employeeB" + block + "F" + i + "Type" + j));
                    AssignDetails assignDetails = new AssignDetails();
                    assignDetails.setEstateId(estate);
                    assignDetails.setEmployeeId(employee);
                    assignDetails.setDateTo(project.getDateAdd());
                    try {
                        assignDetailsJpaController.create(assignDetails);
                    } catch (PreexistingEntityException ex) {
                        Logger.getLogger(EstateAutoCreate.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(EstateAutoCreate.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(EstateAutoCreate.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    /*-----------------------------------------------------------------------------------*/
                    ProjectDetails projectDetails = new ProjectDetails();
                    projectDetails.setEstateId(estate);
                    projectDetails.setPrjectId(project);
                    try {
                        detailsJpaController.create(projectDetails);
                    } catch (PreexistingEntityException ex) {
                        Logger.getLogger(EstateAutoCreate.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(EstateAutoCreate.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(EstateAutoCreate.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    /*-----------------------------------------------------------------------------------*/
                }
            }
        }

        request.getRequestDispatcher("/page/dashboard/manager/dashboard_project_estate_new.jsp").forward(request, response);

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

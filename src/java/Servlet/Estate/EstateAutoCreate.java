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
import Entity.EstateType;
import Entity.Project;
import Entity.ProjectDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
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

        HttpSession session = request.getSession();
        Entity.Users user = (Entity.Users) session.getAttribute("user");

        if (user != null) {
            if (user.getRole().equals("manager")) {
                EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                EntityManager em = emf.createEntityManager();
                request.setAttribute("user", "user");
                request.setAttribute("displayLogin", "none");
                request.setAttribute("displayUser", "block");

                session.setAttribute("name", user.getManager().getManagerName());
                request.setAttribute("role", "manager");
                session.setAttribute("image", user.getManager().getManagerAddress());
                EstateTypeJpaController estateType = new EstateTypeJpaController(utx, emf);
                List<EstateType> estateTypeList = estateType.findEstateTypeEntities();
                request.setAttribute("estateTypeList", estateTypeList);
                EstateJpaController estateControl = new EstateJpaController(utx, emf);
                ProjectJpaController projectJpaController = new ProjectJpaController(utx, emf);
                ProjectDetailsJpaController detailsJpaController = new ProjectDetailsJpaController(utx, emf);
                EstateTypeJpaController estateTypeJpaController = new EstateTypeJpaController(utx, emf);
                EstateStatusJpaController estateStatusJpaController = new EstateStatusJpaController(utx, emf);
                EmployeeJpaController employeeJpaController = new EmployeeJpaController(utx, emf);
                AssignDetailsJpaController assignDetailsJpaController = new AssignDetailsJpaController(utx, emf);

                List<Employee> employeeList = employeeJpaController.findEmployeeEntities();
                request.setAttribute("employeeList", employeeList);

                String block = request.getParameter("block");
                int estateNumber = Integer.parseInt(request.getParameter("estateNumber"));
                int estateNumbers = Integer.parseInt(request.getParameter("estateNumbers"));
                String projectID = request.getParameter("projectID");
                request.setAttribute("block", block);
                request.setAttribute("estateNumber", estateNumber);
                request.setAttribute("estateNumbers", estateNumbers);
                request.setAttribute("projectID", projectID);

                Project project = projectJpaController.findProject(projectID);
                int floorNumber = (int) project.getFloorNumber();
                System.out.println("floor " + floorNumber);
                request.setAttribute("floorNumber", floorNumber);

                if (Integer.parseInt(request.getParameter("estateNumbers")) > 0) {
                    request.setAttribute("getEstate", "block");
                    request.setAttribute("getBlock", "none");
                } else {
                    request.setAttribute("getEstate", "none");
                    request.setAttribute("getBlock", "block");
                }

                if (request.getParameter("getBlock") != null) {
                    block = request.getParameter("block");
                    estateNumber = Integer.valueOf(request.getParameter("estateNumber"));
                    request.setAttribute("blocks", block);
                    request.setAttribute("estateNumbers", estateNumber);
                }

                if (request.getParameter("getEstate") != null) {
                    for (int i = 1; i <= floorNumber; i++) {
                        int index = 0;
                        for (int j = 1; j <= 3; j++) {
                            for (int y = 1; y <= Integer.parseInt(request.getParameter("typeNumberFloorF" + i + "Type" + j)); y++) {
                                index = index + 1;
                                Estate estate = new Estate();
                                estate.setId("B" + block + "F" + i + "R" + index);
                                estate.setEstateName("Room " + estate.getId() + " Type" + j);
                                estate.setEstateTypeId(estateTypeJpaController.findEstateType("PR"));
                                estate.setEstateDescription(project.getProjectContent());
                                estate.setEstateContent(project.getProjectContent());
                                System.out.println("bedRoomB" + block + "F" + i + "Type" + j);
                                estate.setBedRoom(Integer.parseInt(request.getParameter("bedRoomB" + block + "F" + i + "Type" + j))); //bedRoomFloor1A=1

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
                                estate.setEstateTypeId(estateTypeJpaController.findEstateType("1"));
                                estate.setAddress1("B" + block + "F" + i + "R" + index);
                                estate.setAddress2(project.getProjectAddress());
                                estate.setDistrict(project.getDistrict());
                                try {
                                    estateControl.create(estate);
                                } catch (RollbackFailureException ex) {
                                    Logger.getLogger(EstateAutoCreate.class.getName()).log(Level.SEVERE, null, ex);
                                } catch (Exception ex) {
                                    Logger.getLogger(EstateAutoCreate.class.getName()).log(Level.SEVERE, null, ex);
                                }
                                /*-----------------------------------------------------------------------------------*/
                                Employee employee = employeeJpaController.findEmployee(
                                        Integer.parseInt(request.getParameter("employeeB" + block + "F" + i))
                                );
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
                }
                request.getRequestDispatcher("/page/dashboard/manager/dashboard_project_estate_new.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/LoginUser");
            }
        } else {
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

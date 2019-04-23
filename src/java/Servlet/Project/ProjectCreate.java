/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Project;

import Controller.EstateStatusJpaController;
import Controller.EstateTypeJpaController;
import Controller.FeaturesJpaController;
import Controller.ProjectJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.Estate;
import Entity.EstateStatus;
import Entity.EstateType;
import Entity.Features;
import Entity.Project;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
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
@WebServlet(name = "ProjectCreate", urlPatterns = {"/ProjectCreate"})
public class ProjectCreate extends HttpServlet {

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
            System.out.println("1 ");
            if (user.getRole().equals("manager")) {
                System.out.println(" 2");
                request.setAttribute("user", "user");
                request.setAttribute("displayLogin", "none");
                request.setAttribute("displayUser", "block");
                
                session.setAttribute("name", user.getManager().getManagerName());
                request.setAttribute("role", "manager");
                session.setAttribute("image", user.getManager().getManagerImg());
                
                EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                EntityManager em = emf.createEntityManager();

                if (request.getParameter("submit") != null) {
                    System.out.println(" 3");
                    ProjectJpaController projectControl = new ProjectJpaController(utx, emf);

                    String projectName = request.getParameter("projectName");

                    String projectContent = request.getParameter("projectContent");

                    int blockNumber = Integer.parseInt(request.getParameter("blockNumber"));
                    int floorNumber = Integer.parseInt(request.getParameter("floorNumber"));

                    String image1st = request.getParameter("image1st"); //NOTE
                    String image2st = request.getParameter("image2st"); //NOTE
                    String image3st = request.getParameter("image3st"); //NOTE
                    String image4st = request.getParameter("image4st"); //NOTE
                    String image5st = request.getParameter("image5st"); //NOTE
                    
                    String addresss = request.getParameter("address");

                    String yearBuild = request.getParameter("yearBuild"); //NOTE
                    

                    int indexID = 1;
                    String projectID = "1";

                    while (true) {
                        if (projectControl.findProject(projectID) != null) {
                            indexID = indexID + 1;
                            projectID = String.valueOf(indexID);
                        } else {
                            break;
                        }
                    }
                    Project projectListByAdress = (Project) projectControl.getProjectByAddress(addresss);
                    if(projectListByAdress != null){
                        response.sendRedirect(request.getContextPath() + "/ProjectList?user=manager&"
                                + "projectID="+projectListByAdress.getProjectId()+"&"
                                + "projectName="+projectListByAdress.getProjectName()+"&"
                                + "address="+projectListByAdress.getProjectAddress()+"&"
                                + "img="+projectListByAdress.getImage1st()+"&"
                                + "modal=show"
                        );
                    } else {
                        
                        Project project = new Project();
                        project.setProjectId(projectID);
                        project.setProjectName(projectName);
                        project.setBlockNumber(blockNumber);
                        project.setFloorNumber(floorNumber);
                        project.setProjectContent(projectContent);
                        project.setImage1st(image1st);
                        project.setImage2st(image2st);
                        project.setImage3st(image3st);
                        project.setImage4st(image4st);
                        project.setImage5st(image5st);
                        project.setProjectAddress(addresss);
                        project.setStatus("waitting for director create");
                        project.setProjectStatus("waitting for director create");
                        project.setDistrict(request.getParameter("district"));
                        project.setManagerId(user.getManager());
                        
                        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                        Date day;
                        try {
                            day = sdf.parse(yearBuild);
                            project.setYearBuild(day);
                        } catch (ParseException ex) {
                            Logger.getLogger(ProjectCreate.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        
                        SimpleDateFormat sdff = new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy",Locale.ENGLISH);
                        Date date = new Date();
                        try {
                            project.setDateAdd(sdff.parse(date.toString()));
                        } catch (ParseException ex) {
                            Logger.getLogger(ProjectCreate.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        
                        try {
                            projectControl.create(project);
                            System.out.println("create completed !!!");
                            response.sendRedirect(request.getContextPath() + "/ProjectList?user=manager&modal=show");
                        } catch (RollbackFailureException ex) {
                            Logger.getLogger(ProjectCreate.class.getName()).log(Level.SEVERE, null, ex);
                        } catch (Exception ex) {
                            Logger.getLogger(ProjectCreate.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                } else {
                    System.out.println("4 ");
                    EstateTypeJpaController estateType = new EstateTypeJpaController(utx, emf);
                    List<EstateType> estateTypeList = estateType.findEstateTypeEntities();
                    request.setAttribute("estateTypeList", estateTypeList);
                    
                    String modal = "hidden";
                    modal = request.getParameter("modal");
                    request.setAttribute("modal", modal);

                    request.getRequestDispatcher("/admin/page/dashboard/manager/create_project.jsp").forward(request, response);
                }
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

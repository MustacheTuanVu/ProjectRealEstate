/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Project;

import Controller.EstateJpaController;
import Controller.EstateTypeJpaController;
import Controller.ManagerJpaController;
import Controller.ProjectJpaController;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.Manager;
import Entity.Project;
import Entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
 * @author Cuong
 */
@WebServlet(name = "ProjectEdit", urlPatterns = {"/ProjectEdit"})
public class ProjectEdit extends HttpServlet {

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
        // BEGIN SESSION HEADER FONTEND //
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");
        
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
        ProjectJpaController projectJpaController = new ProjectJpaController(utx, emf);
        if (users != null) {
            request.setAttribute("user", "user");
            request.setAttribute("displayLogin", "none");
            request.setAttribute("displayUser", "block");
            switch (users.getRole()) {
                case "employee":
                    session.setAttribute("name", users.getEmployee().getEmployeeName());
                    session.setAttribute("employeeID", users.getEmployee().getId());
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
            Project project = projectJpaController.findProject(request.getParameter("projectID"));
            request.setAttribute("project", project);
        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
        }
        // END SESSION HEADER FONTEND //
        
        request.setAttribute("estateTypeList", estateTypeControl.findEstateTypeEntities());
        request.getRequestDispatcher("/page/dashboard/manager/dashboard_project_edit.jsp").forward(request, response);
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
        try {
            //processRequest(request, response);
            HttpSession session = request.getSession();
            Users users = (Users) session.getAttribute("user");
            
            EntityManagerFactory emf= (EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.ProjectJpaController proCon= new ProjectJpaController(utx, emf);
            ManagerJpaController managerJpaController = new ManagerJpaController(utx, emf);
            
            Entity.Project pro=proCon.findProject(request.getParameter("id"));
            SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
            
            EntityManager em = emf.createEntityManager();
            Manager manager = managerJpaController.findManager(users.getManager().getManagerId() );
            
            //pro.setProjectId(request.getParameter("projectId"));
            pro.setBlockNumber(Integer.valueOf(request.getParameter("blockNumber")));
            pro.setDocumentUrl("123");
            pro.setYearBuild(format.parse(request.getParameter("yearBuild")));
            System.out.println("img 1 "+pro.getImage1st());
            System.out.println("img 2 "+pro.getImage2st());
            pro.setImage1st(request.getParameter("image1st"));
            pro.setImage2st(request.getParameter("image2st"));
            pro.setImage3st(request.getParameter("image3st"));
            pro.setImage4st(request.getParameter("image4st"));
            pro.setImage5st(request.getParameter("image5st"));
            pro.setManagerId(manager);
            pro.setProjectAddress(request.getParameter("address"));
            pro.setFloorNumber(Double.valueOf(request.getParameter("floorNumber")));
            pro.setBlockNumber(Integer.valueOf(request.getParameter("blockNumber")));
            pro.setProjectName(request.getParameter("projectName"));
//            pro.setProjectStatus("waitting for director edit");
//            pro.setStatus("waitting for director edit");
            proCon.edit(pro);
            response.sendRedirect(request.getContextPath()+"/ProjectList?user=manager&modal=show");
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ProjectEdit.class.getName()).log(Level.SEVERE, null, ex);
        } catch (RollbackFailureException ex) {
            Logger.getLogger(ProjectEdit.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProjectEdit.class.getName()).log(Level.SEVERE, null, ex);
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

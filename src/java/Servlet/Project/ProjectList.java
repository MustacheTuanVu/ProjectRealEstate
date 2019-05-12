/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Project;

import Controller.ContractJpaController;
import Controller.CustomerJpaController;
import Controller.EstateJpaController;
import Controller.EstateStatusJpaController;
import Controller.EstateTypeJpaController;
import Controller.ManagerJpaController;
import Controller.ProjectJpaController;
import Entity.Customer;
import Entity.Estate;
import Entity.Manager;
import Entity.Project;
import Entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "ProjectList", urlPatterns = {"/ProjectList"})
public class ProjectList extends HttpServlet {

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
        
        // BEGIN ESTATE LIST SHOW//
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        ProjectJpaController projectControl = new ProjectJpaController(utx, emf);
        EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
        
        String keywordF = (request.getParameter("keywordF") != null) ? request.getParameter("keywordF") : "";
        request.setAttribute("keywordF", keywordF);
        
        String DistrictF = (request.getParameter("DistrictF") != null) ? request.getParameter("DistrictF") : "all";
        request.setAttribute("DistrictF", DistrictF);
        String BuildFrom = (request.getParameter("BuildFrom") != null) ? request.getParameter("BuildFrom") : "1945";
        request.setAttribute("BuildFrom", BuildFrom);
        String BuildTo = (request.getParameter("BuildTo") != null) ? request.getParameter("BuildTo") : "2020";
        request.setAttribute("BuildTo", BuildTo);
        
        String dateRange = (request.getParameter("dateRange") != null) ? request.getParameter("dateRange") : "2019/01/01 - 2020/12/12";
        int dateIndex = dateRange.indexOf("-");
        String dateFrom = dateRange.substring(0,dateIndex-1);
        request.setAttribute("dateFrom", dateFrom);
        String dateTo = dateRange.substring(dateIndex+1);
        request.setAttribute("dateTo", dateTo);
        
        
        
        List<Project> projectList = projectControl.getProjectInSiderBar(
            keywordF,
            DistrictF,
            BuildFrom,
            BuildTo,
            dateFrom,
            dateTo
        );
        request.setAttribute("projectList", projectList);
        request.setAttribute("size", projectList.size());
        // END ESTATE LIST SHOW//
        
        // BEGIN //
        // END //
        request.setAttribute("estateTypeList", estateTypeControl.findEstateTypeEntities());
        String user = request.getParameter("user");
        if(user.equals("guest")){
            Controller.ContractJpaController con= new ContractJpaController(utx, emf);
           
            request.getRequestDispatcher("/page/guest/project_list.jsp").forward(request, response);
        }else if(user.equals("manager")){
            users.getManager().getManagerId();
            
            List<Project> projectsList = new ArrayList<>();
            
            String search = (request.getParameter("search") != null) ? request.getParameter("search") : "";
            String modal = (request.getParameter("modal") != null) ? request.getParameter("modal") : "";
            String modalEdit = (request.getParameter("modalEdit") != null) ? request.getParameter("modalEdit") : "";
            request.setAttribute("modalEdit", modalEdit);
            request.setAttribute("modal", modal);
            if(search.equals("search")){
                String searchInput = (request.getParameter("searchInput") != null) ? request.getParameter("searchInput") : "";
                List<String> projectIDListSearch = projectControl.getProjectByManagerSearch(
                    String.valueOf(users.getManager().getManagerId()),
                    searchInput
                );
                for (String string : projectIDListSearch) {
                    projectsList.add(projectControl.findProject(string));
                }
            }else{
                projectsList = projectControl.getProjectByManager(users.getManager().getManagerId().toString(),"all");
            }
            
            request.setAttribute("projectList", projectsList);
            request.getRequestDispatcher("/admin/page/dashboard/manager/project_list.jsp").forward(request, response);
        }else if(user.equals("director")){
            if(!users.getRole().equals("director")){
                users.getManager().getManagerId();
            }
            List<Project> projectsList = new ArrayList<>();
            String url = "";
            String search = (request.getParameter("search") != null) ? request.getParameter("search") : "";
            String filter = (request.getParameter("filter") != null) ? request.getParameter("filter") : "none";
            
            if(search.equals("search")){
                String searchInput = (request.getParameter("searchInput") != null) ? request.getParameter("searchInput") : "";
                List<String> projectIDListSearch = projectControl.getProjectByManagerSearch(
                    "all",
                    searchInput
                );
                for (String string : projectIDListSearch) {
                    projectsList.add(projectControl.findProject(string));
                }
            }else{
                if(filter.equals("all")){
                    projectsList = projectControl.getProjectByManager("all","all");
                    request.setAttribute("active", "ProjectList");
                    url = "/admin/page/dashboard/director/project.jsp";
                }else{
                    projectsList = projectControl.getProjectByManager("all","none");
                    url = "/admin/page/dashboard/director/project_dash.jsp";
                }
                
            }
            
            EstateJpaController estateJpaController = new EstateJpaController(utx, emf);
            for (Project project : projectsList) {
                List<String> estateIDList = estateJpaController.getEstateByProject(project.getProjectId());
                int count = 0;
                for (String estateID : estateIDList) {
                    if(estateJpaController.findEstate(estateID).getContractDetails()!=null){
                        count = count + 1;
                    }
                }
                if(count!=0){
                    projectsList.remove(project);
                }
            }
            request.setAttribute("projectList", projectsList);
            request.getRequestDispatcher(url).forward(request, response);
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
        //processRequest(request, response);
         String address = request.getParameter("address");
        String projectID = request.getParameter("projectID");
        
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.ProjectJpaController proCon = new ProjectJpaController(utx, emf);
        
        int dem = proCon.checkAddressProjectEdit(address, projectID);
        if (dem == 0) {
            // hop le dc tao address
            System.out.println("000000000000");
            response.getWriter().write("0");
        } else if (dem == 1) {
            // Address khong hop le
            System.out.println("111111111111");
            response.getWriter().write("1");
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

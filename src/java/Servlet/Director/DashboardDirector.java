/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Director;

import Controller.ContractDetailsJpaController;
import Controller.CustomerJpaController;
import Controller.EmployeeJpaController;
import Controller.EstateJpaController;
import Controller.EstateTypeJpaController;
import Controller.ManagerJpaController;
import Controller.PostJpaController;
import Controller.ProjectJpaController;
import Controller.TransactionsJpaController;
import Entity.Contract;
import Entity.ContractDetails;
import Entity.Employee;
import Entity.Estate;
import Entity.EstateType;
import Entity.Project;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "DashboardDirector", urlPatterns = {"/DashboardDirector"})
public class DashboardDirector extends HttpServlet {

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
        Entity.Users user = (Entity.Users) session.getAttribute("user");
        if (user != null) {
            request.setAttribute("user", "user");
            request.setAttribute("displayLogin", "none");
            request.setAttribute("displayUser", "block");
            switch (user.getRole()) {
                case "employee":
                    session.setAttribute("name", user.getEmployee().getEmployeeName());
                    request.setAttribute("role", "employee");
                    session.setAttribute("image", user.getEmployee().getEmployeeImg());
                    break;
                case "manager":
                    session.setAttribute("name", user.getManager().getManagerName());
                    session.setAttribute("image", user.getManager().getManagerImg());
                    break;
                case "director":
                    session.setAttribute("name", "Boss");
                    request.setAttribute("role", "director");
                    session.setAttribute("image", "http://localhost:8080/ProjectRealEstate/assets/media-demo/boss.png");
                    break;
                case "customer":
                    session.setAttribute("name", user.getCustomer().getCustomerName());
                    session.setAttribute("image", user.getCustomer().getCustomerImg());
                    break;
            }
            
            // DASHBOARD
            
            EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
            EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
            TransactionsJpaController transactionsJpaController = new TransactionsJpaController(utx, emf);
            ContractDetailsJpaController contractDetailsJpaController = new ContractDetailsJpaController(utx, emf);
            EmployeeJpaController employeeJpaController = new EmployeeJpaController(utx, emf);
            EstateJpaController estateJpaController = new EstateJpaController(utx, emf);
            PostJpaController postJpaController = new PostJpaController(utx, emf);
            ManagerJpaController managerJpaController = new ManagerJpaController(utx, emf);
            CustomerJpaController customerJpaController = new CustomerJpaController(utx, emf);
            ProjectJpaController projectJpaController = new ProjectJpaController(utx, emf);
            request.setAttribute("active","DashboardDirector");
            request.setAttribute("contractList", contractDetailsJpaController.findContractDetailsEntities());
            List<ContractDetails> contractDetailsList = contractDetailsJpaController.findContractDetailsEntities();
            int countContractWaitSale = 0;
            System.out.println("this :"+contractDetailsList.size());
            for (ContractDetails contractDetails : contractDetailsList) {
                if(contractDetails.getEstateId().getAssignDetails()== null){
                    if(contractDetails.getContractId().getStatus().equals("waitting for employee")){
                        countContractWaitSale = countContractWaitSale + 1;
                    }
                }
            }
            
            List<String> estateIDList = estateJpaController.getEstateByEmployeeFilter(
                    "all",
                    "waitting for director"
            );
            List<Estate> estateList = new ArrayList<>();
            for (String string : estateIDList) {
                estateList.add(estateJpaController.findEstate(string));
            }
            
            int countEstateWait = 0;
            for (Estate estate : estateList) {
                countEstateWait = countEstateWait + 1;
            }
            
            /*------------------------------------------------*/
            
            List<Project> projectsList = projectJpaController.getProjectByManager("all","none");
            
            for (Project project : projectsList) {
                List<String> estateIDList2 = estateJpaController.getEstateByProject(project.getProjectId());
                int count = 0;
                for (String estateID : estateIDList2) {
                    if(estateJpaController.findEstate(estateID).getContractDetails()!=null){
                        count = count + 1;
                    }
                }
                if(count!=0){
                    projectsList.remove(project);
                }
            }
            
            int countProjectWait = 0;
            for (Project project : projectsList) {
                countProjectWait = countProjectWait + 1;
            }
            
            
            /*-------------------------------------------------*/
            request.setAttribute("countProjectWait", countProjectWait);
            request.setAttribute("countEstateWait", countEstateWait);
            request.setAttribute("countContractWaitSale", countContractWaitSale);
            request.setAttribute("countEmployee", employeeJpaController.getEmployeeCount());
            request.setAttribute("countManager", managerJpaController.getManagerCount());
            request.setAttribute("countCustomer", customerJpaController.getCustomerCount());
            request.setAttribute("countProject", projectJpaController.getProjectCount());
            request.setAttribute("countEstate", estateJpaController.getEstateCount());
            request.setAttribute("countBlog", postJpaController.getPostCount());
            /*-------------------------------------------------*/
            
            /*-------------------------------------------------*/
            List<Employee> employeeList = employeeJpaController.findEmployeeEntities();
            Map<String,Integer> countEstateByEmployee = new HashMap<>();
            for (Employee employee : employeeList) {
                int size = 0;
                size = employeeJpaController.getEstatePublicByEmployeeID(employee.getId()).size();
                countEstateByEmployee.put(
                        employee.getId().toString(), 
                        size
                );
            }
            request.setAttribute("countEstateByEmployee", countEstateByEmployee);
            request.setAttribute("countEstateByEmployeeSize", countEstateByEmployee.size());
            /*-------------------------------------------------*/
            
            /*-------------------------------------------------*/
            List<Employee> employeeList2 = employeeJpaController.findEmployeeEntities();
            Map<String,Integer> countEstateSoldByEmployee = new HashMap<>();
            for (Employee employee : employeeList2) {
                int size = 0;
                size = employeeJpaController.getEstateSoldByEmployeeID(employee.getId()).size();
                countEstateSoldByEmployee.put(
                        employee.getId().toString(), 
                        size
                );
            }
            request.setAttribute("countEstateSoldByEmployee", countEstateSoldByEmployee);
            request.setAttribute("countEstateSoldByEmployeeSize", countEstateSoldByEmployee.size());
            /*-------------------------------------------------*/
            
            //CustomerJpaController customerControl = new CustomerJpaController(utx, emf);
            ContractDetailsJpaController contractDetailsControl = new ContractDetailsJpaController(utx, emf);
            
            request.setAttribute("employeeList", employeeList);
            request.setAttribute("contractList", contractDetailsControl.findContractDetailsEntities());
            
            // BEGIN NAVBAR HEADER FONTEND //
            List<EstateType> estateTypeList = estateTypeControl.findEstateTypeEntities();
            request.setAttribute("estateTypeList", estateTypeList);
            request.getRequestDispatcher("/admin/page/dashboard/director/work.jsp").forward(request, response);
            // END NAVBAR HEADER FONTEND //
        } else{
            response.sendRedirect(request.getContextPath()+"/admin");
        }
        // END SESSION HEADER FONTEND //
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

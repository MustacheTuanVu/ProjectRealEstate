/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Manager;

import Controller.ContractDetailsJpaController;
import Controller.ContractJpaController;
import Controller.CustomerJpaController;
import Controller.EmployeeJpaController;
import Controller.EstateJpaController;
import Controller.EstateTypeJpaController;
import Controller.ManagerJpaController;
import Controller.ProjectJpaController;
import Entity.Contract;
import Entity.ContractDetails;
import Entity.Customer;
import Entity.Employee;
import Entity.Estate;
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
@WebServlet(name = "ProjectDashboard", urlPatterns = {"/ProjectDashboard"})
public class ProjectDashboard extends HttpServlet {

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
        
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
        ProjectJpaController projectControl = new ProjectJpaController(utx, emf);
        ManagerJpaController managerControl = new ManagerJpaController(utx, emf);
        EstateJpaController estateControl = new EstateJpaController(utx, emf);
        
        
        
        request.setAttribute("estateTypeList", estateTypeControl.findEstateTypeEntities());

        String id = request.getParameter("projectId");
        Project find = projectControl.findProject(id);
        
        List<String> estateIDList = estateControl.getEstateByProject(id);
        List<Estate> estateList = new ArrayList<>();
        
        for (String string : estateIDList) {
            estateList.add(estateControl.findEstate(string));
        }
        
        int countProject = projectControl.getManagerByProjectCount(find.getManagerId().getManagerId());
        int countEstate = estateControl.getEstateByProjectCount(id);
        
        int countEstateSold = 0;
        int countEstateUnSold = 0;
        Double sumPrice = 0.0;
        Double sumPriceSold = 0.0;
        Double sumPriceUnSold = 0.0;
        for (Estate estate : estateList) {
            sumPrice = sumPrice + estate.getPrice();
            if(estate.getEstateStatus().equals("sold")){
                countEstateSold = countEstateSold + 1;
                sumPriceSold = sumPriceSold + estate.getPrice();
            }
        }
        countEstateUnSold = countEstate - countEstateSold;
        sumPriceUnSold = sumPrice - sumPriceSold;
        String displayManager = "yes";
        if(countProject != 0){
            int managerID = projectControl.getManagerByProject(Integer.parseInt(id));
            request.setAttribute("manager", managerControl.findManager(managerID));
            request.setAttribute("countProject", countProject);
        }else{
            displayManager = "no";
        }
        
        EmployeeJpaController employeeJpaController = new EmployeeJpaController(utx, emf);
        List<Employee> employeeList = new ArrayList<>();
        
        for (Estate estate : estateList) {
            if(estate.getAssignDetails()!=null){
                if(!employeeList.contains(employeeJpaController.findEmployee(estate.getAssignDetails().getEmployeeId().getId()))){
                    employeeList.add(
                        employeeJpaController.findEmployee(estate.getAssignDetails().getEmployeeId().getId())
                    );
                }
            }
            
        }
        
        CustomerJpaController customerJpaController = new CustomerJpaController(utx, emf);
        List<Customer> customerList = new ArrayList<>();
        for (Estate estate : estateList) {
            if(estate.getContractDetails()!=null){
                if(!customerList.contains(customerJpaController.findCustomer(estate.getContractDetails().getContractId().getCustomerId().getId()))){
                    customerList.add(
                        customerJpaController.findCustomer(estate.getContractDetails().getContractId().getCustomerId().getId())
                    );
                }
            }
        }
        
        ContractDetailsJpaController contractJpaController = new ContractDetailsJpaController(utx, emf);
        List<ContractDetails> contractDetails = new ArrayList<>();
        for (Estate estate : estateList) {
            if(estate.getContractDetails()!=null){
                if(!contractDetails.contains(contractJpaController.findContractDetails(estate.getContractDetails().getId()))){
                    contractDetails.add(
                        contractJpaController.findContractDetails(estate.getContractDetails().getId())
                    );
                }
            }
        }
        
        request.setAttribute("contractDetails", contractDetails);
        request.setAttribute("customerList", customerList);
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("estateList", estateList);
        request.setAttribute("countEstate", countEstate);
        request.setAttribute("countEstateSold", countEstateSold);
        request.setAttribute("countEstateUnSold", countEstateUnSold);
        request.setAttribute("sumPrice", sumPrice);
        request.setAttribute("sumPriceUnSold", sumPriceUnSold);
        request.setAttribute("sumPriceSold", sumPriceSold);
        request.setAttribute("displayManager", displayManager);
        request.setAttribute("find", find);
        request.getRequestDispatcher("/page/dashboard/manager/dashboard_project_details.jsp").forward(request, response);
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

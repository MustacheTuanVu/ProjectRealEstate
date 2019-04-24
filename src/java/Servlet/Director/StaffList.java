/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Director;

import Controller.EmployeeJpaController;
import Controller.EstateTypeJpaController;
import Controller.ManagerJpaController;
import Controller.ProjectJpaController;
import Controller.UsersJpaController;
import Entity.Employee;
import Entity.EstateType;
import Entity.Manager;
import Entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "StaffList", urlPatterns = {"/StaffList"})
public class StaffList extends HttpServlet {

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
        UsersJpaController usersJpaController = new UsersJpaController(utx, emf);
        EmployeeJpaController employeeJpaController = new EmployeeJpaController(utx, emf);
        ManagerJpaController managerJpaController = new ManagerJpaController(utx, emf);
        ProjectJpaController projectJpaController = new ProjectJpaController(utx, emf);
        EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);

        // BEGIN SESSION HEADER FONTEND //
        HttpSession session = request.getSession();
        Entity.Users user = (Entity.Users) session.getAttribute("user");
        if (user.getRole().equals("director")) {
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

            List<Users> usersList = usersJpaController.findUsersEntities();
            request.setAttribute("usersList", usersList);

            // BEGIN NAVBAR HEADER FONTEND //
            List<EstateType> estateTypeList = estateTypeControl.findEstateTypeEntities();
            request.setAttribute("estateTypeList", estateTypeList);
            // END NAVBAR HEADER FONTEND //

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
            
            /*-------------------------------------------------*/
            List<Manager> managerList = managerJpaController.findManagerEntities();
            Map<String,Integer> countProjectByManager = new HashMap<>();
            for (Manager manager : managerList) {
                int size = 0;
                size = projectJpaController.getProjectByManager(manager.getManagerId().toString(), "all").size();
                countProjectByManager.put(
                        manager.getManagerId().toString(), 
                        size
                );
            }
            
            
            
            request.setAttribute("countProjectByManager", countProjectByManager);
            request.setAttribute("countProjectByManagerSize", countProjectByManager.size());
            /*-------------------------------------------------*/
            
            request.getRequestDispatcher("/admin/page/dashboard/director/staff_dash.jsp").forward(request, response);
        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
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

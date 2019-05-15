/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Director;

import Controller.EmployeeJpaController;
import Controller.EstateTypeJpaController;
import Controller.ManagerJpaController;
import Controller.UsersJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.Employee;
import Entity.EstateType;
import Entity.Manager;
import Entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "CreateUser", urlPatterns = {"/CreateUser"})
public class CreateUser extends HttpServlet {

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
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
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

            if (request.getParameter("submit") != null) {
                String txtCard = request.getParameter("txtCard");
                String txtAddress = request.getParameter("txtAddress");
                String txtPhone = request.getParameter("txtPhone");
                String txtMail = request.getParameter("txtMail");

                EmployeeJpaController employeeJpaController = new EmployeeJpaController(utx, emf);
                ManagerJpaController managerJpaController = new ManagerJpaController(utx, emf);

                if (employeeJpaController.checkDuplicateCard(txtCard) != null) {
                    request.setAttribute("displayError", "block");
                    request.setAttribute("duplicate", employeeJpaController.checkDuplicateCard(txtCard));
                    request.getRequestDispatcher("/admin/page/dashboard/director/create_user.jsp").forward(request, response);
                } else if (employeeJpaController.checkDuplicateAddress(txtAddress) != null) {
                    request.setAttribute("displayError", "block");
                    request.setAttribute("duplicate", employeeJpaController.checkDuplicateAddress(txtAddress));
                    request.getRequestDispatcher("/admin/page/dashboard/director/create_user.jsp").forward(request, response);
                } else if (employeeJpaController.checkDuplicatePhone(txtPhone) != null) {
                    request.setAttribute("displayError", "block");
                    request.setAttribute("duplicate", employeeJpaController.checkDuplicatePhone(txtPhone));
                    request.getRequestDispatcher("/admin/page/dashboard/director/create_user.jsp").forward(request, response);
                } else if (employeeJpaController.checkDuplicateEmail(txtMail) != null) {
                    request.setAttribute("displayError", "block");
                    request.setAttribute("duplicate", employeeJpaController.checkDuplicatePhone(txtMail));
                    request.getRequestDispatcher("/admin/page/dashboard/director/create_user.jsp").forward(request, response);
                } else {

                    String fullName = request.getParameter("txtName");
                    String userRole = request.getParameter("userRole");
                    String fullNameSet = fullName.replaceAll("\\s+", "").toLowerCase();
                    int index = 0;

                    UsersJpaController usersJpaController = new UsersJpaController(utx, emf);

                    while (true) {
                        if (usersJpaController.checkDuplicate(fullNameSet).size() != 0) {
                            index = index + 1;
                            fullNameSet = fullNameSet + index;
                        } else {
                            break;
                        }
                    }

                    Users users = new Users();
                    users.setUsername(fullNameSet);
                    users.setPassword("realestate24h");
                    users.setStatus(true);
                    users.setRole(userRole);
                    try {
                        usersJpaController.create(users);
                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(CreateUser.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(CreateUser.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    if (users.getRole().equals("manager")) {
                        Manager manager = new Manager();
                        manager.setManagerName(fullName);
                        manager.setManagerAddress(txtAddress);
                        manager.setManagerIndentityCard(txtCard);
                        manager.setManagerPhone(txtPhone);
                        manager.setManagerMail(txtMail);
                        manager.setManagerImg(request.getParameter("txtImg"));
                        manager.setManagerContent("Đang chờ bổ sung");
                        manager.setUserId(users);
                        try {
                            managerJpaController.create(manager);
                        } catch (RollbackFailureException ex) {
                            Logger.getLogger(CreateUser.class.getName()).log(Level.SEVERE, null, ex);
                        } catch (Exception ex) {
                            Logger.getLogger(CreateUser.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    } else {
                        Employee employee = new Employee();
                        employee.setEmployeeName(fullName);
                        employee.setEmployeeAddress(txtAddress);
                        employee.setEmployeeIndentityCard(txtCard);
                        employee.setEmployeePhone(txtPhone);
                        employee.setEmployeeMail(txtMail);
                        employee.setEmployeeImg(request.getParameter("txtImg"));
                        employee.setEmployeeContent("Đang chờ bổ sung");
                        employee.setUserId(users);
                        try {
                            employeeJpaController.create(employee);
                        } catch (RollbackFailureException ex) {
                            Logger.getLogger(CreateUser.class.getName()).log(Level.SEVERE, null, ex);
                        } catch (Exception ex) {
                            Logger.getLogger(CreateUser.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
            }

        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
        }
        // END SESSION HEADER FONTEND //

        // BEGIN NAVBAR HEADER FONTEND //
        List<EstateType> estateTypeList = estateTypeControl.findEstateTypeEntities();
        request.setAttribute("estateTypeList", estateTypeList);
        request.getRequestDispatcher("/admin/page/dashboard/director/create_user.jsp").forward(request, response);
        // END NAVBAR HEADER FONTEND //
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

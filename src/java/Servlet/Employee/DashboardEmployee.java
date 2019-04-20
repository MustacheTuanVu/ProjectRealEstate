/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Employee;

import Controller.ContractDetailsJpaController;
import Controller.EstateTypeJpaController;
import Controller.TransactionsJpaController;
import Entity.Contract;
import Entity.Employee;
import Entity.EstateType;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DashboardEmployee", urlPatterns = {"/DashboardEmployee"})
public class DashboardEmployee extends HttpServlet {

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
        TransactionsJpaController transactionsJpaController = new TransactionsJpaController(utx, emf);
        ContractDetailsJpaController contractDetailsJpaController = new ContractDetailsJpaController(utx, emf);
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
            
            // BEGIN DASHBOARD EMPLOYEE
            List<Contract> contractList = contractDetailsJpaController.getContractByEmployee(user.getEmployee().getId());
            Double sumMoney = 0.0;
            Double sumMoneyCompany = 0.0;
            int estateTransaction = 0;
            Double sumMoneyCompanyByJan = 0.0;
            Double sumMoneyCompanyByFeb = 0.0;
            Double sumMoneyCompanyByMar = 0.0;
            boolean checkMoneyCompany = true;
            for (Contract contract : contractList) {
                sumMoney = sumMoney + transactionsJpaController.getMoneyByContractIDWithEmployee(contract.getId());
                sumMoneyCompany = sumMoneyCompany + transactionsJpaController.getMoneyByContractIDWithCompany(contract.getId());
                estateTransaction = estateTransaction + transactionsJpaController.getEstateCountByContractIDWithEmployee(contract.getId());
                sumMoneyCompanyByJan = sumMoneyCompanyByJan + transactionsJpaController.getMoneyByContractIDWithCompanyMonth(
                        contract.getId(), "-01-");
                sumMoneyCompanyByFeb = sumMoneyCompanyByFeb + transactionsJpaController.getMoneyByContractIDWithCompanyMonth(
                        contract.getId(), "-02-");
                sumMoneyCompanyByMar = sumMoneyCompanyByMar + transactionsJpaController.getMoneyByContractIDWithCompanyMonth(
                        contract.getId(), "-03-");
                checkMoneyCompany = transactionsJpaController.checkMoneyByContractIDWithCompany(estateTransaction);
            }
            request.setAttribute("sumMoney", sumMoney);
            request.setAttribute("sumMoneyCompany", sumMoneyCompany);
            request.setAttribute("estateTransaction", estateTransaction);
            request.setAttribute("sumMoneyCompanyByJan", sumMoneyCompanyByJan);
            request.setAttribute("sumMoneyCompanyByFeb", sumMoneyCompanyByFeb);
            request.setAttribute("sumMoneyCompanyByMar", sumMoneyCompanyByMar);
            request.setAttribute("checkMoneyCompany", checkMoneyCompany);
            // END DASHBOARD EMPLOYEE
        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
        }
        // END SESSION HEADER FONTEND //
        
        // BEGIN NAVBAR HEADER FONTEND //
        
        List<EstateType> estateTypeList = estateTypeControl.findEstateTypeEntities();
        request.setAttribute("estateTypeList", estateTypeList);
        request.getRequestDispatcher("/page/dashboard/employee/index.jsp").forward(request, response);
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

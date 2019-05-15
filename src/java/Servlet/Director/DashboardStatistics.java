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
import Entity.Category;
import Entity.Contract;
import Entity.Estate;
import Entity.EstateType;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
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
@WebServlet(name = "DashboardStatistics", urlPatterns = {"/DashboardStatistics"})
public class DashboardStatistics extends HttpServlet {

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
            TransactionsJpaController transactionsJpaController = new TransactionsJpaController(utx, emf);
            ContractDetailsJpaController contractDetailsJpaController = new ContractDetailsJpaController(utx, emf);
            EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
            EstateJpaController estateJpaController = new EstateJpaController(utx, emf);
            List<Contract> contractList = contractDetailsJpaController.getContractByEmployee(-1);
            Double sumMoney = 0.0;
            Double sumMoneyCompany = 0.0;
            int estateTransaction = 0;
            Double sumMoneyCompanyByJan = 0.0;
            Double sumMoneyCompanyByFeb = 0.0;
            Double sumMoneyCompanyByMar = 0.0;
            int contractCountCompany = 0;
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
                contractCountCompany = contractCountCompany + transactionsJpaController.getCountByContractIDWithCompany(contract.getId());
            }
            request.setAttribute("sumMoney", sumMoney);
            request.setAttribute("sumMoneyCompany", sumMoneyCompany);
            request.setAttribute("estateTransaction", estateTransaction);
            request.setAttribute("sumMoneyCompanyByJan", sumMoneyCompanyByJan);
            request.setAttribute("sumMoneyCompanyByFeb", sumMoneyCompanyByFeb);
            request.setAttribute("sumMoneyCompanyByMar", sumMoneyCompanyByMar);
            request.setAttribute("checkMoneyCompany", checkMoneyCompany);
            request.setAttribute("contractCountCompany", contractCountCompany);

            List<EstateType> estateTypeListPublish = estateTypeControl.sortEstateType();
            request.setAttribute("estateTypeListPublish", estateTypeListPublish);
            request.setAttribute("estateTypeListPublishSize", estateTypeListPublish.size());

            /*
            EstateType estateType1 = new EstateType("1");
            estateType1.getEstateList().get(1).getContractDetails().getContractId().getStatus();
             */
            Map<String, Integer> countEstateSaleList = new HashMap<>();
            Map<String, Double> countMoneyEstateSaleList = new HashMap<>();
            int countUnitEstateSaleList = 0;
            Double countMoneyEstaetSaleList = 0.0;
            for (EstateType estateType : estateTypeListPublish) {
                System.out.println("------"+estateType);
                List<Estate> estatesList = estateType.getEstateList();
                double money = 0.0;
                for (Estate estate : estatesList) {
                    if (estate.getEstateStatus().equals("publish")) {
                        countMoneyEstaetSaleList = countMoneyEstaetSaleList + estate.getPrice();
                        money = money + estate.getPrice();
                    }
                }
                countUnitEstateSaleList = countUnitEstateSaleList + estateTypeControl.getEstateTypeByEstateCountStaticPublic(estateType.getId());
                countEstateSaleList.put(estateType.getId(), estateTypeControl.getEstateTypeByEstateCountStaticPublic(estateType.getId()));
                countMoneyEstateSaleList.put(estateType.getId(), money);
            }
            request.setAttribute("countMoneyEstateSaleList", countMoneyEstateSaleList);
            request.setAttribute("countMoneyEstateSaleListSize", countMoneyEstateSaleList.size());
            request.setAttribute("countMoneyEstaetSaleList", countMoneyEstaetSaleList);
            request.setAttribute("countUnitEstateSaleList", countUnitEstateSaleList);
            request.setAttribute("countEstateSaleList", countEstateSaleList);
            request.setAttribute("countEstateSaleListSize", countEstateSaleList.size());

            Map<String, Integer> countEstateSoldList = new HashMap<>();
            Map<String, Double> countMoneyEstateSoldList = new HashMap<>();
            int countUnitEstateSoldList = 0;
            Double countMoneyEstaetSoldList = 0.0;
            for (EstateType estateType : estateTypeListPublish) {
                List<Estate> estatesList = estateType.getEstateList();
                double money = 0.0;
                for (Estate estate : estatesList) {
                    if (estate.getEstateStatus().equals("sold")) {
                        countMoneyEstaetSoldList = countMoneyEstaetSoldList + estate.getPrice();
                        money = money + estate.getPrice();
                    }
                }
                countUnitEstateSoldList = countUnitEstateSoldList + estateTypeControl.getEstateTypeByEstateCountStaticSold(estateType.getId());
                countEstateSoldList.put(estateType.getId(), estateTypeControl.getEstateTypeByEstateCountStaticSold(estateType.getId()));
                countMoneyEstateSoldList.put(estateType.getId(), money);
            }
            request.setAttribute("countMoneyEstateSoldList", countMoneyEstateSoldList);
            request.setAttribute("countMoneyEstateSoldListSize", countMoneyEstateSoldList.size());
            request.setAttribute("countMoneyEstaetSoldList", countMoneyEstaetSoldList);
            request.setAttribute("countUnitEstateSoldList", countUnitEstateSoldList);
            request.setAttribute("countEstateSoldList", countEstateSoldList);
            request.setAttribute("countEstateSoldListSize", countEstateSaleList.size());

        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
        }
        // END SESSION HEADER FONTEND //

        // BEGIN NAVBAR HEADER FONTEND //
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        request.getRequestDispatcher("/page/dashboard/director/dashboard_statistics.jsp").forward(request, response);
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

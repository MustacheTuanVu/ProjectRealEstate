/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Director;

import Controller.ContractDetailsJpaController;
import Controller.EstateJpaController;
import Controller.EstateTypeJpaController;
import Controller.FeeJpaController;
import Controller.TransactionsJpaController;
import Entity.Contract;
import Entity.Employee;
import Entity.Estate;
import Entity.EstateType;
import Entity.Fee;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
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
@WebServlet(name = "Director", urlPatterns = {"/Director"})
public class Director extends HttpServlet {

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
            if (user.getRole().equals("director")) {
                session.setAttribute("name", "Boss");
                request.setAttribute("role", "director");
                session.setAttribute("image", "http://localhost:8080/ProjectRealEstate/assets/media-demo/boss.png");
                request.setAttribute("active", "Director");

                // DASHBOARD
                EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                TransactionsJpaController transactionsJpaController = new TransactionsJpaController(utx, emf);
                ContractDetailsJpaController contractDetailsJpaController = new ContractDetailsJpaController(utx, emf);
                EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
                EstateJpaController estateJpaController = new EstateJpaController(utx, emf);
                List<Contract> contractList = contractDetailsJpaController.getContractByEmployee(-1);
                DecimalFormat formatter = new DecimalFormat();
                Double sumMoney = 0.0;
                Double sumMoneyCompany = 0.0;
                int estateTransaction = 0;
                Double sumMoneyCompanyByJan1 = 0.0;
                Double sumMoneyCompanyByJan2 = 0.0;
                Double sumMoneyCompanyByJan = 0.0;
                Double sumMoneyCompanyByFeb = 0.0;
                Double sumMoneyCompanyByMar = 0.0;
                int contractCountCompany = 0;
                boolean checkMoneyCompany = true;
                for (Contract contract : contractList) {
                    sumMoney = sumMoney + (transactionsJpaController.getMoneyByContractIDWithEmployee(contract.getId()) );
                    sumMoneyCompany = sumMoneyCompany + transactionsJpaController.getMoneyByContractIDWithCompany(contract.getId());
                    estateTransaction = estateTransaction + transactionsJpaController.getEstateCountByContractIDWithEmployee(contract.getId());
                    sumMoneyCompanyByJan = sumMoneyCompanyByJan + transactionsJpaController.getMoneyByContractIDWithCompanyMonth(
                            contract.getId(), "-03-");
                    sumMoneyCompanyByFeb = sumMoneyCompanyByFeb + transactionsJpaController.getMoneyByContractIDWithCompanyMonth(
                            contract.getId(), "-04-");
                    sumMoneyCompanyByMar = sumMoneyCompanyByMar + transactionsJpaController.getMoneyByContractIDWithCompanyMonth(
                            contract.getId(), "-05-");
                    
                    sumMoneyCompanyByJan1 = sumMoneyCompanyByJan1 + transactionsJpaController.getMoneyByContractIDWithCompanyMonth(
                            contract.getId(), "-01-");
                    sumMoneyCompanyByJan2 = sumMoneyCompanyByJan2 + transactionsJpaController.getMoneyByContractIDWithCompanyMonth(
                            contract.getId(), "-02-");
                    
                    checkMoneyCompany = transactionsJpaController.checkMoneyByContractIDWithCompany(estateTransaction);
                    contractCountCompany = contractCountCompany + transactionsJpaController.getCountByContractIDWithCompany(contract.getId());
                }
                request.setAttribute("sumMoney", sumMoney/1000000000);
                request.setAttribute("sumMoneyCompany", sumMoneyCompany/1000000000);
                request.setAttribute("estateTransaction", estateTransaction);
                request.setAttribute("sumMoneyCompanyByJan", sumMoneyCompanyByJan/1000000000);
                request.setAttribute("sumMoneyCompanyByFeb", sumMoneyCompanyByFeb/1000000000);
                request.setAttribute("sumMoneyCompanyByMar", sumMoneyCompanyByMar/1000000000);
                request.setAttribute("trendMoneyCompany", -(sumMoneyCompanyByFeb - sumMoneyCompanyByMar)/sumMoneyCompanyByFeb*100);
                request.setAttribute("checkMoneyCompany", checkMoneyCompany);
                request.setAttribute("contractCountCompany", contractCountCompany);

                List<EstateType> estateTypeListPublish1 = estateTypeControl.sortEstateType();
                List<EstateType> estateTypeListPublish = estateTypeControl.findEstateTypeEntities();
                request.setAttribute("estateTypeListPublish", estateTypeListPublish);
                request.setAttribute("estateTypeListPublish1", estateTypeListPublish1);
                request.setAttribute("estateTypeListPublishSize", estateTypeListPublish.size());
                
                Map<String, Integer> countEstateSaleList = new HashMap<>();
                Map<String, Double> countMoneyEstateSaleList = new HashMap<>();
                int countUnitEstateSaleList = 0;
                Double countMoneyEstaetSaleList = 0.0;
                for (EstateType estateType : estateTypeListPublish) {
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

                FeeJpaController feeJpaController = new FeeJpaController(utx, emf);
                Fee fee = feeJpaController.findFee(1);
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
                            money = money + estate.getPrice()*fee.getFeeEstate()/100;
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
                
                // employee report
                List<Employee> employeeListTop = estateTypeControl.sortEmployeeByMoney();
                Map<Integer, Double> countMoneyEmployeeSold = new HashMap<>();
                for (Employee employee : employeeListTop) {
                    countMoneyEmployeeSold.put(employee.getId(), estateTypeControl.getMoneyByEmployee(employee.getId()));
                }
                
                request.setAttribute("employeeListTop", employeeListTop);
                request.setAttribute("countMoneyEmployeeSold", countMoneyEmployeeSold);
                request.setAttribute("countMoneyEmployeeSoldSize", countMoneyEmployeeSold.size());
                
                

                request.getRequestDispatcher("/admin/page/dashboard/director/index.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin");
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

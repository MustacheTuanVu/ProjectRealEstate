/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Contract;

import Controller.ContractJpaController;
import Controller.CustomerJpaController;
import Controller.EmployeeJpaController;
import Controller.EstateJpaController;
import Controller.EstateStatusJpaController;
import Controller.EstateTypeJpaController;
import Controller.TransactionsJpaController;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.Contract;
import Entity.Customer;
import Entity.Employee;
import Entity.Estate;
import Entity.Users;
import Entity.Transactions;
import Servlet.Estate.EstateCreate;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.Entity;
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
@WebServlet(name = "CreateContract", urlPatterns = {"/CreateContract"})
public class CreateContract extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        // BEGIN SESSION HEADER FONTEND //
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");
        if (users != null) {
            request.setAttribute("users", "user");
            request.setAttribute("displayLogin", "none");
            request.setAttribute("displayUser", "block");

            /*-----------------------------------------------------------*/
            EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
            CustomerJpaController customerControl = new CustomerJpaController(utx, emf);
            EstateJpaController estateControl = new EstateJpaController(utx, emf);
            EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
            EmployeeJpaController employeeControl = new EmployeeJpaController(utx, emf);
            ContractJpaController contractJpaController = new ContractJpaController(utx, emf);

            Estate estate = estateControl.findEstate(request.getParameter("estateID"));
            Customer customer = new Customer();
            if (users.getRole().equals("customer")) {
                session.setAttribute("name", users.getCustomer().getCustomerName());
                request.setAttribute("role", "customer");
                session.setAttribute("image", users.getCustomer().getCustomerImg());
                customer = customerControl.findCustomer(users.getId());
                request.setAttribute("displayTransaction", "none");
            }
            if (users.getRole().equals("employee")) {
                session.setAttribute("name", users.getEmployee().getEmployeeName());
                request.setAttribute("role", "employee");
                session.setAttribute("image", users.getEmployee().getEmployeeImg());
                customer = customerControl.findCustomer(estate.getContractDetails().getContractId().getCustomerId().getId());
                request.setAttribute("displayTransaction", "block");
            } else {
                request.setAttribute("displayTransaction", "none");
            }
            Employee employee = employeeControl.findEmployee(Integer.parseInt(request.getParameter("employeeID")));
            Contract contract = contractJpaController.findContract(estate.getContractDetails().getContractId().getId());

            request.setAttribute("estate", estate);
            request.setAttribute("employee", employee);
            request.setAttribute("customer", customer);
            request.setAttribute("contract", contract);
            request.setAttribute("estateTypeList", estateTypeControl.findEstateTypeEntities());
            request.getRequestDispatcher("/page/guest/echo_contact.jsp").forward(request, response);
        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
            response.sendRedirect(request.getContextPath() + "/LoginUser");
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
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");
        if (users.getRole().equals("employee")) {
            Double price = Double.parseDouble(request.getParameter("price"));
            Double money = Double.parseDouble(request.getParameter("money"));

            
            if (price > money) {
                response.sendRedirect(request.getContextPath() + "/EstateList?user=employee&"
                        + "modalTranFail=show"
                );
            } else if (Objects.equals(price, money)) {
                System.out.println("okeeeeeee");
                EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                CustomerJpaController customerControl = new CustomerJpaController(utx, emf);
                TransactionsJpaController transactionsJpaController = new TransactionsJpaController(utx, emf);
                ContractJpaController contractJpaController = new ContractJpaController(utx, emf);
                Customer customer = customerControl.findCustomer(Integer.parseInt(request.getParameter("customer")));
                Transactions transactions = new Transactions();
                transactions.setCustomerOffered(customer);
                
                SimpleDateFormat sdff = new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
                Date date = new Date();
                try {
                    transactions.setTransactionsDate(sdff.parse(date.toString()));
                } catch (ParseException ex) {
                    Logger.getLogger(EstateCreate.class.getName()).log(Level.SEVERE, null, ex);
                }

                int contractID = Integer.parseInt(request.getParameter("contract"));
                transactions.setContractId(contractJpaController.findContract(contractID));
                transactions.setMoney(money);
                try {
                    transactionsJpaController.create(transactions);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(CreateContract.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(CreateContract.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                EstateJpaController estateControl = new EstateJpaController(utx, emf);
                EstateStatusJpaController estateStatusJpaController = new EstateStatusJpaController(utx, emf);
                String estateID = estateControl.getEstateIDByContract(String.valueOf(contractID));
                Estate estate = estateControl.findEstate(estateID);
                estate.setEstateStatus("sold");
                if(estate.getEstateStatusId().getId()==1){
                    estate.setEstateStatusId(estateStatusJpaController.findEstateStatus(4));
                }else if(estate.getEstateStatusId().getId()==2){
                    estate.setEstateStatusId(estateStatusJpaController.findEstateStatus(5));
                }
                
                try {
                    estateControl.edit(estate);
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(CreateContract.class.getName()).log(Level.SEVERE, null, ex);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(CreateContract.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(CreateContract.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                Contract contract = contractJpaController.findContract(contractID);
                contract.setStatus("done");
                try {
                    contractJpaController.edit(contract);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(CreateContract.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(CreateContract.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                response.sendRedirect(request.getContextPath() + "/EstateList?user=employee&"
                        + "modalTranOke=show"
                );
            }

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

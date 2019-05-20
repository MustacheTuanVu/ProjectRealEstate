/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Contract;

import Controller.ContractDetailsJpaController;
import Controller.ContractJpaController;
import Controller.ContractTypeJpaController;
import Controller.CustomerJpaController;
import Controller.EmployeeJpaController;
import Controller.EstateJpaController;
import Controller.FeeJpaController;
import Controller.PaymentFrequencyJpaController;
import Controller.ScheduleJpaController;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.PreexistingEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.Contract;
import Entity.ContractDetails;
import Entity.ContractType;
import Entity.Customer;
import Entity.Employee;
import Entity.Estate;
import Entity.PaymentFrequency;
import Entity.Schedule;
import Entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import Entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ProduceContractBuy", urlPatterns = {"/ProduceContractBuy"})
public class ProduceContractBuy extends HttpServlet {

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
            request.setAttribute("users", "user");
            request.setAttribute("displayLogin", "none");
            request.setAttribute("displayUser", "block");
            session.setAttribute("name", users.getCustomer().getCustomerName());
            request.setAttribute("role", "customer");
            session.setAttribute("image", users.getCustomer().getCustomerImg());
            EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
            FeeJpaController feeControl = new FeeJpaController(utx, emf);
            Double fee = feeControl.findFee(Integer.parseInt("1")).getFeeEstate();

            /*-----------------------------------------------------------*/
            if (request.getParameter("paymentAmount") != null) {
                String employeeID = request.getParameter("employeeID");
                String contractTypeID = "2";
                String paymentAmount = request.getParameter("paymentAmount");

                
                ContractJpaController contractControl = new ContractJpaController(utx, emf);
                ContractTypeJpaController contractTypeControl = new ContractTypeJpaController(utx, emf);
                
                EmployeeJpaController employeeControl = new EmployeeJpaController(utx, emf);
                PaymentFrequencyJpaController paymentFrequencyControl = new PaymentFrequencyJpaController(utx, emf);
                CustomerJpaController customerControl = new CustomerJpaController(utx, emf);

                Employee employee = employeeControl.findEmployee(Integer.parseInt(employeeID));
                ContractType contractType = contractTypeControl.findContractType(Integer.parseInt(contractTypeID));
                PaymentFrequency paymentFrequency = paymentFrequencyControl.findPaymentFrequency(Integer.parseInt("1"));
                Customer customer = customerControl.findCustomer(users.getCustomer().getId());
                

                Contract contract = new Contract();
                contract.setEmployeeId(employee);
                contract.setCustomerId(customer);
                contract.setContractTypeId(contractType);
                contract.setContractDetails("none");
                contract.setPaymentFrequency(paymentFrequency);
                contract.setFeePrecentage(fee);
                contract.setPaymentAmount(Double.parseDouble(paymentAmount)*fee/100);
                contract.setDocumentUrl("wait");
                contract.setStatus("waitting to transaction");

                try {
                    contractControl.create(contract);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
                }

                /*-----------------------------------------------------------*/
                String estateId = request.getParameter("estateId");
                ContractDetailsJpaController contractDetailsControl = new ContractDetailsJpaController(utx, emf);
                EstateJpaController estateControl = new EstateJpaController(utx, emf);
                Estate estate = estateControl.findEstate(estateId);

                estate.setEstateStatus("waitting to transaction");

                try {
                    estateControl.edit(estate);
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
                }

                ContractDetails contractDetails = new ContractDetails();
                contractDetails.setContractId(contract);
                contractDetails.setEstateId(estate);

                try {
                    contractDetailsControl.create(contractDetails);
                } catch (PreexistingEntityException ex) {
                    Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
                }

                /*-----------------------------------------------------------*/
                ScheduleJpaController scheduleJpaController = new ScheduleJpaController(utx, emf);
                Schedule schedule = new Schedule();
                schedule.setCustomerId(customer);
                schedule.setEmployeeId(employee);
                schedule.setEstateId(estate);

                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                Date day;
                try {
                    day = sdf.parse(request.getParameter("contactTime"));
                    schedule.setContactTime(day);
                } catch (ParseException ex) {
                    Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                schedule.setContactContext(request.getParameter("contactContext"));
                schedule.setContactContext("unread");
                
                try {
                    scheduleJpaController.create(schedule);
                    response.sendRedirect(request.getContextPath() + "/DashboardUser");
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
            response.sendRedirect(request.getContextPath() + "/LoginUser");
                    request.setAttribute("role", "customer");
            session.setAttribute("image", users.getCustomer().getCustomerImg());
            
            /*-----------------------------------------------------------*/
            
            String employeeID = request.getParameter("employeeID");
            String contractTypeID = "2";  
            String paymentAmount = request.getParameter("paymentAmount"); 
            
            EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
            ContractJpaController contractControl = new ContractJpaController(utx, emf);
            ContractTypeJpaController contractTypeControl = new ContractTypeJpaController(utx, emf);
            FeeJpaController feeControl = new FeeJpaController(utx, emf);
            EmployeeJpaController employeeControl = new EmployeeJpaController(utx, emf);
            PaymentFrequencyJpaController paymentFrequencyControl = new PaymentFrequencyJpaController(utx, emf);
            CustomerJpaController customerControl = new CustomerJpaController(utx, emf);
            
            Employee employee = employeeControl.findEmployee(Integer.parseInt(employeeID));
            ContractType contractType = contractTypeControl.findContractType(Integer.parseInt(contractTypeID));
            PaymentFrequency paymentFrequency = paymentFrequencyControl.findPaymentFrequency(Integer.parseInt("1"));
            Customer customer = customerControl.findCustomer(users.getId());
            Double fee = feeControl.findFee(Integer.parseInt("1")).getFeeEstate();
            
            Contract contract = new Contract();
            contract.setEmployeeId(employee);
            contract.setCustomerId(customer);
            contract.setContractTypeId(contractType);
            contract.setContractDetails("none");
            contract.setPaymentFrequency(paymentFrequency);
            contract.setFeePrecentage(fee);
            contract.setPaymentAmount(Double.parseDouble(paymentAmount));
            contract.setDocumentUrl("wait");
            contract.setStatus("waitting to transaction");
            
            try {
                contractControl.create(contract);
            } catch (RollbackFailureException ex) {
                Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            /*-----------------------------------------------------------*/
            String estateId = request.getParameter("estateId");
            ContractDetailsJpaController contractDetailsControl = new ContractDetailsJpaController(utx, emf);
            EstateJpaController estateControl = new EstateJpaController(utx, emf);
            Estate estate = estateControl.findEstate(estateId);
            
            estate.setEstateStatus("waitting to transaction");
            
            try {
                estateControl.edit(estate);
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
            } catch (RollbackFailureException ex) {
                Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            ContractDetails contractDetails = new ContractDetails();
            contractDetails.setContractId(contract);
            contractDetails.setEstateId(estate);
            
            try {
                contractDetailsControl.create(contractDetails);
                response.sendRedirect(request.getContextPath()+"/DashboardUser");
            } catch (PreexistingEntityException ex) {
                Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
            } catch (RollbackFailureException ex) {
                Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
            }
            
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

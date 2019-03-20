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
import Controller.EstateJpaController;
import Controller.EstateStatusJpaController;
import Controller.EstateTypeJpaController;
import Controller.FeeJpaController;
import Controller.PaymentFrequencyJpaController;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.PreexistingEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.Contract;
import Entity.ContractDetails;
import Entity.Customer;
import Entity.Estate;
import Entity.EstateStatus;
import Entity.EstateType;
import Entity.Users;
import java.io.IOException;
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
@WebServlet(name = "RequestSale", urlPatterns = {"/RequestSale"})
public class RequestSale extends HttpServlet {

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

            // BEGIN EMPLOYEE LIST SHOW//
            EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
            EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);

            request.setAttribute("estateTypeList", estateTypeControl.findEstateTypeEntities());
            request.getRequestDispatcher("/page/guest/request_sale.jsp").forward(request, response);
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
        // BEGIN CREATE ESTATE //
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        EstateJpaController estateControl = new EstateJpaController(utx, emf);
        EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
        EstateStatusJpaController estateStatusControl = new EstateStatusJpaController(utx, emf);

        EstateType estateType = estateTypeControl.findEstateType(request.getParameter("estateType"));
        EstateStatus estateStatus = estateStatusControl.findEstateStatus(Integer.parseInt(request.getParameter("estateStatus")));

        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String price = request.getParameter("price");
        String content = request.getParameter("content");

        Estate estate = new Estate();
        estate.setEstateName(address1);
        estate.setEstateTypeId(estateType);
        estate.setEstateStatusId(estateStatus);
        estate.setAddress1(address1);
        estate.setAddress2(address2);
        estate.setPrice(Double.parseDouble(price));
        estate.setEstateDescription(content);
        estate.setEstateStatus("waitting for employee");
        estate.setImage1st("http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg");
        estate.setImage1st("http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg");
        estate.setImage1st("http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg");
        estate.setImage1st("http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg");
        estate.setImage1st("http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg");

        int indexID = 1;
        String estateID = "1";

        while (true) {
            if (estateControl.findEstate(estateID) != null) {
                indexID = indexID + 1;
                estateID = String.valueOf(indexID);
            } else {
                break;
            }
        }
        estate.setId(estateID);

        try {
            estateControl.create(estate);
        } catch (RollbackFailureException ex) {
            Logger.getLogger(RequestSale.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(RequestSale.class.getName()).log(Level.SEVERE, null, ex);
        }
        // END CREATE ESTATE //

        // BEGIN CREATE CONTRACT //
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");
        CustomerJpaController customerControl = new CustomerJpaController(utx, emf);
        ContractJpaController contractControl = new ContractJpaController(utx, emf);
        ContractTypeJpaController contractTypeControl = new ContractTypeJpaController(utx, emf);
        PaymentFrequencyJpaController paymentFrequencyControl = new PaymentFrequencyJpaController(utx, emf);
        FeeJpaController feeControl = new FeeJpaController(utx, emf);

        Customer customer = users.getCustomer();
        Contract contract = new Contract();
        contract.setCustomerId(customer);
        contract.setContractTypeId(contractTypeControl.findContractType(1002));
        contract.setContractDetails("none");
        contract.setPaymentFrequency(paymentFrequencyControl.findPaymentFrequency(Integer.parseInt("1")));
        contract.setFeePrecentage(feeControl.findFee(Integer.parseInt("1")).getFeeEstate());
        contract.setPaymentAmount(Double.parseDouble(price));
        contract.setDocumentUrl("wait");
        contract.setStatus("waitting for employee");

        try {
            contractControl.create(contract);
        } catch (RollbackFailureException ex) {
            Logger.getLogger(RequestSale.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(RequestSale.class.getName()).log(Level.SEVERE, null, ex);
        }

        /*-----------------------------------------------------------*/
        ContractDetailsJpaController contractDetailsControl = new ContractDetailsJpaController(utx, emf);
        ContractDetails contractDetails = new ContractDetails();
        contractDetails.setContractId(contract);
        contractDetails.setEstateId(estate);

        try {
            contractDetailsControl.create(contractDetails);
            response.sendRedirect(request.getContextPath() + "/index");
        } catch (PreexistingEntityException ex) {
            Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
        } catch (RollbackFailureException ex) {
            Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProduceContractBuy.class.getName()).log(Level.SEVERE, null, ex);
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

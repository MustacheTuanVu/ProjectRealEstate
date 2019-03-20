/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Estate;

import Controller.ContractDetailsJpaController;
import Controller.ContractJpaController;
import Controller.ContractTypeJpaController;
import Controller.CustomerJpaController;
import Controller.EstateJpaController;
import Controller.EstateStatusJpaController;
import Controller.EstateTypeJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.Contract;
import Entity.ContractDetails;
import Entity.ContractType;
import Entity.Customer;
import Entity.Estate;
import Entity.EstateStatus;
import Entity.EstateType;
import Entity.Users;
import Servlet.Contract_Details.Create_Contract_Details_Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "CustomerEstateCreate", urlPatterns = {"/CustomerEstateCreate"})
public class CustomerEstateCreate extends HttpServlet {

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
        HttpSession session = request.getSession();
        Entity.Users users = (Entity.Users) session.getAttribute("user");
        EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.CustomerJpaController cus = new CustomerJpaController(utx, em);
        
        if (cus.findByIdUser(users) != null) {
            if (users != null) {

                if (users.getRole().equals("Customer")) {

                    Controller.EstateStatusJpaController estCon = new EstateStatusJpaController(utx, em);
                    Controller.EstateTypeJpaController typeCon = new EstateTypeJpaController(utx, em);
                    Controller.ContractTypeJpaController conType = new ContractTypeJpaController(utx, em);

                    request.setAttribute("listType", conType.findContractTypeEntities());
                    request.setAttribute("typeCon", typeCon.findEstateTypeEntities());
                    request.setAttribute("estCon", estCon.findEstateStatusEntities());
                    request.getRequestDispatcher("/page/dashboard/customer_dashboard_estate_create.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/LoginUser");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/LoginUser");
            }
        }
        else response.sendRedirect(request.getContextPath() + "/CustomerDetails");
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
        //processRequest(request, response);
        HttpSession session = request.getSession();
        Entity.Users users = (Entity.Users) session.getAttribute("user");
        System.out.println("User " + users);

//        if (users != null) {
//            if (users.getRole().equals("Customer")) {
                EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
                Controller.ContractJpaController conCon = new ContractJpaController(utx, em);

                try {
                    //processRequest(request, response); 
                    Controller.EstateJpaController estCon = new EstateJpaController(utx, em);
                    Entity.EstateStatus estSta = new EstateStatus(1);
                    Entity.EstateType type = new EstateType((request.getParameter("estateTypeId")));

                    Entity.Estate est = new Estate();
                    String tam = String.valueOf(estCon.getEstateCount() + 1);
                    est.setId("est" + tam);
                    est.setEstateName(request.getParameter("estateName"));
                    est.setAddress1(request.getParameter("address1"));
                    est.setEstateTypeId(type);
                    est.setEstateDescription("123");
                    est.setEstateStatusId(estSta);

                    estCon.create(est);
                    System.out.println("Create Completed...");

                    createContract(users, em, Integer.valueOf(request.getParameter("typeContract")), tam);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(CustomerEstateCreate.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(CustomerEstateCreate.class.getName()).log(Level.SEVERE, null, ex);
                }
//            } else {
//                response.sendRedirect(request.getContextPath() + "/LoginUser");
//            }
//        } else {
//            response.sendRedirect(request.getContextPath() + "/LoginUser");
//        }
    }

    // ham tao contract tam
    private boolean createContract(Users idCus, EntityManagerFactory em, int ContractType, String idEstate) {
        Controller.ContractJpaController conCon = new ContractJpaController(utx, em);
        Controller.CustomerJpaController customerCon = new CustomerJpaController(utx, em); // +++
        Controller.ContractDetailsJpaController delCon = new ContractDetailsJpaController(utx, em);

        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

            Entity.Contract con = new Contract();
            Entity.Customer cus = (Entity.Customer) customerCon.findByIdUser(idCus); // +++
            Entity.ContractDetails del = new ContractDetails();
            cus.setUserId(idCus);

            con.setCustomerId(cus);
            con.setContractTypeId(new ContractType(ContractType));
            con.setContractDetails("waiting");
            con.setDateSigned(format.parse("2019-03-05"));
            con.setDocumentUrl("waiting");
            con.setStatus("Waiting");
            conCon.create(con);
            System.out.println("create contract Completed...");

            del.setEstateId(new Estate("est" + idEstate));
            del.setContractId(con);
            delCon.create(del);
            System.out.println("create estate Completed...");
            return true;
        } catch (RollbackFailureException ex) {
            Logger.getLogger(CustomerEstateCreate.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CustomerEstateCreate.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
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

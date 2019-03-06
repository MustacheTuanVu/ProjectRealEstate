/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Contract;

import Controller.ContractJpaController;
import Controller.ContractTypeJpaController;
import Controller.CustomerJpaController;
import Controller.EmployeeJpaController;
import Controller.PaymentFrequencyJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.Contract;
import Entity.ContractType;
import Entity.Customer;
import Entity.Employee;
import Entity.PaymentFrequency;
import java.io.IOException;
import java.text.ParseException;
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
 * @author Cuong
 */
@WebServlet(name = "ContractCreate", urlPatterns = {"/ContractCreate"})
public class Create_Contract_Servlet extends HttpServlet {

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
        Entity.Users user = (Entity.Users) session.getAttribute("user");
        if (user != null) {
            if (user.getRole().equals("Admin")) {

                EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
                Controller.ContractTypeJpaController conType = new ContractTypeJpaController(utx, em);
                Controller.CustomerJpaController cusCon = new CustomerJpaController(utx, em);
                Controller.EmployeeJpaController empCon = new EmployeeJpaController(utx, em);
                Controller.PaymentFrequencyJpaController payCon = new PaymentFrequencyJpaController(utx, em);
                // Controller.ContractJpaController conCon= new ContractJpaController(utx, em);

                request.setAttribute("listType", conType.findContractTypeEntities());
                request.setAttribute("listCus", cusCon.findCustomerEntities());
                request.setAttribute("listEmp", empCon.findEmployeeEntities());
                request.setAttribute("listPay", payCon.findPaymentFrequencyEntities());
                request.getRequestDispatcher("/page/dashboard/dashboard_contract_create.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/LoginUser");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/LoginUser");
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

        try {
            processRequest(request, response);

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); // THEM, SUA
            //SimpleDateFormat format= new SimpleDateFormat("dd/MM/yyyy"); // XEM

            EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.ContractJpaController conCon = new ContractJpaController(utx, em);

            Entity.Contract con = new Contract();
            Entity.Customer cus = new Customer(Integer.parseInt(request.getParameter("cus")));
            Entity.Employee emp = new Employee(Integer.parseInt(request.getParameter("emp")));
            Entity.ContractType type = new ContractType(Integer.parseInt(request.getParameter("type")));
            Entity.PaymentFrequency pay = new PaymentFrequency(Integer.parseInt(request.getParameter("pay")));

            con.setCustomerId(cus);
            con.setEmployeeId(emp);
            con.setContractTypeId(type);
            con.setContractDetails(request.getParameter("txtDetails").trim());
            con.setPaymentFrequency(pay);
            con.setPaymentAmount(Double.parseDouble(reString(request.getParameter("currency-field"))));
            con.setFeePrecentage(Double.parseDouble(request.getParameter("txtFee")));
            String tam = request.getParameter("txtdate");
            con.setDateSigned(format.parse(tam));

            con.setDocumentUrl("123");

            conCon.create(con);

            // response.sendRedirect(request.getContextPath()+"/ContractList");
        } catch (ParseException ex) {
            Logger.getLogger(Create_Contract_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (RollbackFailureException ex) {
            Logger.getLogger(Create_Contract_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Create_Contract_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public String reString(String oldString) {

        oldString = oldString.replace("$", "");
        oldString = oldString.replace(",", "");
        oldString = oldString.replace(".", "");
        return oldString.substring(0, oldString.length() - 2);
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

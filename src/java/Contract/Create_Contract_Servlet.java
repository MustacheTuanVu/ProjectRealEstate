/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contract;

import Controller.AssignDetailsJpaController;
import Controller.ContractTypeJpaController;
import Controller.CustomerJpaController;
import Controller.EmployeeJpaController;
import Controller.PaymentFrequencyJpaController;
import Entity.AssignDetails;
import Entity.Customer;
import Entity.Employee;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "Create_Contract_Servlet", urlPatterns = {"/Create_Contract_Servlet"})
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
        
    /*
        customerID -- session
        employeeID -- estateID -> assignID ->employeeID
        contractType -- "Hop dong moi gioi"
        contractDetails -- "wait"
        payment freequency -- "ONCE"
        payment amount -- estate 
        fee amount -- ""
        date_sign -- now
        document_url -- "wait"
        status -- "wait to employee"
    */
    UserTransaction utx;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Entity.Users user = (Entity.Users) session.getAttribute("user");
        
        if (user != null) {
            if (user.getRole().equals("employee")) {
                EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
                
                String estateID = request.getParameter("estateID");
                AssignDetailsJpaController assignCon = new AssignDetailsJpaController(utx, em);
                //AssignDetails assign = assignCon.getEmployeeByEstateID();
                
                EmployeeJpaController empCon = new EmployeeJpaController(utx, em);
                
                Controller.CustomerJpaController cusCon = new CustomerJpaController(utx, em);
                Customer customer = cusCon.getCustomerByUserID(user.getId());
                
                
                
                Controller.ContractTypeJpaController conType = new ContractTypeJpaController(utx, em);
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

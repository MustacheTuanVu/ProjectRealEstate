/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Transaction;

import Controller.ContractJpaController;
import Controller.CustomerJpaController;
import Controller.TransactionsJpaController;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.Contract;
import Entity.Customer;
import Entity.Transactions;
import java.io.IOException;
import java.io.PrintWriter;
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
import javax.transaction.UserTransaction;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "TransactionEdit", urlPatterns = {"/TransactionEdit"})
public class TransactionEdit extends HttpServlet {

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
        try {
            
            SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
            
            EntityManagerFactory em= (EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.TransactionsJpaController tranCon= new TransactionsJpaController(utx, em);
            Entity.Transactions tran = tranCon.findTransactions(Integer.valueOf(request.getParameter("txtID")));
            
            tran.setContractId(new Contract(Integer.valueOf(request.getParameter("con"))));
            tran.setCustomerOffered(new Customer(Integer.valueOf(request.getParameter("cus"))));
            tran.setMoney(Double.valueOf(reString(request.getParameter("currency-field"))));
            tran.setTransactionsNote(request.getParameter("txtDetails"));
            tran.setTransactionsDate(format.parse(request.getParameter("txtdate")));
            tran.setId(Integer.valueOf(request.getParameter("txtID")));
            
            tranCon.edit(tran);
            
            System.out.println("Edit Complted");
            
            request.getRequestDispatcher("/TransactionList").forward(request, response);
            
        } catch (ParseException ex) {
            Logger.getLogger(TransactionEdit.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(TransactionEdit.class.getName()).log(Level.SEVERE, null, ex);
        } catch (RollbackFailureException ex) {
            Logger.getLogger(TransactionEdit.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(TransactionEdit.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
   public String reString(String oldString){
        
         oldString=oldString.replace("$", "");
         oldString=oldString.replace(",", "");
         oldString=oldString.replace(".", "");
        return oldString.substring(0, oldString.length()-2);
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

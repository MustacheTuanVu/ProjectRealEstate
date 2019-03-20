/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Project;

import Controller.ProjectJpaController;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.Manager;
import Entity.Project;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
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
@WebServlet(name = "ProjectEdit", urlPatterns = {"/ProjectEdit"})
public class ProjectEdit extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProjectEdit</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProjectEdit at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
            //processRequest(request, response);
            
            EntityManagerFactory emf= (EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.ProjectJpaController proCon= new ProjectJpaController(utx, emf);
            
            Entity.Project pro=proCon.findProject(request.getParameter("id"));
            //Entity.Project pro= new Project();
            //Entity.Manager mana= new Manager();
            //mana.setManagerId(Integer.valueOf(request.getParameter("manager")));
            
            EntityManager em = emf.createEntityManager();
            Manager mana = em.getReference(Manager.class, Integer.valueOf(request.getParameter("manager")));
            
            //pro.setProjectId(request.getParameter("projectId"));
            pro.setBlockNumber(Integer.valueOf(request.getParameter("blockNumber")));
            pro.setDocumentUrl("123");
            pro.setImage1st(request.getParameter("image1st"));
            pro.setImage2st(request.getParameter("image2st"));
            pro.setImage3st(request.getParameter("image3st"));
            pro.setImage4st(request.getParameter("image4st"));
            pro.setImage5st(request.getParameter("image5st"));
            pro.setManagerId(mana);
            pro.setProjectAddress(request.getParameter("addressProject"));
            pro.setProjectArea(Double.valueOf(request.getParameter("projectArea")));
            pro.setProjectName(request.getParameter("projectName"));
            pro.setProjectStatus(request.getParameter("Waiting"));
            pro.setStatus(request.getParameter("Waiting"));
            
            System.out.println("id "+mana.getManagerId());
            System.out.println("number "+request.getParameter("blockNumber"));
            
            proCon.edit(pro);
            
            System.out.println("Edit Completed !!!");
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ProjectEdit.class.getName()).log(Level.SEVERE, null, ex);
        } catch (RollbackFailureException ex) {
            Logger.getLogger(ProjectEdit.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProjectEdit.class.getName()).log(Level.SEVERE, null, ex);
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

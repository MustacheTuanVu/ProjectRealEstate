/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Project;

import Controller.ManagerJpaController;
import Controller.ProjectJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.Manager;
import Entity.Project;
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
 * @author Cuong
 */
@WebServlet(name = "CreateProject", urlPatterns = {"/CreateProject"})
public class CreateProject extends HttpServlet {

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
        if (users != null) {

            if (users.getRole().equals("Admin")) {
                EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
                Controller.ManagerJpaController manaList = new ManagerJpaController(utx, em);

                request.setAttribute("list", manaList.findManagerEntities());

                request.getRequestDispatcher("/page/dashboard/dashboard_create_project.jsp").forward(request, response);
            }else {
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try {
                processRequest(request, response);

                EntityManagerFactory em = (EntityManagerFactory) getServletContext().getAttribute("emf");
                Controller.ProjectJpaController proCon = new ProjectJpaController(utx, em);

                Entity.Manager mana = new Manager(Integer.valueOf(request.getParameter("manager")));
                Entity.Project pro = new Project();

                int indexID = 1;
                String proID = "1";

                while (true) {
                    if (proCon.findProject(proID) != null) {
                        indexID = indexID + 1;
                        proID = String.valueOf(indexID);
                    } else {
                        break;
                    }
                }

                pro.setProjectId(proID);
                pro.setBlockNumber(Integer.valueOf(request.getParameter("blockNumber")));
                pro.setDocumentUrl("123");
                pro.setManagerId(mana);
                pro.setProjectAddress(request.getParameter("addressProject"));
                //pro.setProjectArea(Double.valueOf(request.getParameter("projectArea")));
                pro.setProjectName(request.getParameter("projectName"));
                pro.setProjectStatus("publish");
                pro.setStatus("publish");
                pro.setImage1st(request.getParameter("image1st"));
                pro.setImage2st(request.getParameter("image2st"));
                pro.setImage3st(request.getParameter("image3st"));
                pro.setImage4st(request.getParameter("image4st"));
                pro.setImage5st(request.getParameter("image5st"));

                proCon.create(pro);
                response.sendRedirect("/ProjectList?user=manager");
            } catch (RollbackFailureException ex) {
                Logger.getLogger(CreateProject.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(CreateProject.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
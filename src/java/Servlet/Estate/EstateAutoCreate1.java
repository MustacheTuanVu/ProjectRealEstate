/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Estate;

import Controller.EstateJpaController;
import Controller.EstateTypeJpaController;
import Controller.ProjectDetailsJpaController;
import Controller.ProjectJpaController;
import Entity.Estate;
import Entity.EstateType;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
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
@WebServlet(name = "EstateAutoCreate1", urlPatterns = {"/EstateAutoCreate1"})
public class EstateAutoCreate1 extends HttpServlet {

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
    String projectID = null;
    List<Estate> estateList = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        Entity.Users user = (Entity.Users) session.getAttribute("user");

        if (user != null) {
            if (user.getRole().equals("manager")) {
                EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                EntityManager em = emf.createEntityManager();

                request.setAttribute("user", "user");
                request.setAttribute("displayLogin", "none");
                request.setAttribute("displayUser", "block");

                session.setAttribute("name", user.getManager().getManagerName());
                request.setAttribute("role", "manager");
                session.setAttribute("image", user.getManager().getManagerAddress());
                EstateTypeJpaController estateType = new EstateTypeJpaController(utx, emf);
                Controller.ProjectJpaController projectController = new ProjectJpaController(utx, emf);
                List<EstateType> estateTypeList = estateType.findEstateTypeEntities();
                request.setAttribute("estateTypeList", estateTypeList);
                
                String modal=(request.getParameter("modal")!=null ? request.getParameter("modal"): "");
                request.setAttribute("modal", modal);

                String block = null;
                String estateNumber = null;
                String estateNumbers = null;
                projectID = request.getParameter("projectID");
                Entity.Project project = projectController.findProject(projectID);
                request.setAttribute("projectID", projectID);
                if (request.getParameter("getBlock") != null) {
                    String numBlock = "";
                    if (request.getParameter("numberBlock1") != null) {
                        numBlock = request.getParameter("numberBlock1");
                    }
                    block = request.getParameter("block");
                    estateNumber = request.getParameter("estateNumber");
                    estateNumbers = request.getParameter("estateNumber");
                    System.out.println("numBlock "+numBlock);
                    response.sendRedirect(request.getContextPath() + "/EstateAutoCreate?"
                            + "projectID=" + projectID + "&"
                            + "block=" + block + "&"
                            + "estateNumbers=" + estateNumbers + "&"
                            + "getBlock=yes&"
                            + "numBlock=" + numBlock
                            + "&estateNumber=" + estateNumber + "");
                } else {

                    List<String> blockList = new ArrayList<>();
                    int tam = 65;
                    for (int i = 0; i < project.getBlockNumber(); i++) {
                        String b = String.valueOf((char) tam++);
                        blockList.add(b);

                    }
                    estateList = new ArrayList<>();
                    EstateJpaController estateControl = new EstateJpaController(utx, emf);

                    List<String> estateIDList = estateControl.getEstateByProject(projectID);
                    for (String string : estateIDList) {
                        estateList.add(estateControl.findEstate(string));
                    }

                    request.setAttribute("estateList", estateList);
                    request.setAttribute("listBlock", blockList);
                    request.getRequestDispatcher("/admin/page/dashboard/manager/create_estate_of_project_1.jsp").forward(request, response);
                }
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
//        processRequest(request, response);
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        Controller.EstateJpaController estateController = new EstateJpaController(utx, emf);
        Controller.ProjectDetailsJpaController detailsController = new ProjectDetailsJpaController(utx, emf);
        Controller.ProjectJpaController projectController = new ProjectJpaController(utx, emf);

        Entity.Project project = projectController.findProject(projectID);
        List<Integer> listDetails = detailsController.getBlockNumerByProjectId(projectID);
        String cbmBox = "";

        if (request.getParameter("blockName") != null) {

            for (Estate listDetail : estateList) {
                if (!listDetail.getBlock().equalsIgnoreCase(request.getParameter("blockName"))) {
                    response.getWriter().write("0");
                } else {
                    response.getWriter().write("1");
                    return;
                }
            }
        } else {
            int j = 0;
            int tam = listDetails.size();
            for (int i = 1; i <= project.getBlockNumber(); i++) {

                if (i > tam) {
                    cbmBox += "<option id=select value=\"" + i + "\" >" + i + "</option>";
                } else {
                    if (listDetails.get(j) == i) {
                        cbmBox += "<option id=unSelect value=\"" + i + "\" >" + i + "</option>";
                        j++;
                    } else {
                        cbmBox += "<option id=select value=\"" + i + "\" >" + i + "</option>";
                        j++;
                    }
                }
            }
            response.getWriter().write(cbmBox);
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
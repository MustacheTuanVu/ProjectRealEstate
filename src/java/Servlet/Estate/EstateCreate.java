/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Estate;

import Controller.EstateJpaController;
import Controller.EstateStatusJpaController;
import Controller.EstateTypeJpaController;
import Controller.exceptions.RollbackFailureException;
import Entity.Estate;
import Entity.EstateStatus;
import Entity.EstateType;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "EstateCreate", urlPatterns = {"/EstateCreate"})
public class EstateCreate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // estate_type_id
    // estate_description
    // bed_room
    // bath_room
    // garages
    // price
    // areas
    // image_1st
    // image_2st
    // image_3st
    // image_4st
    // image_5st
    // direction
    // block
    // address1
    // address2
    // year_build
    // estate_status_id
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        Entity.Users user = (Entity.Users) session.getAttribute("user");

        if (user != null) {
            if (user.getRole().equals("employee")) {
                EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                EntityManager em = emf.createEntityManager();

                if (request.getParameter("submit") != null) {
                    EstateJpaController estateControl = new EstateJpaController(utx, emf);

                    String estateName = request.getParameter("estateName");
                    System.out.println(estateName);
                    String estateTypeId = request.getParameter("estateTypeId");
                    EstateType estateType = em.getReference(EstateType.class, estateTypeId);

                    String estateDescription = request.getParameter("estateDescription"); //NOTE
                    String estateContent = estateDescription;

                    int bedRoom = Integer.parseInt(request.getParameter("bedRoom"));
                    int bathRoom = Integer.parseInt(request.getParameter("bathRoom"));
                    Double garages = Double.parseDouble(request.getParameter("garages"));
                    Double price = Double.parseDouble(request.getParameter("price"));
                    Double areas = Double.parseDouble(request.getParameter("areas"));

                    String image1st = request.getParameter("image1st"); //NOTE
                    String image2st = request.getParameter("image2st"); //NOTE
                    String image3st = request.getParameter("image3st"); //NOTE
                    String image4st = request.getParameter("image4st"); //NOTE
                    String image5st = request.getParameter("image5st"); //NOTE

                    String direction = request.getParameter("direction");
                    String block = "none";
                    String address1 = request.getParameter("address1");
                    String address2 = request.getParameter("address2");

                    String yearBuild = request.getParameter("yearBuild"); //NOTE

                    int estateStatusId = Integer.valueOf(request.getParameter("estateStatusId")); //NOTE
                    EstateStatus estateStatus = em.getReference(EstateStatus.class, estateStatusId);

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

                    String message = "";
                    String hasError = "";
                    String display = "none";
                    List<Estate> estateList = (List<Estate>) estateControl.getEstateByName(estateName);
                    if (estateList.size() > 0) {
                        message = "Estate exits !";
                        hasError = "has-error";
                        display = "block";
                        request.setAttribute("message", message);
                        request.setAttribute("hasError", hasError);
                        request.setAttribute("display", display);

                        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/EstateCreate");
                        dispatcher.forward(request, response);
                    } else {
                        Estate estate = new Estate();
                        estate.setId(estateID);
                        estate.setEstateName(estateName);
                        estate.setEstateTypeId(estateType);
                        estate.setBedRoom(bedRoom);
                        estate.setBathRoom(bathRoom);
                        estate.setGarages(garages);
                        estate.setPrice(price);
                        estate.setAreas(areas);
                        estate.setEstateDescription(estateDescription);
                        estate.setEstateContent(estateContent);
                        estate.setImage1st(image1st);
                        estate.setImage2st(image2st);
                        estate.setImage3st(image3st);
                        estate.setImage4st(image4st);
                        estate.setImage5st(image5st);
                        estate.setDirection(direction);
                        estate.setBlock(block);
                        estate.setAddress1(address1);
                        estate.setAddress2(address2);
                        //estate.setEstateStatus("Waitting for director");

                        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                        Date day;
                        try {
                            day = sdf.parse(yearBuild);
                            estate.setYearBuild(day);
                        } catch (ParseException ex) {
                            Logger.getLogger(EstateCreate.class.getName()).log(Level.SEVERE, null, ex);
                        }

                        estate.setEstateStatusId(estateStatus);
                        try {
                            estateControl.create(estate);
                            response.sendRedirect(request.getContextPath() + "/EstateCreate?user=admin&modal=show");
                        } catch (RollbackFailureException ex) {
                            Logger.getLogger(EstateCreate.class.getName()).log(Level.SEVERE, null, ex);
                        } catch (Exception ex) {
                            Logger.getLogger(EstateCreate.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                } else {
                    EstateTypeJpaController estateType = new EstateTypeJpaController(utx, emf);
                    List<EstateType> estateTypeList = estateType.findEstateTypeEntities();
                    request.setAttribute("estateTypeList", estateTypeList);

                    EstateStatusJpaController estateStatus = new EstateStatusJpaController(utx, emf);
                    List<EstateStatus> estateStatusList = estateStatus.findEstateStatusEntities();
                    request.setAttribute("estateStatusList", estateStatusList);

                    String modal = "hidden";
                    modal = request.getParameter("modal");
                    request.setAttribute("modal", modal);

                    request.getRequestDispatcher("/page/dashboard/dashboard_estate_create.jsp").forward(request, response);
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

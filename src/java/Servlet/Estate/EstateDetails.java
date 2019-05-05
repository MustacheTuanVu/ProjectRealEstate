/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Estate;

import Controller.EmployeeJpaController;
import Controller.EstateJpaController;
import Controller.EstateTypeJpaController;
import Controller.FeatureDetailsJpaController;
import Controller.FeaturesJpaController;
import Controller.ViewEmployeeAssignJpaController;
import Entity.Estate;
import Controller.exceptions.RollbackFailureException;
import Entity.Estate;
import Entity.EstateStatus;
import Entity.EstateType;
import Entity.FeatureDetails;
import Entity.Features;
import Entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "EstateDetails", urlPatterns = {"/EstateDetails"})
public class EstateDetails extends HttpServlet {

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
                    request.setAttribute("displayRequest", "none");
                    session.setAttribute("image", users.getEmployee().getEmployeeImg());
                    break;
                case "manager":
                    session.setAttribute("name", users.getManager().getManagerName());
                    request.setAttribute("role", "manager");
                    request.setAttribute("displayRequest", "none");
                    session.setAttribute("image", users.getManager().getManagerImg());
                    break;
                case "director":
                    session.setAttribute("name", "Boss");
                    request.setAttribute("role", "director");
                    request.setAttribute("displayRequest", "none");
                    session.setAttribute("image", "http://localhost:8080/ProjectRealEstate/assets/media-demo/boss.png");
                    break;
                case "customer":
                    session.setAttribute("name", users.getCustomer().getCustomerName());
                    request.setAttribute("role", "customer");
                    request.setAttribute("displayRequest", "block");
                    session.setAttribute("image", users.getCustomer().getCustomerImg());
                    break;
            }
        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
        }
        // END SESSION HEADER FONTEND //
        
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
        ViewEmployeeAssignJpaController viewEmployeeAssignControl = new ViewEmployeeAssignJpaController(utx, emf);
        EstateJpaController estateControl = new EstateJpaController(utx, emf);
        FeaturesJpaController featuresJpaController = new FeaturesJpaController(utx, emf);
        FeatureDetailsJpaController featureDetailsJpaController = new FeatureDetailsJpaController(utx, emf);
        
        request.setAttribute("estateTypeList", estateTypeControl.findEstateTypeEntities());

        String id = request.getParameter("estateID");

        List<String> featureIDList = featureDetailsJpaController.findFeatureDetailsByEstate(id);
        List<Features> featureList = new ArrayList<>();

        for (String string : featureIDList) {
            featureList.add(featuresJpaController.findFeatures(string));
        }
        
        Estate find = estateControl.findEstate(id);
        
        int countEstate = estateControl.getEmployeeByEstateCount(id);
        String displayEmployee = "yes";
        if(countEstate != 0){
            int employeeID = estateControl.getEmployeeByEstate(id);
            request.setAttribute("employee", viewEmployeeAssignControl.findViewEmployeeAssign(employeeID));
        }else{
            displayEmployee = "no";
        }
        request.setAttribute("estateList", estateControl.getEstateByTypeAndByPrice(find));
        request.setAttribute("displayEmployee", displayEmployee);
        request.setAttribute("find", find);
        request.setAttribute("featureList", featureList);
        request.getRequestDispatcher("/page/guest/properties_details.jsp").forward(request, response);
        
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
            String idEstate =(request.getParameter("idEstate"));
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            
            EntityManagerFactory emf= (EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.EstateJpaController estateController= new EstateJpaController(utx, emf);
            Controller.FeaturesJpaController featuresController= new FeaturesJpaController(utx, emf);
            Controller.FeatureDetailsJpaController detailsControllre= new FeatureDetailsJpaController(utx, emf);
            Entity.Estate estate= estateController.findEstate(idEstate);
            Entity.FeatureDetails details=new FeatureDetails();
            
            String a=request.getParameter("yearBuild");
            Date day;
            day=sdf.parse(a);
            
            estate.setEstateName(request.getParameter("estateName"));
            estate.setEstateTypeId(new EstateType(request.getParameter("estateTypeId")));
            estate.setBedRoom(Integer.valueOf(request.getParameter("bedRoom")));
            estate.setBathRoom(Integer.valueOf(request.getParameter("bathRoom")));
            estate.setGarages(Double.valueOf(request.getParameter("garages")));
            estate.setPrice(Double.valueOf(request.getParameter("price")));
            estate.setAreas(Double.valueOf(request.getParameter("areas")));
            estate.setDirection(request.getParameter("direction"));
            estate.setEstateStatusId(new EstateStatus(Integer.valueOf(request.getParameter("estateStatusId"))));
            estate.setAddress1(request.getParameter("address1"));
            estate.setAddress2(request.getParameter("address2"));
            estate.setDistrict(request.getParameter("district"));
            estate.setYearBuild(day);
            estate.setEstateContent(request.getParameter("estateDescription"));
            estate.setEstateDescription(request.getParameter("estateDescription"));
            estate.setImage1st(request.getParameter("image1st"));
            estate.setImage2st(request.getParameter("image2st"));
            estate.setImage3st(request.getParameter("image3st"));
            estate.setImage4st(request.getParameter("image4st"));
            estate.setImage5st(request.getParameter("image5st"));
            
            estateController.edit(estate);
            System.out.println("edit completed");
             
//            List<Integer> featureDetailsID = detailsControllre.findEstatesByFeature(estate.getId());
//            for (Integer featureDetailsID1 : featureDetailsID) {
//                detailsControllre.destroy(featureDetailsID1);
//            }
//            
//            //String[] b=request.getParameterValues("feature");
//            List<Features> listFe=featuresController.findFeaturesEntities();
//            for (Features listFe1 : listFe) {
//                if (request.getParameter("feature"+listFe1.getFeaturesId())!= null) {
//                    details.setEstateId(estate);
//                    details.setFeatureId(new Features(request.getParameter("feature"+listFe1.getFeaturesId())));
//                   detailsControllre.create(details);
//                }
//            }
           
            
        } catch (ParseException ex) {
            Logger.getLogger(EstateDetails.class.getName()).log(Level.SEVERE, null, ex);
        } catch (RollbackFailureException ex) {
            Logger.getLogger(EstateDetails.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(EstateDetails.class.getName()).log(Level.SEVERE, null, ex);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Estate;

import Controller.AssignDetailsJpaController;
import Controller.ContractDetailsJpaController;
import Controller.ContractJpaController;
import Controller.EmployeeJpaController;
import Controller.EstateJpaController;
import Controller.EstateStatusJpaController;
import Controller.EstateTypeJpaController;
import Controller.FeatureDetailsJpaController;
import Controller.FeaturesJpaController;
import Controller.FeeJpaController;
import Controller.TransactionsJpaController;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.AssignDetails;
import Entity.Contract;
import Entity.Employee;
import Entity.Estate;
import Entity.EstateStatus;
import Entity.EstateType;
import Entity.FeatureDetails;
import Entity.Features;
import Entity.Transactions;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
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
import javax.transaction.Transaction;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
@WebServlet(name = "EstateEdit", urlPatterns = {"/EstateEdit"})
public class EstateEdit extends HttpServlet {

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
            if (user.getRole().equals("director")) {
                request.setAttribute("user", "user");
                request.setAttribute("displayLogin", "none");
                request.setAttribute("displayUser", "block");
                session.setAttribute("name", "Boss");
                request.setAttribute("role", "director");
                session.setAttribute("image", "http://localhost:8080/ProjectRealEstate/assets/media-demo/boss.png");

                EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                EntityManager em = emf.createEntityManager();

                EstateJpaController estateControl = new EstateJpaController(utx, emf);
                Estate find = estateControl.findEstate(request.getParameter("estateID"));

                if (request.getParameter("submit") != null) {

                } else {
                    EstateTypeJpaController estateType = new EstateTypeJpaController(utx, emf);
                    List<EstateType> estateTypeList = estateType.findEstateTypeEntities();
                    request.setAttribute("estateTypeList", estateTypeList);

                    EstateStatusJpaController estateStatus = new EstateStatusJpaController(utx, emf);
                    List<EstateStatus> estateStatusList = estateStatus.findEstateStatusEntities();
                    request.setAttribute("estateStatusList", estateStatusList);

                    FeaturesJpaController featuresStatusControl = new FeaturesJpaController(utx, emf);
                    FeatureDetailsJpaController featureDetailsControl = new FeatureDetailsJpaController(utx, emf);
                    List<Features> featuresList = featuresStatusControl.findFeaturesEntities();
                    List<String> featureEstateIDList = featureDetailsControl.findFeatureDetailsByEstate(request.getParameter("estateID"));
                    List<Features> featureEstateList = new ArrayList<Features>();
                    List<Features> featureEstateListNot = featuresList;
                    for (String string : featureEstateIDList) {
                        featureEstateList.add(featuresStatusControl.findFeatures(string));
                        featureEstateListNot.remove(featuresStatusControl.findFeatures(string));
                    }

                    EmployeeJpaController employeeJpaController = new EmployeeJpaController(utx, emf);
                    Employee employees = employeeJpaController.findEmployee(find.getAssignDetails().getEmployeeId().getId());
                    request.setAttribute("employeeList", employeeJpaController.findEmployeeEntities());
                    request.setAttribute("employees", employees.getId());
                    request.setAttribute("featuresList", featuresList);
                    request.setAttribute("featureEstateList", featureEstateList);
                    request.setAttribute("featureEstateListNot", featureEstateListNot);
                    request.setAttribute("find", find);

                    String modal = "hidden";
                    modal = request.getParameter("modal");
                    request.setAttribute("modal", modal);
                    request.getRequestDispatcher("/admin/page/dashboard/director/estate_edit.jsp").forward(request, response);
                }
            } else if (user.getRole().equals("employee")) {
                session.setAttribute("name", user.getEmployee().getEmployeeName());
                session.setAttribute("employeeID", user.getEmployee().getId());
                request.setAttribute("role", "employee");
                session.setAttribute("image", user.getEmployee().getEmployeeImg());

                request.setAttribute("user", "user");
                request.setAttribute("displayLogin", "none");
                request.setAttribute("displayUser", "block");

                EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
                EntityManager em = emf.createEntityManager();

                EstateJpaController estateControl = new EstateJpaController(utx, emf);
                Estate find = estateControl.findEstate(request.getParameter("estateID"));

                if (request.getParameter("submit") != null) {

                } else {
                    EstateTypeJpaController estateType = new EstateTypeJpaController(utx, emf);
                    List<EstateType> estateTypeList = estateType.findEstateTypeEntities();
                    request.setAttribute("estateTypeList", estateTypeList);

                    EstateStatusJpaController estateStatus = new EstateStatusJpaController(utx, emf);
                    List<EstateStatus> estateStatusList = estateStatus.findEstateStatusEntities();
                    request.setAttribute("estateStatusList", estateStatusList);

                    FeaturesJpaController featuresStatusControl = new FeaturesJpaController(utx, emf);
                    FeatureDetailsJpaController featureDetailsControl = new FeatureDetailsJpaController(utx, emf);
                    List<Features> featuresList = featuresStatusControl.findFeaturesEntities();
                    List<String> featureEstateIDList = featureDetailsControl.findFeatureDetailsByEstate(request.getParameter("estateID"));
                    List<Features> featureEstateList = new ArrayList<Features>();
                    List<Features> featureEstateListNot = featuresList;
                    for (String string : featureEstateIDList) {
                        featureEstateList.add(featuresStatusControl.findFeatures(string));
                        featureEstateListNot.remove(featuresStatusControl.findFeatures(string));
                    }

                    EmployeeJpaController employeeJpaController = new EmployeeJpaController(utx, emf);
                    Employee employees = employeeJpaController.findEmployee(find.getAssignDetails().getEmployeeId().getId());
                    request.setAttribute("employeeList", employeeJpaController.findEmployeeEntities());
                    request.setAttribute("employees", employees.getId());
                    request.setAttribute("featuresList", featuresList);
                    request.setAttribute("featureEstateList", featureEstateList);
                    request.setAttribute("featureEstateListNot", featureEstateListNot);
                    request.setAttribute("find", find);

                    String modal = "hidden";
                    modal = request.getParameter("modal");
                    request.setAttribute("modal", modal);
                    request.getRequestDispatcher("/admin/page/dashboard/employee/edit_estate.jsp").forward(request, response);
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

        HttpSession session = request.getSession();
        Entity.Users user = (Entity.Users) session.getAttribute("user");

        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        EntityManager em = emf.createEntityManager();
        EstateJpaController estateControl = new EstateJpaController(utx, emf);
        ContractDetailsJpaController contractDetailsJpaController = new ContractDetailsJpaController(utx, emf);
        ContractJpaController contractJpaController = new ContractJpaController(utx, emf);
        TransactionsJpaController transactionsJpaController = new TransactionsJpaController(utx, emf);
        FeeJpaController feeJpaController = new FeeJpaController(utx, emf);

        String estateName = request.getParameter("estateName");
        String estateTypeId = request.getParameter("estateTypeId");
        EstateType estateType = em.getReference(EstateType.class, estateTypeId);

        String estateDescription = request.getParameter("estateDescription"); //NOTE
        String estateContent = estateDescription;

        int bedRoom = Integer.parseInt(request.getParameter("bedRoom"));
        int bathRoom = Integer.parseInt(request.getParameter("bathRoom"));
        Double garages = Double.parseDouble(request.getParameter("garages"));
        Double price = Double.parseDouble(request.getParameter("price"));
        Double areas = Double.parseDouble(request.getParameter("areas"));
        String address = request.getParameter("address2");

        String image1st = request.getParameter("image1st"); //NOTE
        String image2st = request.getParameter("image2st"); //NOTE
        String image3st = request.getParameter("image3st"); //NOTE
        String image4st = request.getParameter("image4st"); //NOTE
        String image5st = request.getParameter("image5st"); //NOTE

        String direction = request.getParameter("direction");

        String yearBuild = request.getParameter("yearBuild"); //NOTE

        int estateStatusId = Integer.valueOf(request.getParameter("estateStatusId")); //NOTE
        EstateStatus estateStatus = em.getReference(EstateStatus.class, estateStatusId);

        Estate estate = estateControl.findEstate(request.getParameter("estateID"));
        estate.setEstateName(estateName);
        estate.setEstateTypeId(estateType);
        estate.setBedRoom(bedRoom);
        estate.setBathRoom(bathRoom);
        estate.setGarages(garages);

        if (estateStatusId == 1) {
            estate.setPrice(price * 1000000);
        } else if (estateStatusId == 2) {
            estate.setPrice(price * 1000000000);
        }

        estate.setAreas(areas);
        estate.setEstateDescription(estateDescription);
        estate.setEstateContent(estateContent);
        estate.setImage1st(image1st);
        estate.setImage2st(image2st);
        estate.setImage3st(image3st);
        estate.setImage4st(image4st);
        estate.setImage5st(image5st);
        estate.setAddress2(address);
        estate.setDirection(direction);
        estate.setDistrict(request.getParameter("district"));
        if (estate.getContractDetails() != null) {
            estate.setEstateStatus("publish");
        } else {
            estate.setEstateStatus("waitting for director edit");
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        Date day;
        try {
            day = sdf.parse(yearBuild);
            estate.setYearBuild(day);
        } catch (ParseException ex) {
            Logger.getLogger(EstateCreate.class.getName()).log(Level.SEVERE, null, ex);
        }

        SimpleDateFormat sdff = new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
        Date date = new Date();
        try {
            estate.setDateAdd(sdff.parse(date.toString()));
        } catch (ParseException ex) {
            Logger.getLogger(EstateCreate.class.getName()).log(Level.SEVERE, null, ex);
        }

        estate.setEstateStatusId(estateStatus);
        try {
            estateControl.edit(estate);
             if (!user.getRole().equals("employee") ) {
                 response.sendRedirect(request.getContextPath() + "/EstateList?user=director");
             }else{
                 response.sendRedirect(request.getContextPath() + "/EstateList?user=employee");
             }
            
        } catch (RollbackFailureException ex) {
            Logger.getLogger(EstateCreate.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(EstateCreate.class.getName()).log(Level.SEVERE, null, ex);
        }

        String[] feature = request.getParameterValues("feature");
        FeaturesJpaController featuresStatusControl = new FeaturesJpaController(utx, emf);
        FeatureDetailsJpaController featureDetailsControl = new FeatureDetailsJpaController(utx, emf);
        List<Integer> featureDetailsID = featureDetailsControl.findEstatesByFeature(request.getParameter("estateID"));

        for (Integer integer : featureDetailsID) {
            try {
                featureDetailsControl.destroy(integer);
            } catch (RollbackFailureException ex) {
                Logger.getLogger(EstateEdit.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(EstateEdit.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (request.getParameterValues("feature") != null) {
            for (String string : feature) {
                FeatureDetails featureDetails = new FeatureDetails();
                featureDetails.setEstateId(estate);
                featureDetails.setFeatureId(featuresStatusControl.findFeatures(string));
                try {
                    featureDetailsControl.create(featureDetails);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(EstateCreate.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(EstateCreate.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        if (estate.getContractDetails() != null) {
            if (transactionsJpaController.getTransactionByContractIDSale(estate.getContractDetails().getContractId().getId()) == 0) {
                Contract contract = contractJpaController.findContract(estate.getContractDetails().getContractId().getId());
                contract.setStatus("done");
                contract.setContractDetails("my request sale");
                try {
                    contractJpaController.edit(contract);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(EstateEdit.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(EstateEdit.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        if (!user.getRole().equals("employee") ) {
            if (estate.getAssignDetails() != null) {
                EmployeeJpaController employeeJpaController = new EmployeeJpaController(utx, emf);
                Employee employee = employeeJpaController.findEmployee(Integer.parseInt(request.getParameter("employeeID")));
                AssignDetailsJpaController assignDetailsJpaController = new AssignDetailsJpaController(utx, emf);
                AssignDetails assignDetails = estate.getAssignDetails();
                assignDetails.setEmployeeId(employee);
                try {
                    assignDetailsJpaController.edit(assignDetails);
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(EstateEdit.class.getName()).log(Level.SEVERE, null, ex);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(EstateEdit.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(EstateEdit.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
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

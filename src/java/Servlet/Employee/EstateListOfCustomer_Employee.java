/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Employee;

import Controller.ContractDetailsJpaController;
import Controller.ContractJpaController;
import Controller.EstateJpaController;
import Controller.EstateStatusJpaController;
import Controller.EstateTypeJpaController;
import Entity.ContractDetails;
import Entity.Estate;
import Entity.Users;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "EstateListOfCustomer_Employee", urlPatterns = {"/EstateListOfCustomer_Employee"})
public class EstateListOfCustomer_Employee extends HttpServlet {

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

    String customreID;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");

        if (request.getParameter("customerID")!= null) {
            customreID = request.getParameter("customerID");
        }
         
        int empID = users.getEmployee().getId();

        if (users != null) {
            request.setAttribute("users", "user");
            request.setAttribute("displayLogin", "none");
            request.setAttribute("displayUser", "block");
            session.setAttribute("name", users.getEmployee().getEmployeeName());
            session.setAttribute("employeeID", users.getEmployee().getId());
            request.setAttribute("role", "employee");
            session.setAttribute("image", users.getEmployee().getEmployeeImg());

            //*********************************************
            EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
            Controller.EstateJpaController estateController = new EstateJpaController(utx, emf);
            ContractDetailsJpaController contractDetailsJpaController = new ContractDetailsJpaController(utx, emf);
            EstateStatusJpaController estateStatusControl = new EstateStatusJpaController(utx, emf);
            EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);

            System.out.println("id emp "+empID);
            System.out.println("id cus "+customreID);
            List<ContractDetails> contracttDetailList
                    = contractDetailsJpaController.getContractDetailsByContractIDCustomerID(empID, Integer.parseInt(customreID));

            String estateStatusID = (request.getParameter("estateStatus") != null) ? request.getParameter("estateStatus") : "all";
            System.out.println(estateStatusID.length());
            String estateTypeID = (request.getParameter("estateType") != null) ? request.getParameter("estateType") : "all";
            String sort = (request.getParameter("sort") != null) ? request.getParameter("sort") : "date_add desc";
            int indexSort = sort.indexOf(" ");
            String sortConditions = sort.substring(0, indexSort);
            String sortTypes = sort.substring(indexSort + 1);

            String keywordF = (request.getParameter("keywordF") != null) ? request.getParameter("keywordF") : "";
            request.setAttribute("keywordF", keywordF);
            String TypeF = (request.getParameter("estateType") != null) ? request.getParameter("estateType") : "all";
            String StatusF = (request.getParameter("estateStatus") != null) ? request.getParameter("estateStatus") : "all";
            String DirectionF = (request.getParameter("DirectionF") != null) ? request.getParameter("DirectionF") : "";
            request.setAttribute("DirectionF", DirectionF);
            String DistrictF = (request.getParameter("DistrictF") != null) ? request.getParameter("DistrictF") : "all";
            request.setAttribute("DistrictF", DistrictF);
            String BuildFrom = (request.getParameter("BuildFrom") != null) ? request.getParameter("BuildFrom") : "1945";
            request.setAttribute("BuildFrom", BuildFrom);
            String BuildTo = (request.getParameter("BuildTo") != null) ? request.getParameter("BuildTo") : "2020";
            request.setAttribute("BuildTo", BuildTo);
            String BedFrom = (request.getParameter("BedFrom") != null) ? request.getParameter("BedFrom") : "0";
            request.setAttribute("BedFrom", BedFrom);
            String BedTo = (request.getParameter("BedTo") != null) ? request.getParameter("BedTo") : "10";
            request.setAttribute("BedTo", BedTo);
            String BathFrom = (request.getParameter("BathFrom") != null) ? request.getParameter("BathFrom") : "0";
            request.setAttribute("BathFrom", BathFrom);
            String BathTo = (request.getParameter("BathTo") != null) ? request.getParameter("BathTo") : "10";
            request.setAttribute("BathTo", BathTo);
            String AreaFrom = (request.getParameter("AreaFrom") != null) ? request.getParameter("AreaFrom") : "0";
            request.setAttribute("AreaFrom", AreaFrom);
            String AreaTo = (request.getParameter("AreaTo") != null) ? request.getParameter("AreaTo") : "2000";
            request.setAttribute("AreaTo", AreaTo);
            String PriceFrom = (request.getParameter("PriceFrom") != null) ? request.getParameter("PriceFrom") : "0";
            request.setAttribute("PriceFrom", PriceFrom);
            String PriceTo = (request.getParameter("PriceTo") != null) ? request.getParameter("PriceTo") : "500000";
            request.setAttribute("PriceTo", PriceTo);
            String dateRange = (request.getParameter("dateRange") != null) ? request.getParameter("dateRange") : "2019/01/01 - 2020/12/12";
            int dateIndex = dateRange.indexOf("-");
            String dateFrom = dateRange.substring(0, dateIndex - 1);
            request.setAttribute("dateFrom", dateFrom);
            String dateTo = dateRange.substring(dateIndex + 1);
            request.setAttribute("dateTo", dateTo);

            if (!estateStatusID.equals("all")) {
                request.setAttribute("estateStatus", estateStatusControl.findEstateStatus(Integer.parseInt(estateStatusID)).getEstateStatusName());
            } else {
                request.setAttribute("estateStatus", " ");
            }
            if (!estateTypeID.equals("all")) {
                request.setAttribute("estateType", estateTypeControl.findEstateType(estateTypeID).getTypeName());
            } else {
                request.setAttribute("estateType", " ");
            }
            request.setAttribute("estateStatusID", estateStatusID);
            request.setAttribute("estateTypeID", estateTypeID);
            request.setAttribute("sorts", sort);
            List<Estate> estateLists = estateController.getEstateInSiderBar(
                    StatusF,
                    TypeF,
                    sortConditions,
                    sortTypes,
                    keywordF,
                    DirectionF,
                    DistrictF,
                    BuildFrom,
                    BuildTo,
                    BedFrom,
                    BedTo,
                    BathFrom,
                    BathTo,
                    AreaFrom,
                    AreaTo,
                    dateFrom,
                    dateTo,
                    PriceFrom,
                    PriceTo
            );
            request.setAttribute("estateList", estateLists);
            request.setAttribute("size", estateLists.size());

        // END ESTATE LIST SHOW//
            // BEGIN SEARCH ESTATE SIDEBAR //
            // END SEARCH ESTATE SIDEBAR //
            request.setAttribute("estateTypeList", estateTypeControl.findEstateTypeEntities());
            String user = request.getParameter("user");

            String modal = (request.getParameter("modal") != null) ? request.getParameter("modal") : "";
            String id = (request.getParameter("estateID") != null) ? request.getParameter("estateID") : "";
            String name = (request.getParameter("estateName") != null) ? request.getParameter("estateName") : "";
            String add1 = (request.getParameter("address1") != null) ? request.getParameter("address1") : "";
            String add2 = (request.getParameter("address2") != null) ? request.getParameter("address2") : "";
            String img = (request.getParameter("img") != null) ? request.getParameter("img") : "";
            request.setAttribute("modal", modal);
            request.setAttribute("id", id);
            request.setAttribute("name", name);
            request.setAttribute("add1", add1);
            request.setAttribute("add2", add2);
            request.setAttribute("img", img);

            String modalTranFail = (request.getParameter("modalTranFail") != null) ? request.getParameter("modalTranFail") : "hide";
            String modalTranOke = (request.getParameter("modalTranOke") != null) ? request.getParameter("modalTranOke") : "hide";
            request.setAttribute("modalTranFail", modalTranFail);
            request.setAttribute("modalTranOke", modalTranOke);

            String statusFilter = (request.getParameter("filter") != null) ? request.getParameter("filter") : "";

//            List<String> estateIDList = estateController.getEstateByEmployeeFilter(
//                    String.valueOf(users.getEmployee().getId()),
//                    statusFilter
//            );
            List<Estate> listEstate = new ArrayList<Estate>();
            for (ContractDetails contracttDetai : contracttDetailList) {
                Entity.Estate estate = new Estate(contracttDetai.getEstateId().getId());
                listEstate.add(estate);
            }

            //System.out.println("estate " +estateController.getEstateByFilter(listEstate, statusFilter));
            //show all estate from cusid and empid
//            List<Estate> listEstate = new ArrayList<Estate>();
//            for (ContractDetails contracttDetai : contracttDetailList) {
//                
//                listEstate.add(estateController.getEstateByFilter(contracttDetai.getEstateId().getId(), statusFilter));
//                
//                Entity.Estate estate = new Estate();
//                estate = estateController.findEstate(contracttDetai.getEstateId().getId());
//                listEstate.add(estate);
            String keyword = (request.getParameter("searchInput") != null) ? request.getParameter("searchInput") : "";
            request.setAttribute("estateList", estateController.getEstateByFilter(listEstate, statusFilter, keyword));
            request.getRequestDispatcher("/page/dashboard/employee/dashboard_estate_custome_employee.jsp").forward(request, response);

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
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Estate;

import Controller.EstateJpaController;
import Controller.EstateStatusJpaController;
import Controller.EstateTypeJpaController;
import Entity.Estate;
import Entity.EstateStatus;
import Entity.EstateType;
import Entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author kiems
 */
@WebServlet(name = "EstateList", urlPatterns = {"/EstateList"})
public class EstateList extends HttpServlet {

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
                    session.setAttribute("employeeID", users.getEmployee().getId());
                    request.setAttribute("role", "employee");
                    session.setAttribute("image", users.getEmployee().getEmployeeImg());
                    break;
                case "manager":
                    session.setAttribute("name", users.getManager().getManagerName());
                    request.setAttribute("role", "manager");
                    session.setAttribute("image", users.getManager().getManagerImg());
                    break;
                case "director":
                    session.setAttribute("name", "Boss");
                    request.setAttribute("role", "director");
                    session.setAttribute("image", "http://localhost:8080/ProjectRealEstate/assets/media-demo/boss.png");
                    break;
                case "customer":
                    session.setAttribute("name", users.getCustomer().getCustomerName());
                    request.setAttribute("role", "customer");
                    session.setAttribute("image", users.getCustomer().getCustomerImg());
                    break;
            }
        } else {
            request.setAttribute("displayLogin", "block");
            request.setAttribute("displayUser", "none");
        }
        // END SESSION HEADER FONTEND //
        
        // BEGIN ESTATE LIST SHOW//
        
        
        
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        EstateJpaController estateControl = new EstateJpaController(utx, emf);
        EstateStatusJpaController estateStatusControl = new EstateStatusJpaController(utx, emf);
        EstateTypeJpaController estateTypeControl = new EstateTypeJpaController(utx, emf);
        
        String estateStatusID = (request.getParameter("estateStatus") != null) ? request.getParameter("estateStatus") : "all";
        System.out.println(estateStatusID.length());
        String estateTypeID = (request.getParameter("estateType") != null) ? request.getParameter("estateType") : "all";
        String sort = (request.getParameter("sort") != null) ? request.getParameter("sort") : "date_add desc";
        int indexSort = sort.indexOf(" ");
        String sortConditions = sort.substring(0, indexSort);
        String sortTypes = sort.substring(indexSort+1);
        
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
        String dateFrom = dateRange.substring(0,dateIndex-1);
        request.setAttribute("dateFrom", dateFrom);
        String dateTo = dateRange.substring(dateIndex+1);
        request.setAttribute("dateTo", dateTo);
        
        if(!estateStatusID.equals("all")){
            request.setAttribute("estateStatus", estateStatusControl.findEstateStatus(Integer.parseInt(estateStatusID)).getEstateStatusName());
        }else{
            request.setAttribute("estateStatus", " ");
        }
        if(!estateTypeID.equals("all")){
            request.setAttribute("estateType", estateTypeControl.findEstateType(estateTypeID).getTypeName());
        }else{
            request.setAttribute("estateType", " ");
        }
        request.setAttribute("estateStatusID", estateStatusID);
        request.setAttribute("estateTypeID", estateTypeID);
        request.setAttribute("sorts", sort);
        List<Estate> estateLists = estateControl.getEstateInSiderBar(
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
        if(user.equals("guest")){
            request.getRequestDispatcher("/page/guest/properties_listing_grid.jsp").forward(request, response);
        }else if(user.equals("employee")){
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
            
            List<String> estateIDList = estateControl.getEstateByEmployeeFilter(
                    String.valueOf(users.getEmployee().getId()),
                    statusFilter
            );
            List<Estate> estateList = new ArrayList<>();
            
            String search = (request.getParameter("search") != null) ? request.getParameter("search") : "";
            
            if(search.equals("search")){
                String searchInput = (request.getParameter("searchInput") != null) ? request.getParameter("searchInput") : "";
                List<String> estateIDListSearch = estateControl.getEstateByEmployeeSearch(
                    String.valueOf(users.getEmployee().getId()),
                    searchInput
                );
                for (String string : estateIDListSearch) {
                    estateList.add(estateControl.findEstate(string));
                }
            }else{
                for (String string : estateIDList) {
                    estateList.add(estateControl.findEstate(string));
                }
            }
            
            request.setAttribute("estateList", estateList);
            request.getRequestDispatcher("/page/dashboard/employee/dashboard_property.jsp").forward(request, response);
        }else if(user.equals("director")){
            String statusFilter = (request.getParameter("filter") != null) ? request.getParameter("filter") : "";
            
            List<String> estateIDList = estateControl.getEstateByEmployeeFilter(
                    "all",
                    statusFilter
            );
            List<Estate> estateList = new ArrayList<>();
            
            String search2 = (request.getParameter("search2") != null) ? request.getParameter("search2") : "";
            
            if(search2.equals("search2")){
                String searchInput = (request.getParameter("searchInput") != null) ? request.getParameter("searchInput") : "";
                List<String> estateIDListSearch = estateControl.getEstateByEmployeeSearch(
                    "all",
                    searchInput
                );
                for (String string : estateIDListSearch) {
                    estateList.add(estateControl.findEstate(string));
                }
            }else{
                for (String string : estateIDList) {
                    estateList.add(estateControl.findEstate(string));
                }
            }
            request.setAttribute("estateList", estateList);
            request.getRequestDispatcher("/page/dashboard/director/dashboard_property.jsp").forward(request, response);
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

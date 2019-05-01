<%-- 
    Document   : left_sidebar
    Created on : Mar 30, 2019, 11:45:01 AM
    Author     : kiems
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="fixed-sidebar-left">
    <ul class="nav navbar-nav side-nav nicescroll-bar">
        <li class="navigation-header">
            <span>Main</span> 
            <i class="zmdi zmdi-more"></i>
        </li>
        <li>
            <a class="<c:if test="${active == 'Manager'}">active</c:if>" href="<%=request.getContextPath()%>/DashboardManager" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Dashboard</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li>
            <a class="<c:if test="${active == 'Manager'}">active</c:if>" href="<%=request.getContextPath()%>/EditManager" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Hồ sơ</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li><hr class="light-grey-hr mb-10"/></li>
        <li class="navigation-header">
            <span>Quản lý dự án</span> 
            <i class="zmdi zmdi-more"></i>
        </li>
        <li>
            <a class="<c:if test="${active == 'CreateEstate'}">active</c:if>" href="<%=request.getContextPath()%>/ProjectCreate" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Thêm Dự Án</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li>
            <a class="<c:if test="${active == 'EstateList'}">active</c:if>" href="<%=request.getContextPath()%>/ProjectList?user=manager" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Danh Sách Dự Án</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li>
            <a class="<c:if test="${active == 'EstateList'}">active</c:if>" href="<%=request.getContextPath()%>/EstateAutoCreate1" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Thêm Căn Hộ</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        
        
    </ul>
</div>

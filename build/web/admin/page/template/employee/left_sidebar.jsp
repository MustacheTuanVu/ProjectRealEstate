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
            <a class="<c:if test="${active == 'Employee'}">active</c:if>" href="<%=request.getContextPath()%>/Employee" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Dashboard</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li>
            <a class="<c:if test="${active == 'Employee'}">active</c:if>" href="<%=request.getContextPath()%>/Employee" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Hồ sơ</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li><hr class="light-grey-hr mb-10"/></li>
        <li class="navigation-header">
            <span>Quản lý nhà-đất</span> 
            <i class="zmdi zmdi-more"></i>
        </li>
        <li>
            <a class="<c:if test="${active == 'CreateEstate'}">active</c:if>" href="<%=request.getContextPath()%>/EstateCreate" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Thêm nhà đất</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li>
            <a class="<c:if test="${active == 'EstateList'}">active</c:if>" href="<%=request.getContextPath()%>/EstateList?user=employee" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Danh sách nhà đất</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li>
            <a class="<c:if test="${active == 'EstateTypeList'}">active</c:if>" href="<%=request.getContextPath()%>/EstateTypeList" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Danh mục nhà đất</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li>
            <a class="<c:if test="${active == 'FeatureList'}">active</c:if>" href="<%=request.getContextPath()%>/FeatureList" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Nội thất-chức năng</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li class="navigation-header">
            <span>Giao dịch - Khách hàng</span> 
            <i class="zmdi zmdi-more"></i>
        </li>
        <li>
            <a class="<c:if test="${active == 'CustomerOfEmployee'}">active</c:if>" href="<%=request.getContextPath()%>/CustomerOfEmployee" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Danh sách khách hàng</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li>
            <a class="<c:if test="${active == 'ContractOfEmployee'}">active</c:if>" href="<%=request.getContextPath()%>/ContractOfEmployee" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Hợp đồng - Giao Dịch</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li class="navigation-header">
            <span>Quản lý bài viết</span> 
            <i class="zmdi zmdi-more"></i>
        </li>
        <li>
            <a class="<c:if test="${active == 'CreateEstate'}">active</c:if>" href="<%=request.getContextPath()%>/EstateCreate" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Viết bài</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li>
            <a class="<c:if test="${active == 'CreateEstate'}">active</c:if>" href="<%=request.getContextPath()%>/EstateCreate" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Bài viết</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li>
            <a class="<c:if test="${active == 'CategoryList'}">active</c:if>" href="<%=request.getContextPath()%>/CategoryList?user=employee" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Category</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li class="navigation-header">
            <span>Lịch</span> 
            <i class="zmdi zmdi-more"></i>
        </li>
        <li>
            <a class="<c:if test="${active == 'CreateEstate'}">active</c:if>" href="<%=request.getContextPath()%>/EstateCreate" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Lịch</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
    </ul>
</div>

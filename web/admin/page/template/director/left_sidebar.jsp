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
            <a class="<c:if test="${active == 'Director'}">active</c:if>" href="<%=request.getContextPath()%>/Director" data-toggle="collapse" data-target="#dashboard_dr">
                    <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                        <span class="right-nav-text">Dashboard</span>
                    </div>
                    <div class="clearfix"> 
                    </div>
                </a>
                <a class="<c:if test="${active == 'EditFee'}">active</c:if>" href="<%=request.getContextPath()%>/EditFee" data-toggle="collapse" data-target="#dashboard_dr">
                    <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                        <span class="right-nav-text">Phí hoa hồng</span>
                    </div>
                    <div class="clearfix"> 
                    </div>
                </a>
            </li>
            <li><hr class="light-grey-hr mb-10"/></li>
            <li class="navigation-header">
                <span>Bất động sản</span> 
                <i class="zmdi zmdi-more"></i>
            </li>
            <li>
                <a class="<c:if test="${active == 'EstateCreate'}">active</c:if>" href="<%=request.getContextPath()%>/EstateCreate" data-toggle="collapse" data-target="#dashboard_dr">
                    <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                        <span class="right-nav-text">Đăng bán/thuê</span>
                    </div>
                    <div class="clearfix"> 
                    </div>
                </a>
            </li>
            <li>
                <a class="<c:if test="${active == 'EstateList'}">active</c:if>" href="<%=request.getContextPath()%>/EstateList?user=director" data-toggle="collapse" data-target="#dashboard_dr">
                    <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                        <span class="right-nav-text">Bất động sản</span>
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
            <li><hr class="light-grey-hr mb-10"/></li>
            <li class="navigation-header">
                <span>Quản lý</span> 
                <i class="zmdi zmdi-more"></i>
            </li>
            <li>
                <a class="<c:if test="${active == 'ContractOfEmployee1'}">active</c:if>" href="<%=request.getContextPath()%>/ContractOfEmployee1" data-toggle="collapse" data-target="#dashboard_dr">
                    <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                        <span class="right-nav-text">Giao dịch</span>
                    </div>
                    <div class="clearfix"> 
                    </div>
                </a>
            </li>
            <li><hr class="light-grey-hr mb-10"/></li>
            <li class="navigation-header">
                <span>Nhân viên</span> 
                <i class="zmdi zmdi-more"></i>
            </li>
            <li>
                <a class="<c:if test="${active == 'CreateUser'}">active</c:if>" href="<%=request.getContextPath()%>/CreateUser" data-toggle="collapse" data-target="#dashboard_dr">
                    <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                        <span class="right-nav-text">Thêm nhân viên</span>
                    </div>
                    <div class="clearfix"> 
                    </div>
                </a>
            </li>
            <li>
                <a class="<c:if test="${active == 'StaffList'}">active</c:if>" href="<%=request.getContextPath()%>/StaffList" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Danh sách nhân viên</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
    </ul>
</div>

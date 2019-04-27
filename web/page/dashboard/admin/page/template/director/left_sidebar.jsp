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
            <a class="<c:if test="${active == 'DashboardDirector'}">active</c:if>" href="<%=request.getContextPath()%>/DashboardDirector" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left"><i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Công việc</span>
                </div>
                <div class="clearfix"> 
                </div>
            </a>
        </li>
        <li><hr class="light-grey-hr mb-10"/></li>
    </ul>
</div>

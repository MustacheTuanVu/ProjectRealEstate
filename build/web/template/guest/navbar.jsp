<%-- 
    Document   : navbar
    Created on : Feb 14, 2019, 5:02:24 PM
    Author     : kiems
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
    <div class="navbar__row js-navbar-row">
        <a href="<%=request.getContextPath()%>/index" class="navbar__brand">
            <svg class="navbar__brand-logo">
            <use xlink:href="#icon-logo"></use>
            </svg>
        </a>
        <div id="navbar-collapse-1" class="navbar__wrap">
            <ul class="navbar__nav">
                <li class="navbar__item active">
                    <a href="<%=request.getContextPath()%>/index" class="navbar__link">Home</a>
                </li>
                <li class="navbar__item js-dropdown">
                    <a href="<%=request.getContextPath()%>/EstateList?user=guest&estateStatus=all&estateType=all" class="navbar__link">Estate
                        <svg class="navbar__arrow">
                        <use xlink:href="#icon-arrow-right"></use>
                        </svg>
                    </a>
                    <div role="menu" class="js-dropdown-menu navbar__dropdown navbar__dropdown--colls-2">
                        <button class="navbar__back js-navbar-submenu-back">
                            <svg class="navbar__arrow">
                            <use xlink:href="#icon-arrow-left"></use>
                            </svg>Back
                        </button>
                        <div class="navbar__submenu">
                            <h5 class="navbar__subtitle">For rent</h5>
                            <ul class="navbar__subnav">
                                <li class="navbar__subitem"><a href="<%=request.getContextPath()%>/EstateList?user=guest&estateStatus=1&estateType=all" class="navbar__sublink js-navbar-sublink">All estate</a></li>
                                    <c:forEach items="${estateTypeList}" var="item">
                                    <li class="navbar__subitem"><a href="<%=request.getContextPath()%>/EstateList?user=guest&estateStatus=1&estateType=${item.id}" class="navbar__sublink js-navbar-sublink">${item.typeName}</a></li>
                                    </c:forEach>
                            </ul>
                        </div>
                        <div class="navbar__submenu">
                            <h5 class="navbar__subtitle">For Sale</h5>
                            <ul class="navbar__subnav">
                                <li class="navbar__subitem"><a href="<%=request.getContextPath()%>/EstateList?user=guest&estateStatus=2&estateType=all" class="navbar__sublink js-navbar-sublink">All estate</a></li>
                                    <c:forEach items="${estateTypeList}" var="item">
                                    <li class="navbar__subitem"><a href="<%=request.getContextPath()%>/EstateList?user=guest&estateStatus=2&estateType=${item.id}" class="navbar__sublink js-navbar-sublink">${item.typeName}</a></li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="navbar__item">
                    <a href="<%=request.getContextPath()%>/EmployeeList?user=guest" class="navbar__link">Agent</a>
                </li>
                <li class="navbar__item">
                    <a href="<%=request.getContextPath()%>/ProjectList?user=guest" class="navbar__link">Project</a>
                </li>
                <!-- cuong add -->
               
                <li class="navbar__item">
                    <a href="<%=request.getContextPath()%>/BlogListAllUser?cat=all" class="navbar__link">Blog</a>
                </li>
                
                <li class="navbar__item">
                    <a href="<%=request.getContextPath()%>/RequestSale" class="navbar__link">Request Sale</a>
                </li>
            </ul>
            <!-- end of block  navbar__nav-->
        </div>
    </div>
</div>
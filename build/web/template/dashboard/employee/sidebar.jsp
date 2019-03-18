<%-- 
    Document   : sidebar
    Created on : Feb 14, 2019, 5:06:55 PM
    Author     : kiems
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="widget js-widget widget--sidebar-dashboard widget--collapsing">
    <div class="widget__header"><a class="widget__btn js-widget-btn widget__btn--toggle">Dashboard</a>
    </div>
    <div class="widget__content">
        <nav class="nav nav--sidebar">
            <ul class="nav__list">
                <li class="nav__item"><a href="<%=request.getContextPath()%>/DashboardEmployee" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-dashboard"></use>
                        </svg>Dashboard</a>
                </li>
                <li class="nav__item">
                    <hr class="nav__separator">
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/EstateList?user=employee" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Estate List
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/EstateTypeList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Estate Type List
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/FeatureList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Feature List
                    </a>
                </li>
                <li class="nav__item">
                    <hr class="nav__separator">
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/RequestBuyList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Request Buy
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/RequestSaleList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Request Sale
                    </a>
                </li>
                <li class="nav__item">
                    <hr class="nav__separator">
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/BlogList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Blog Manager
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>

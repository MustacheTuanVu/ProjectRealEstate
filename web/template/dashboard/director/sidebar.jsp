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
                <li class="nav__item"><a href="<%=request.getContextPath()%>/DashboardDirector" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-dashboard"></use>
                        </svg>Dashboard</a>
                </li>
                <li class="nav__item"><a href="<%=request.getContextPath()%>/DashboardStatistics" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-dashboard"></use>
                        </svg>Thống kê</a>
                </li>
                <li class="nav__item"><a href="<%=request.getContextPath()%>/EditFee" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-dashboard"></use>
                        </svg>Phí</a>
                </li>
                <li class="nav__item">
                    <hr class="nav__separator">
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/CreateUser" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Tạo nhân viên
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/StaffList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Danh sách nhân viên
                    </a>
                </li>
                <li class="nav__item">
                    <hr class="nav__separator">
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/ContractOfEmployee1" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Danh sách yêu cầu bán
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/EstateList?user=director&filter=waitting%20for%20director" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Danh sách bất động sản chờ duyệt
                    </a>
                </li>
                <li class="nav__item">
                    <hr class="nav__separator">
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/ProjectList?user=director" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Danh sách dự án chờ duyệt
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>

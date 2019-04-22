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
				<li class="nav__item"><a href="<%=request.getContextPath()%>/EditEmployee" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-dashboard"></use>
                        </svg>Trang cá nhân</a>
                </li>
                <li class="nav__item">
                    <hr class="nav__separator">
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/EstateList?user=employee" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Danh sách bất động sản
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/EstateTypeList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Danh sách loại bất động sản
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/FeatureList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Danh sách tiện ích
                    </a>
                </li>
                <li class="nav__item">
<hr class="nav__separator">
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/ContractOfEmployee" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Hợp đồng
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/CustomerOfEmployee" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Khách hàng
                    </a>
                </li>
                <li class="nav__item">
                    <hr class="nav__separator">
                </li>
                 <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/BlogList?user=employee" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Quản lý bài viết
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/CategoryList?user=employee" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Danh mục bài viết
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>

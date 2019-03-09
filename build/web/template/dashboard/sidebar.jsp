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

                <li class="nav__item">
                    <a class="nav__link text-center" style="color: red !important;">----- VŨ -----</a>
                </li>
                <li class="nav__item"><a href="dashboard.html" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-dashboard"></use>
                        </svg>Dashboard</a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/EstateTypeList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Estate Type
                    </a>
                </li>
                <li class="nav__item">
                    <a href="dashboard_property_new.html" class="nav__link active">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Add Listing
                    </a>
                </li>
                <li class="nav__item">
                    <hr class="nav__separator">
                </li>
                <li class="nav__item">
                    <a class="nav__link text-center" style="color: red !important;">----- CƯỜNG -----</a>
                </li>

                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/ProjectList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-user-admin"></use>
                        </svg>List Project
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/CreateProject" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-user-admin"></use>
                        </svg>Create Project
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/EstateListWaiting" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-user-admin"></use>
                        </svg>List Estate Waiting
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/TransactionList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-user-admin"></use>
                        </svg>Estate Waiting Pay
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/TransactionList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-user-admin"></use>
                        </svg>Transaction
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/TransactionCreate" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-user-admin"></use>
                        </svg>Create Transaction
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/ContractList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-user-admin"></use>
                        </svg>Contract
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/ContractCreate" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-user-admin"></use>
                        </svg>Create Contract
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/UserList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-user-admin"></use>
                        </svg>Customer
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/ContractTypeList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Contract Type
                    </a>
                </li>
                <li class="nav__item">
                    <a href="<%=request.getContextPath()%>/PaymentList" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-add-listing"></use>
                        </svg>Payment
                    </a>
                </li>
                <li class="nav__item">
                    <hr class="nav__separator">
                </li>
                <li class="nav__item"><a href="dashboard_news.html" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-news"></use>
                        </svg>News Feed</a></li>
                <li class="nav__item"><a href="dashboard_profile.html" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-user-admin"></use>
                        </svg>Profile</a></li>
                <li class="nav__item"><a href="dashboard_activity.html" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-clock"></use>
                        </svg>Activity Log</a></li>
                <li class="nav__item">
                    <hr class="nav__separator">
                </li>
                <li class="nav__item"><a href="dashboard_favorites_listings.html" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-favorite-listings"></use>
                        </svg>Favorite Listings</a></li>
                <li class="nav__item"><a href="dashboard_favorites_agents.html" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-favorite-agents"></use>
                        </svg>Favorite Agents</a></li>
                <li class="nav__item"><a href="dashboard_favorites_search.html" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-favorite-search"></use>
                        </svg>Favorite search</a></li>
                <li class="nav__item">
                    <hr class="nav__separator">
                </li>
                <li class="nav__item"><a href="dashboard_financials.html" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-financials"></use>
                        </svg>Financials</a></li>
                <li class="nav__item"><a href="dashboard_statistics.html" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-statistics"></use>
                        </svg>Statistics</a></li>
                <li class="nav__item">
                    <hr class="nav__separator">
                </li>
                <li class="nav__item"><a href="dashboard_property.html" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-property-edit"></use>
                        </svg>Property management</a></li>
                <li class="nav__item"><a href="dashboard_blog.html" class="nav__link">
                        <svg class="nav__icon">
                        <use xlink:href="#icon-blog-edit"></use>
                        </svg>Blog Management</a></li>
            </ul>
        </nav>
    </div>
</div>

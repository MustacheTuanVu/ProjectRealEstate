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
                <li class="navbar__item" style="display: ${displayUser}">
                    <a href="<%=request.getContextPath()%>/RequestSale" class="navbar__link">Request Sale</a>
                </li>
                
                <!--
                <li class="navbar__item js-dropdown">
                    <a class="navbar__link">User
                        <svg class="navbar__arrow">
                        <use xlink:href="#icon-arrow-right"></use>
                        </svg></a>
                    <div role="menu" class="js-dropdown-menu navbar__dropdown navbar__dropdown--colls-2">
                        <button class="navbar__back js-navbar-submenu-back">
                            <svg class="navbar__arrow">
                            <use xlink:href="#icon-arrow-left"></use>
                            </svg>Back
                        </button>
                        <div class="navbar__submenu">
                            <h5 class="navbar__subtitle">Pages</h5>
                            <ul class="navbar__subnav">
                                <li class="navbar__subitem"><a href="my_listings.html" class="navbar__sublink js-navbar-sublink">My listings</a></li>
                                <li class="navbar__subitem"><a href="my_listings_add_edit.html" class="navbar__sublink js-navbar-sublink">Property submit</a></li>
                                <li class="navbar__subitem"><a href="my_profile.html" class="navbar__sublink js-navbar-sublink">Profile</a></li>
                            </ul>
                        </div>
                        <div class="navbar__submenu">
                            <h5 class="navbar__subtitle">Auth</h5>
                            <ul class="navbar__subnav">
                                <li class="navbar__subitem"><a href="user_login.html" class="navbar__sublink js-navbar-sublink">Login</a></li>
                                <li class="navbar__subitem"><a href="user_register.html" class="navbar__sublink js-navbar-sublink">Register</a></li>
                                <li class="navbar__subitem"><a href="user_restore_pass.html" class="navbar__sublink js-navbar-sublink">Restore</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="navbar__item js-dropdown">
                    <a class="navbar__link">Blog
                        <svg class="navbar__arrow">
                        <use xlink:href="#icon-arrow-right"></use>
                        </svg></a>
                    <div role="menu" class="js-dropdown-menu navbar__dropdown navbar__dropdown--colls-1">
                        <button class="navbar__back js-navbar-submenu-back">
                            <svg class="navbar__arrow">
                            <use xlink:href="#icon-arrow-left"></use>
                            </svg>Back
                        </button>
                        <div class="navbar__submenu">
                            <ul class="navbar__subnav">
                                <li class="navbar__subitem"><a href="blog.html" class="navbar__sublink js-navbar-sublink">Blog list</a></li>
                                <li class="navbar__subitem"><a href="blog_details.html" class="navbar__sublink js-navbar-sublink">Blog details</a></li>
                                <li class="navbar__subitem"><a href="blog_empty.html" class="navbar__sublink js-navbar-sublink">Blog empty</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="navbar__item js-dropdown">
                    <a class="navbar__link">Pages
                        <svg class="navbar__arrow">
                        <use xlink:href="#icon-arrow-right"></use>
                        </svg></a>
                    <div role="menu" class="js-dropdown-menu navbar__dropdown navbar__dropdown--colls-1">
                        <button class="navbar__back js-navbar-submenu-back">
                            <svg class="navbar__arrow">
                            <use xlink:href="#icon-arrow-left"></use>
                            </svg>Back
                        </button>
                        <div class="navbar__submenu">
                            <ul class="navbar__subnav">
                                <li class="navbar__subitem"><a href="page.html" class="navbar__sublink js-navbar-sublink">Сontent page</a></li>
                                <li class="navbar__subitem"><a href="faq.html" class="navbar__sublink js-navbar-sublink">Faq</a></li>
                                <li class="navbar__subitem"><a href="reviews.html" class="navbar__sublink js-navbar-sublink">Testimonials</a></li>
                                <li class="navbar__subitem"><a href="pricing.html" class="navbar__sublink js-navbar-sublink">Pricing</a></li>
                                <li class="navbar__subitem"><a href="gallery.html" class="navbar__sublink js-navbar-sublink">Gallery</a></li>
                                <li class="navbar__subitem"><a href="email.html" class="navbar__sublink js-navbar-sublink">Email template</a></li>
                                <li class="navbar__subitem navbar__subitem-dropdown js-dropdown"><a class="navbar__sublink js-navbar-sublink">Errors
                                        <svg class="navbar__arrow">
                                        <use xlink:href="#icon-arrow-right"></use>
                                        </svg></a>
                                    <div class="navbar__submenu navbar__submenu--level">
                                        <button class="navbar__back js-navbar-submenu-back">
                                            <svg class="navbar__arrow">
                                            <use xlink:href="#icon-arrow-left"></use>
                                            </svg>Back
                                        </button>
                                        <ul class="navbar__subnav">
                                            <li class="navbar__subitem"><a href="error_403.html" class="navbar__sublink js-navbar-sub-sublink">403 Error</a></li>
                                            <li class="navbar__subitem"><a href="error_404.html" class="navbar__sublink js-navbar-sub-sublink">404 Error</a></li>
                                            <li class="navbar__subitem"><a href="error_500.html" class="navbar__sublink js-navbar-sub-sublink">500 Error</a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="navbar__item">
                    <a href="contacts.html" class="navbar__link">Contacts</a>
                </li>
                <li class="navbar__item js-dropdown">
                    <a class="navbar__link">Dashboard
                        <svg class="navbar__arrow">
                        <use xlink:href="#icon-arrow-right"></use>
                        </svg></a>
                    <div role="menu" class="js-dropdown-menu navbar__dropdown navbar__dropdown--colls-1">
                        <button class="navbar__back js-navbar-submenu-back">
                            <svg class="navbar__arrow">
                            <use xlink:href="#icon-arrow-left"></use>
                            </svg>Back
                        </button>
                        <div class="navbar__submenu">
                            <ul class="navbar__subnav">
                                <li class="navbar__subitem"><a href="dashboard.html" class="navbar__sublink">Dashboard</a></li>
                                <li class="navbar__subitem"><a href="dashboard_property_new.html" class="navbar__sublink">Add Listing</a></li>
                                <li class="navbar__subitem"><a href="dashboard_news.html" class="navbar__sublink">News Feed</a></li>
                                <li class="navbar__subitem"><a href="dashboard_profile.html" class="navbar__sublink">Profile</a></li>
                                <li class="navbar__subitem"><a href="dashboard_activity.html" class="navbar__sublink">Activity Log</a></li>
                                <li class="navbar__subitem"><a href="dashboard_favorites_listings.html" class="navbar__sublink">Favorite Listings</a></li>
                                <li class="navbar__subitem"><a href="dashboard_favorites_agents.html" class="navbar__sublink">Favorite Agents</a></li>
                                <li class="navbar__subitem"><a href="dashboard_favorites_search.html" class="navbar__sublink">Favorite search</a></li>
                                <li class="navbar__subitem"><a href="dashboard_financials.html" class="navbar__sublink">Financials</a></li>
                                <li class="navbar__subitem"><a href="dashboard_statistics.html" class="navbar__sublink">Statistics</a></li>
                                <li class="navbar__subitem"><a href="dashboard_property.html" class="navbar__sublink">Property management</a></li>
                                <li class="navbar__subitem"><a href="dashboard_blog.html" class="navbar__sublink">Blog Management</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="navbar__item js-dropdown">
                    <a class="navbar__link">UI
                        <svg class="navbar__arrow">
                        <use xlink:href="#icon-arrow-right"></use>
                        </svg></a>
                    <div role="menu" class="js-dropdown-menu navbar__dropdown navbar__dropdown--right navbar__dropdown--colls-2">
                        <button class="navbar__back js-navbar-submenu-back">
                            <svg class="navbar__arrow">
                            <use xlink:href="#icon-arrow-left"></use>
                            </svg>Back
                        </button>
                        <div class="navbar__submenu">
                            <h5 class="navbar__subtitle">Variations</h5>
                            <ul class="navbar__subnav">
                                <li class="navbar__subitem"><a href="index_not_available.html" class="navbar__sublink js-navbar-sublink">Feature not available</a></li>
                                <li class="navbar__subitem"><a href="feature_boxed.html" class="navbar__sublink js-navbar-sublink">Layout boxed</a></li>
                                <li class="navbar__subitem"><a href="feature_left_sidebar.html" class="navbar__sublink js-navbar-sublink">Sidebar left</a></li>
                            </ul>
                        </div>
                        <div class="navbar__submenu">
                            <h5 class="navbar__subtitle">Elements</h5>
                            <ul class="navbar__subnav">
                                <li class="navbar__subitem"><a href="feature_ui.html" class="navbar__sublink js-navbar-sublink">UI</a></li>
                                <li class="navbar__subitem"><a href="feature_typography.html" class="navbar__sublink js-navbar-sublink">Typography</a></li>
                                <li class="navbar__subitem"><a href="feature_loaders.html" class="navbar__sublink js-navbar-sublink">Feature loaders</a></li>
                                <li class="navbar__subitem"><a href="bootstrap.html" class="navbar__sublink js-navbar-sublink">Twitter Bootstrap</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="navbar__item navbar__item--mob js-dropdown">
                    <a class="navbar__link">Language
                        <svg class="navbar__arrow">
                        <use xlink:href="#icon-arrow-right"></use>
                        </svg>
                    </a>
                    <div role="menu" class="js-dropdown-menu navbar__dropdown navbar__dropdown--right">
                        <button class="navbar__back js-navbar-submenu-back">
                            <svg class="navbar__arrow">
                            <use xlink:href="#icon-arrow-left"></use>
                            </svg>Back
                        </button>
                        <div class="navbar__submenu">
                            <ul class="navbar__subnav">
                                <li class="navbar__subitem active"><a href="" class="navbar__sublink js-navbar-sublink">English</a></li>
                                <li class="navbar__subitem"><a href="" class="navbar__sublink js-navbar-sublink">Francais</a></li>
                                <li class="navbar__subitem"><a href="" class="navbar__sublink js-navbar-sublink">Italian</a></li>
                                <li class="navbar__subitem"><a href="" class="navbar__sublink js-navbar-sublink">Russian</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="navbar__item navbar__item--mob js-dropdown">
                    <a class="navbar__link">Currency
                        <svg class="navbar__arrow">
                        <use xlink:href="#icon-arrow-right"></use>
                        </svg></a>
                    <div role="menu" class="js-dropdown-menu navbar__dropdown navbar__dropdown--right">
                        <button class="navbar__back js-navbar-submenu-back">
                            <svg class="navbar__arrow">
                            <use xlink:href="#icon-arrow-left"></use>
                            </svg>Back
                        </button>
                        <div class="navbar__submenu">
                            <ul class="navbar__subnav">
                                <li class="navbar__subitem active"><a href="" class="navbar__sublink js-navbar-sublink">USD</a></li>
                                <li class="navbar__subitem"><a href="" class="navbar__sublink js-navbar-sublink">EURO</a></li>
                                <li class="navbar__subitem"><a href="" class="navbar__sublink js-navbar-sublink">RUB</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="navbar__item navbar__item--mob js-dropdown">
                    <a class="navbar__link">Measures
                        <svg class="navbar__arrow">
                        <use xlink:href="#icon-arrow-right"></use>
                        </svg></a>
                    <div role="menu" class="js-dropdown-menu navbar__dropdown navbar__dropdown--right">
                        <button class="navbar__back js-navbar-submenu-back">
                            <svg class="navbar__arrow">
                            <use xlink:href="#icon-arrow-left"></use>
                            </svg>Back
                        </button>
                        <div class="navbar__submenu">
                            <div class="switch switch--menu">
                                <label>M <sup>2</sup>
                                    <input type="checkbox" checked><span class="lever"></span>Sq Ft
                                </label>
                            </div>
                        </div>
                    </div>
                </li>
                -->
            </ul>
            <!-- end of block  navbar__nav-->
        </div>
    </div>
</div>
<%-- 
    Document   : header
    Created on : Feb 14, 2019, 4:42:26 PM
    Author     : kiems
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
    <div class="header__row"><a href="index.html" class="header__logo">
            <svg>
            <use xlink:href="#icon-logo--mob"></use>
            </svg></a>
        <div class="header__settings">
            <div class="header__settings-column">
                <div class="dropdown dropdown--header">
                    <button data-toggle="dropdown" type="button" class="dropdown-toggle dropdown__btn">
                        <svg class="header__settings-icon">
                        <use xlink:href="#icon-money"></use>
                        </svg>USD
                    </button>
                    <div class="dropdown__menu">
                        <ul>
                            <li class="dropdown__item"><a href="#" class="dropdown__link">EUR</a></li>
                            <li class="dropdown__item"><a href="#" class="dropdown__link">RUB</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- end of block .header__settings-column-->
            <div class="header__settings-column">
                <div class="switch switch--header">
                    <label>M <sup>2</sup>
                        <input type="checkbox" checked><span class="lever"></span>Sq Ft
                    </label>
                </div>
            </div>
            <!-- end of block .header__settings-column-->
            <div class="header__settings-column">
                <div class="dropdown dropdown--header">
                    <button data-toggle="dropdown" type="button" class="dropdown-toggle dropdown__btn">
                        <svg class="header__settings-icon">
                        <use xlink:href="#icon-earth"></use>
                        </svg>Eng
                    </button>
                    <div class="dropdown__menu">
                        <ul>
                            <li class="dropdown__item"><a href="#" class="dropdown__link">Francais</a></li>
                            <li class="dropdown__item"><a href="#" class="dropdown__link">Italian</a></li>
                            <li class="dropdown__item"><a href="#" class="dropdown__link">Russian</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="header__contacts"><a href="tel:+12025550135" class="header__phone">
                <svg class="header__phone-icon">
                <use xlink:href="#icon-phone"></use>
                </svg><span class="header__span">+1 202 555 0135</span></a></div>
        <!-- end of block .header__contacts-->
        <div class="header__social">
            <div class="social social--header social--circles"><a href="#" class="social__item"><i class="fa fa-facebook"></i></a><a href="#" class="social__item"><i class="fa fa-twitter"></i></a><a href="#" class="social__item"><i class="fa fa-google-plus"></i></a></div>
        </div>
        <div class="auth auth--header">
            <ul class="auth__nav">
                <li class="dropdown auth__nav-item">
                    <button data-toggle="dropdown" type="button" class="dropdown-toggle js-auth-nav-btn auth__nav-btn"><img src="assets/media-demo/avatars/01.jpg" alt="" class="auth__avatar"><span class="auth__name"> Hi Jenifer</span></button>
                    <div class="dropdown__menu auth__dropdown--logged-in js-user-logged-in">
                        <nav class="nav nav--auth">
                            <ul class="nav__list">
                                <li class="nav__item"><a href="dashboard.html" class="nav__link">Dashboard</a></li>
                                <li class="nav__item"><a href="dashboard_property_new.html" class="nav__link active">Add Listing</a></li>
                                <li class="nav__item"><a href="dashboard_news.html" class="nav__link">News Feed</a></li>
                                <li class="nav__item"><a href="dashboard_profile.html" class="nav__link">Profile</a></li>
                                <li class="nav__item"><a href="dashboard_activity.html" class="nav__link">Activity Log</a></li>
                                <li class="nav__item"><a href="dashboard_favorites_listings.html" class="nav__link">Favorite Listings</a></li>
                                <li class="nav__item"><a href="dashboard_favorites_agents.html" class="nav__link">Favorite Agents</a></li>
                                <li class="nav__item"><a href="dashboard_favorites_search.html" class="nav__link">Favorite search</a></li>
                                <li class="nav__item"><a href="dashboard_financials.html" class="nav__link">Financials</a></li>
                                <li class="nav__item"><a href="dashboard_statistics.html" class="nav__link">Statistics</a></li>
                                <li class="nav__item"><a href="dashboard_property.html" class="nav__link">Property management</a></li>
                                <li class="nav__item"><a href="dashboard_blog.html" class="nav__link">Blog Management</a></li>
                                <li class="nav__item"><a href="#" class="nav__link">Log out</a></li>
                            </ul>
                        </nav>
                    </div>
                </li>
            </ul>
            <!-- end of block .auth header-->
        </div>
        <button type="button" class="header__navbar-toggle js-navbar-toggle">
            <svg class="header__navbar-show">
            <use xlink:href="#icon-menu"></use>
            </svg>
            <svg class="header__navbar-hide">
            <use xlink:href="#icon-menu-close"></use>
            </svg>
        </button>
        <!-- end of block .header__navbar-toggle-->
    </div>
</div>
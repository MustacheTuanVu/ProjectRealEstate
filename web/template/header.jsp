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
        <!--
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
            </div>-->
            <!-- end of block .header__settings-column-->
            <!--
            <div class="header__settings-column">
                <div class="switch switch--header">
                    <label>M <sup>2</sup>
                        <input type="checkbox" checked><span class="lever"></span>Sq Ft
                    </label>
                </div>
            </div>-->
            <!-- end of block .header__settings-column-->
            <!--
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
        <!--
        <div class="header__social">
            <div class="social social--header social--circles"><a href="#" class="social__item"><i class="fa fa-facebook"></i></a><a href="#" class="social__item"><i class="fa fa-twitter"></i></a><a href="#" class="social__item"><i class="fa fa-google-plus"></i></a></div>
        </div>
        -->
        <div class="auth auth--header">
            <ul class="auth__nav">
                <li class="dropdown auth__nav-item">
                    <button data-toggle="dropdown" type="button" class="dropdown-toggle js-auth-nav-btn auth__nav-btn"><img src="assets/media-demo/avatars/01.jpg" alt="" class="auth__avatar"><span class="auth__name"> Chào</span></button>
                    <div class="dropdown__menu auth__dropdown--logged-in js-user-logged-in">
                        <nav class="nav nav--auth">
                            <ul class="nav__list">
                                <li class="nav__item"><a href="#" class="nav__link">Đăng xuất</a></li>

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
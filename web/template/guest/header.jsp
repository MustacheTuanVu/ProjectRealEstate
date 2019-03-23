<%-- 
    Document   : header
    Created on : Feb 14, 2019, 4:42:26 PM
    Author     : kiems
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
    <div class="container">
        <div class="header__row">
            <a href="<%=request.getContextPath()%>/index" class="header__logo">
                <svg>
                <use xlink:href="#icon-logo--mob"></use>
                </svg>
            </a>

            <div class="auth auth--header">
                <ul class="auth__nav">
                    <li class="dropdown auth__nav-item" style="display: ${displayLogin};">
                        <div class="dropdown__menu auth__dropdown--restore">
                            <!-- BEGIN AUTH RESTORE-->
                            <h5 class="auth__title">Reset password</h5>
                            <form action="#" class="form form--flex form--auth form--restore js-restore-form js-parsley">
                                <div class="row">
                                    <div class="form-group">
                                        <label for="restore-email-dropdown" class="control-label">Enter your User Name or Email</label>
                                        <input type="email" name="email" id="restore-email-dropdown" required class="form-control">
                                    </div>
                                </div>
                                <div class="row">
                                    <button type="submit" class="form__submit">Reset password</button>
                                </div>
                                <div class="row">
                                    <div class="form__options">Back to
                                        <button type="button" class="js-user-login">Log In</button>or
                                        <button type="button" class="js-user-register">Registration</button>
                                    </div>
                                    <!-- end of block .auth__links-->
                                </div>
                            </form>
                            <!-- end of block .auth__form-->
                            <!-- END AUTH RESTORE-->
                        </div>
                    </li>
                    <li class="dropdown auth__nav-item" style="display: ${displayLogin};">
                        <button data-toggle="dropdown" type="button" class="dropdown-toggle js-auth-nav-btn auth__nav-btn">
                            <svg class="auth__icon-user">
                            <use xlink:href="#icon-user"></use>
                            </svg><span class="header__span"> Log in /</span>
                        </button>
                        <div class="dropdown__menu auth__dropdown--login">
                            <!-- BEGIN AUTH LOGIN-->
                            <h5 class="auth__title">Login in your account</h5>
                            <form action="<%=request.getContextPath()%>/LoginUser" method="POST" class="form form--flex form--auth js-login-form js-parsley">
                                <div class="row">
                                    <div class="form-group">
                                        <label for="login-username-dropdown" class="control-label">Username</label>
                                        <input type="text" name="username" id="login-username-dropdown" required data-parsley-trigger="keyup" data-parsley-minlength="6" data-parsley-validation-threshold="5" data-parsley-minlength-message="Login should be at least 6 chars" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="login-password-dropdown" class="control-label">Password</label>
                                        <input type="password" name="password" id="login-password-dropdown" required class="form-control">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form__options form__options--forgot">
                                        <button type="button" class="js-user-restore">Forgot password ?</button>
                                    </div>
                                    <button type="submit" class="form__submit">Sign in</button>
                                </div>
                                <div class="form__remember">
                                    <input type="checkbox" id="remember-in-dropdown" class="in-checkbox">
                                    <label for="remember-in-dropdown" class="in-label">Remember me</label>
                                </div>
                                <div class="row">
                                    <div class="form__options">Not a user yet?
                                        <button type="button" class="js-user-register">Get an account</button>
                                    </div>
                                </div>
                            </form>
                            <!-- end of block .auth__form-->
                            <!-- END AUTH LOGIN-->
                        </div>
                    </li>
                    <li class="dropdown auth__nav-item" style="display: ${displayLogin};">
                        <button data-toggle="dropdown" type="button" class="dropdown-toggle auth__nav-btn"><span class="header__span">  Sign up</span></button>
                        <div class="dropdown__menu auth__dropdown--register">
                            <!-- BEGIN AUTH REGISTER-->
                            <h5 class="auth__title">Sign up a new account</h5>
                            <form action="<%=request.getContextPath()%>/RegisterUser" method="POST" class="form form--flex form--auth js-register-form js-parsley">
                                <div class="row">
                                    <div class="form-group form-group--col-6">
                                        <label for="register-name-dropdown" class="control-label">Username</label>
                                        <input type="text" name="username" id="register-name-dropdown" required class="form-control">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group form-group--col-6">
                                        <label for="register-lastname-dropdown" class="control-label">Password</label>
                                        <input type="password" name="pass" id="register-lastname-dropdown" required class="form-control">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group form-group--col-6">
                                        <label for="register-password-dropdown" class="control-label">RePassword</label>
                                        <input type="password" name="rePass" id="register-password-dropdown" required class="form-control">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group form-group--col-6">
                                        <button type="submit" class="form__submit">Sign up</button>
                                    </div>
                                </div>
                            </form>
                            <!-- end of block .auth__form-->
                            <!-- END AUTH REGISTER-->
                        </div>
                    </li>
                    <li class="dropdown auth__nav-item" style="display: ${displayUser};">
                        <button data-toggle="dropdown" type="button" class="dropdown-toggle js-auth-nav-btn auth__nav-btn">
                            <img src="${image}" alt="" class="auth__avatar">
                            <span class="auth__name"> Hi ${name}</span>
                        </button>
                        <div class="dropdown__menu auth__dropdown--logged-in js-user-logged-in">
                            <nav class="nav nav--auth">
                                <ul class="nav__list">
                                    <li class="nav__item">
                                        <c:if test="${role=='customer'}">
                                            <a href="<%=request.getContextPath()%>/DashboardUser" class="nav__link">Dashboard</a>
                                        </c:if>
                                        <c:if test="${role=='director'}">
                                            <a href="<%=request.getContextPath()%>/DashboardDirector" class="nav__link">Dashboard</a>
                                        </c:if>
                                        <c:if test="${role=='employee'}">
                                            <a href="<%=request.getContextPath()%>/DashboardEmployee" class="nav__link">Dashboard</a>
                                        </c:if>
                                        <c:if test="${role=='manager'}">
                                            <a href="<%=request.getContextPath()%>/DashboardManager" class="nav__link">Dashboard</a>
                                        </c:if>
                                    </li>
                                </ul>
                            </nav>
                            <nav class="nav nav--auth">
                                <ul class="nav__list">
                                    <li class="nav__item"><a href="<%=request.getContextPath()%>/Logout" class="nav__link">Log out</a></li>
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
</div>
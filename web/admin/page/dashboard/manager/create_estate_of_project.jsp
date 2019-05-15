<%-- 
    Document   : project_list
    Created on : Apr 23, 2019, 11:16:28 AM
    Author     : Cuong
--%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <title>SGEstate24h</title>
        <meta name="description" content="Doodle is a Dashboard & Admin Site Responsive Template by hencework." />
        <meta name="keywords" content="admin, admin dashboard, admin template, cms, crm, Doodle Admin, Doodleadmin, premium admin templates, responsive admin, sass, panel, software, ui, visualization, web app, application" />
        <meta name="author" content="hencework"/>

        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/vendor.css">
        <!-- endbuild-->
        <!-- Font-awesome lib-->
        <!-- build:cssfontawesome-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/font-awesome.css">
        <!-- endbuild-->
        <!-- Theme styles, please replace "default" with other color scheme from the list available in template/css-->
        <!-- build:csstheme-default-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/theme-default.css">
        <!-- endbuild-->
        <!-- Your styles should go in this file-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/custom.css">
        <!-- Fixes for IE-->
        <!--[if lt IE 11]>
        <link rel="stylesheet" href="assets/css/ie-fix.css"><![endif]-->
        <link rel="icon" href="<%=request.getContextPath()%>/assets/img/favicon.ico" type="image/x-icon">
        <!-- Favicon -->
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <!-- Morris Charts CSS -->
        <link href="<%=request.getContextPath()%>/admin/vendors/bower_components/morris.js/morris.css" rel="stylesheet" type="text/css"/>

        <!-- Data table CSS -->
        <link href="<%=request.getContextPath()%>/admin/vendors/bower_components/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>

        <link href="<%=request.getContextPath()%>/admin/vendors/bower_components/jquery-toast-plugin/dist/jquery.toast.min.css" rel="stylesheet" type="text/css">

        <!-- Custom CSS -->
        <link href="<%=request.getContextPath()%>/admin/dist/css/style.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="<%=request.getContextPath()%>/ckfinder/ckfinder.js"></script>




    </head>
    <body>
        <!-- Preloader -->
        <div class="preloader-it">
            <div class="la-anim-1"></div>
        </div>
        <!-- /Preloader -->
        <div class="wrapper theme-1-active box-layout pimary-color-red">
            <!-- Top Menu Items -->
            <%@ include file="/admin/page/template/director/top_menu.jsp" %>
            <!-- /Top Menu Items -->

            <!-- Left Sidebar Menu -->
            <%@ include file="/admin/page/template/manager/left_sidebar.jsp" %>
            <!-- /Left Sidebar Menu -->

            <!-- Right Sidebar Menu -->
            <%@ include file="/admin/page/template/director/right_sidebar.jsp" %>
            <!-- /Right Sidebar Menu -->



            <!-- Main Content -->
            <div class="page-wrapper">
                <p id="wellcomepage" style="display: none">Đây là trang "Danh sách bất động sản"</p>
                <div class="container-fluid pt-25">
                    <!-- Title -->
                    <div class="row heading-bg">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h3 class="txt-dark">DỰ ÁN</h3>
                        </div>
                        <!-- Breadcrumb -->
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <ol class="breadcrumb">
                                <li><a href="<%=request.getContextPath()%>/Employee">Quản Lý</a></li>
                                <li><a href="<%=request.getContextPath()%>/EstateList?user=employee">Dự Án</a></li>
                            </ol>
                        </div>
                        <!-- /Breadcrumb -->
                    </div>
                    <!-- /Title -->
                    <!-- Row -->
                    <div class="row">
                        <div class="panel panel-default card-view">
                            <div class="panel-heading">
                                <div class="pull-left">
                                    <h3 class="txt-dark">
                                        Chi Tiết Dự Án 
                                    </h3>
                                    <div class="input-group">
                                        <!-- BEGIN LISTING-->
                                        <div class="site site--dashboard">
                                            <div class="site__main">
                                                <div class="widget js-widget widget--dashboard">
                                                    <div class="widget__header">
                                                        <h2 class="widget__title">Căn Hộ Mỗi Tầng</h2>
                                                    </div>
                                                    <div class="widget__content">
                                                        <section class="form-property form-property--dashboard">
                                                            <!-- Nav tabs-->
                                                            <ul role="tablist" class="nav form-property__tabs">
                                                                <c:forEach begin="1" end="${floorNumber}" var="item">
                                                                    <li role="presentation" <c:if test="${item == '1'}">class="active"</c:if> >
                                                                        <a href="#Floor${item}" aria-controls="Floor${item}" role="tab" data-toggle="tab">
                                                                            Tầng ${item}
                                                                        </a>
                                                                    </li>
                                                                </c:forEach>
                                                            </ul>
                                                            <form action="<%=request.getContextPath()%>/EstateAutoCreate" onsubmit="return checkForm()" class="form form--flex form--property form--basic js-form-property-1">
                                                                <div class="tab-content form-property__content" style="display: ${getEstate}">
                                                                    <c:forEach begin="1" end="${floorNumber}" var="item">
                                                                        <div id="Floor${item}" role="tabpanel" class="tab-pane <c:if test="${item == '1'}">active</c:if>" >
                                                                                <div>
                                                                                    <h2>Tầng ${item}</h2>
                                                                            </div>
                                                                            <input type="hidden" name="numBlock" value="${numBlock}">
                                                                            <input type="hidden" name="block" value="${block}">
                                                                            <input type="hidden" name="estateNumber" value="${estateNumber}">
                                                                            <input type="hidden" name="estateNumbers" value="${estateNumbers}">
                                                                            <input type="hidden" name="projectID" value="${projectID}">
                                                                            <div class="row">
                                                                                <div class="form-group form-group ${hasError}">
                                                                                    <label for="in-1" class="control-label">Số Căn Hộ Loại 1 &nbsp; <span style="color: red">*</span>&nbsp; </label> <span id="errEstate1" style="color: red"></span>
                                                                                    <input onkeyup="return checkEstate1()"  id="typeNumberFloorF${item}Type1"  type="number" name="typeNumberFloorF${item}Type1" value="0" class="form-control"/>
                                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                                        <div class="parsley-required">${message}</div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group form-group ${hasError}">
                                                                                    <label for="in-1" class="control-label">Số Căn Hộ Loại 2 &nbsp; <span style="color: red">*</span>&nbsp;</label> <span id="errEstate2" style="color: red"></span>
                                                                                    <input onkeyup="return checkEstate2()" onchange="changetypeNumberFloorF${item}Type2()" id="typeNumberFloorF${item}Type2"  type="number" name="typeNumberFloorF${item}Type2" value="0"  class="form-control"/>
                                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                                        <div class="parsley-required">${message}</div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group form-group ${hasError}">
                                                                                    <label for="in-1" class="control-label">Số Căn Hộ Loại 3&nbsp; <span style="color: red">*</span>&nbsp;</label> <span id="errEstate3" style="color: red"></span>
                                                                                    <input onkeyup="return checkEstate3()" onchange="changetypeNumberFloorF${item}Type3()" id="typeNumberFloorF${item}Type3"  type="number" name="typeNumberFloorF${item}Type3" value="0"  class="form-control"/>
                                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                                        <div class="parsley-required">${message}</div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="form-group form-group ${hasError}">
                                                                                    <label for="in-1" class="control-label">Diện Tích Tầng ${item}A (Đơn Vị M<sup>2</sup>)&nbsp; <span style="color: red">*</span></label> <span id="errArea1" style="color: red"></span>

                                                                                    <input  id="areasB${blocks}F${item}Type1" step="any" type="number" name="areasB${blocks}F${item}Type1" data-placeholder="---"  class="form-control"/>

                                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                                        <div class="parsley-required">${message}</div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group form-group ${hasError}">
                                                                                    <label for="in-1" class="control-label">Diện Tích Tầng ${item}B (Đơn Vị M<sup>2</sup>) &nbsp; <span style="color: red">*</span></label> <span id="errArea2" style="color: red"></span>
                                                                                    <input id="areasB${blocks}F${item}Type2" step="any" type="number" name="areasB${blocks}F${item}Type2" data-placeholder="---"  class="form-control"/>
                                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                                        <div class="parsley-required">${message}</div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group form-group ${hasError}">
                                                                                    <label for="in-1" class="control-label">Diện Tích Tầng ${item}C (Đơn Vị M<sup>2</sup>) &nbsp; <span style="color: red">*</span></label>  <span id="errArea3" style="color: red"></span>
                                                                                    <input id="areasB${blocks}F${item}Type3" step="any" type="number" name="areasB${blocks}F${item}Type3" data-placeholder="---"  class="form-control"/>
                                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                                        <div class="parsley-required">${message}</div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="form-group form-group ${hasError}">
                                                                                    <label for="in-1" class="control-label">Giá Tầng ${item}A (Đơn Vị Tỷ VND)&nbsp; <span style="color: red">*</span>&nbsp;</label> <span id="errFloor1" style="color: red"></span>

                                                                                    <input id="priceB${blocks}F${item}Type1" step="any" type="number" name="priceB${blocks}F${item}Type1" data-placeholder="---"  class="form-control"/>

                                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                                        <div class="parsley-required">${message}</div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group form-group ${hasError}">
                                                                                    <label for="in-1" class="control-label">Giá Tầng ${item}B (Đơn Vị Tỷ VND)&nbsp; <span style="color: red">*</span>&nbsp;</label> <span id="errFloor2" style="color: red"></span>
                                                                                    <input id="priceB${blocks}F${item}Type2" step="any"  type="number" name="priceB${blocks}F${item}Type2" data-placeholder="---"  class="form-control"/>
                                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                                        <div class="parsley-required">${message}</div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group form-group ${hasError}">
                                                                                    <label for="in-1" class="control-label">Giá Tầng ${item}C (Đơn Vị Tỷ VND)&nbsp; <span style="color: red">*</span>&nbsp;</label> <span id="errFloor3" style="color: red"></span>
                                                                                    <input id="priceB${blocks}F${item}Type3"  step="any" type="number" name="priceB${blocks}F${item}Type3" data-placeholder="---"  class="form-control"/>
                                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                                        <div class="parsley-required">${message}</div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="form-group form-group ${hasError}">
                                                                                    <label for="in-1" class="control-label">Phòng Ngủ Tầng ${item}A&nbsp; <span style="color: red">*</span>&nbsp; <span id="errBed1" style="color: red"></label>

                                                                                    <select id="bedRoomB${blocks}F${item}Type1" name="bedRoomB${blocks}F${item}Type1" class="form-control">
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                        <option value="4">4</option>
                                                                                        <option value="5">5</option>
                                                                                        <option value="6">6</option>
                                                                                        <option value="7">7</option>
                                                                                        <option value="8">8</option>
                                                                                        <option value="9">9</option>
                                                                                        <option value="10">10</option>
                                                                                    </select>
                                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                                        <div class="parsley-required">${message}</div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group form-group ${hasError}">
                                                                                    <label for="in-1" class="control-label">Phòng Ngủ Tầng ${item}B&nbsp; <span style="color: red">*</span>&nbsp; <span id="errBed2" style="color: red"></label>
                                                                                    <select id="bedRoomB${blocks}F${item}Type2" name="bedRoomB${blocks}F${item}Type2" class="form-control">
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                        <option value="4">4</option>
                                                                                        <option value="5">5</option>
                                                                                        <option value="6">6</option>
                                                                                        <option value="7">7</option>
                                                                                        <option value="8">8</option>
                                                                                        <option value="9">9</option>
                                                                                        <option value="10">10</option>
                                                                                    </select>
                                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                                        <div class="parsley-required">${message}</div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group form-group ${hasError}">
                                                                                    <label for="in-1" class="control-label">Phòng Ngủ Tầng ${item}C&nbsp; <span style="color: red">*</span>&nbsp; <span id="errBed3" style="color: red"></label>
                                                                                    <select id="bedRoomB${blocks}F${item}Type3" name="bedRoomB${blocks}F${item}Type3" class="form-control">
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                        <option value="4">4</option>
                                                                                        <option value="5">5</option>
                                                                                        <option value="6">6</option>
                                                                                        <option value="7">7</option>
                                                                                        <option value="8">8</option>
                                                                                        <option value="9">9</option>
                                                                                        <option value="10">10</option>
                                                                                    </select>
                                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                                        <div class="parsley-required">${message}</div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="form-group form-group ${hasError}">
                                                                                    <label for="in-1" class="control-label">Phòng Vệ Sinh ${item}A&nbsp; <span style="color: red">*</span>&nbsp; <span id="errBath1" style="color: red"></label>

                                                                                    <select id="bathRoomB${blocks}F${item}Type1" name="bathRoomB${blocks}F${item}Type1" class="form-control">
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                        <option value="4">4</option>
                                                                                        <option value="5">5</option>
                                                                                        <option value="6">6</option>
                                                                                        <option value="7">7</option>
                                                                                        <option value="8">8</option>
                                                                                        <option value="9">9</option>
                                                                                        <option value="10">10</option>
                                                                                    </select>
                                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                                        <div class="parsley-required">${message}</div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group form-group ${hasError}">
                                                                                    <label for="in-1" class="control-label">Phòng Vệ Sinh ${item}B &nbsp; <span style="color: red">*</span>&nbsp; <span id="errBath2" style="color: red"></label>
                                                                                    <select id="bathRoomB${blocks}F${item}Type2" name="bathRoomB${blocks}F${item}Type2" class="form-control">
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                        <option value="4">4</option>
                                                                                        <option value="5">5</option>
                                                                                        <option value="6">6</option>
                                                                                        <option value="7">7</option>
                                                                                        <option value="8">8</option>
                                                                                        <option value="9">9</option>
                                                                                        <option value="10">10</option>
                                                                                    </select>
                                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                                        <div class="parsley-required">${message}</div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group form-group ${hasError}">
                                                                                    <label for="in-1" class="control-label">Phòng Vệ Sinh ${item}C &nbsp; <span style="color: red">*</span>&nbsp; <span id="errBath3" style="color: red"></label>
                                                                                    <select id="bathRoomB${blocks}F${item}Type3" name="bathRoomB${blocks}F${item}Type3" class="form-control">
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                        <option value="4">4</option>
                                                                                        <option value="5">5</option>
                                                                                        <option value="6">6</option>
                                                                                        <option value="7">7</option>
                                                                                        <option value="8">8</option>
                                                                                        <option value="9">9</option>
                                                                                        <option value="10">10</option>
                                                                                    </select>
                                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                                        <div class="parsley-required">${message}</div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <input type="hidden" id="employeeB${blocks}F${item}ID" name="employeeB${blocks}F${item}" value="">
                                                                                <label id="employeeB${blocks}F${item}Name">&nbsp; <span style="color: red">*</span>&nbsp; <span id="errImg" style="color: red"></span></label>
                                                                                <img id="employeeB${blocks}F${item}Image" src="123" alt="photoe" class="photo">
                                                                                <button type="button" class="button__default" data-toggle="modal" data-target="#myModal${item}">Nhân Viên</button>
                                                                                <div class="modal fade" id="myModal${item}" role="dialog">
                                                                                    <div class="modal-dialog">

                                                                                        <!-- Modal content-->
                                                                                        <div class="modal-content">
                                                                                            <div class="modal-header">
                                                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                                            </div>
                                                                                            <div class="modal-body">
                                                                                                <div class="listing listing--grid">
                                                                                                    <c:forEach items="${employeeList}" var="employee">
                                                                                                        <div class="listing__item">
                                                                                                            <div data-sr="enter bottom move 80px, scale(0), over 0.3s" data-animate-end="animate-end" class="worker js-unhide-block vcard worker--grid">
                                                                                                                <div class="worker__photo">
                                                                                                                    <a onclick="getEmployeeID${item}(${employee.id}, '${employee.employeeName}', '${employee.employeeImg}')" data-dismiss="modal" class="item-photo item-photo--static">
                                                                                                                        <img src="${employee.employeeImg}" alt="Lisa Wemert" style="width: 150px !important; height: 150px !important" class="photo"/>
                                                                                                                        <figure class="item-photo__hover">
                                                                                                                            <span class="item-photo__more">Chọn</span>
                                                                                                                        </figure>
                                                                                                                    </a>
                                                                                                                </div>
                                                                                                                <div class="worker__intro">
                                                                                                                    <h3 class="worker__name fn">${employee.employeeName}</h3>
                                                                                                                    <div class="worker__post">Email: ${employee.employeeMail}</div>
                                                                                                                    <div class="worker__post">SĐT ${employee.employeePhone}</div>
                                                                                                                    <button type="button" class="worker__show js-unhide">Contact agent</button>
                                                                                                                    <!-- end of block .worker__listings-->
                                                                                                                </div>
                                                                                                                <div class="worker__descr">
                                                                                                                    <p>${employee.employeeAddress}.</p>
                                                                                                                </div>
                                                                                                                <!-- end of block .worker__descr-->
                                                                                                                <a href="agent_profile.html" class="worker__more">more details</a>
                                                                                                            </div>
                                                                                                            <!-- end of block .worker-->
                                                                                                        </div>
                                                                                                    </c:forEach>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="modal-footer">

                                                                                            </div>
                                                                                        </div>

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <a href="#Floor${item-1}" aria-controls="Floor${item-1}" class="form__submit" role="tab" data-toggle="tab">Trở Về</a>
                                                                                <c:if test="${floorNumber == item}">
                                                                                    <button type="submit"  name="getEstate" value="getEstate" class="form__submit">Xác Nhận</button>
                                                                                </c:if>
                                                                                <c:if test="${floorNumber != item}">
                                                                                    <a href="#Floor${item+1}" aria-controls="Floor${item+1}" class="form__submit" role="tab" data-toggle="tab">Tiếp Tục</a>
                                                                                </c:if>
                                                                            </div>

                                                                        </div>
                                                                        <script>
                                                                            
                                                                            // check form
                                                                            function checkForm() {
                                                                                var estate1 = document.getElementById('typeNumberFloorF${item}Type1').value;
                                                                                var price1 = document.getElementById('priceB${blocks}F${item}Type1').value;
                                                                                var area1 = document.getElementById('areasB${blocks}F${item}Type1').value;
                                                                                
                                                                                var estate2 = document.getElementById('typeNumberFloorF${item}Type2').value;
                                                                                var price2 = document.getElementById('priceB${blocks}F${item}Type2').value;
                                                                                var area2 = document.getElementById('areasB${blocks}F${item}Type2').value;
                                                                                
                                                                                var estate3 = document.getElementById('typeNumberFloorF${item}Type3').value;
                                                                                var price3 = document.getElementById('priceB${blocks}F${item}Type3').value;
                                                                                var area3 = document.getElementById('areasB${blocks}F${item}Type3').value;
                                                                                
                                                                                var img = document.getElementById('employeeB${blocks}F${item}ID').value;
                                                                                
//                                                                                var a=parseInt(estate2) + parseInt(estate1) + parseInt(estate3);
//                                                                                console.log('qwe '+a);
                                                                                
                                                                                if (parseInt(estate1) == ${estateNumber}) {
                                                                                    if (estate1 == null || estate1 <= 0) {
                                                                                        document.getElementById('errEstate1').innerHTML = 'Nhập Số Phòng Không Đúng';
                                                                                    }
                                                                                    if (price1 == null || price1 <= 0) {
                                                                                        document.getElementById('errFloor1').innerHTML = 'Nhập Giá Phòng Không Đúng';
                                                                                    }
                                                                                    if (area1 == null || area1 <= 0) {
                                                                                        document.getElementById('errArea1').innerHTML = 'Nhập Diện Tích Phòng Không Đúng';
                                                                                    }
                                                                                    if (img.length <= 0 || img == null) {
                                                                                        document.getElementById('errImg').innerHTML = 'Mời Chọn Hình ';
                                                                                    } else if (confirm('Bạn Muốn Tạo Căn Hộ !!!')) {
                                                                                        return true;
                                                                                    }else return false;
                                                                                    return false;
                                                                                    
                                                                                } else
                                                                                if ((parseInt(estate2) + parseInt(estate1)) == ${estateNumber}) {
                                                                                    
                                                                                    if (estate1 == null || estate1 <= 0) {
                                                                                        document.getElementById('errEstate1').innerHTML = 'Nhập Số Phòng Không Đúng';
                                                                                    }
                                                                                    if (price1 == null || price1 <= 0) {
                                                                                        document.getElementById('errFloor1').innerHTML = 'Nhập Giá Phòng Không Đúng';
                                                                                    }
                                                                                    if (area1 == null || area1 <= 0) {
                                                                                        document.getElementById('errArea1').innerHTML = 'Nhập Diện Tích Phòng Không Đúng';
                                                                                    }
                                                                                    if (estate2 == null || estate2 <= 0) {
                                                                                        document.getElementById('errEstate2').innerHTML = 'Nhập Số Phòng Không Đúng';
                                                                                    }
                                                                                    if (price2 == null || price2 <= 0) {
                                                                                        document.getElementById('errFloor2').innerHTML = 'Nhập Giá Phòng Không Đúng';
                                                                                    }
                                                                                    if (area2 == null || area2 <= 0) {
                                                                                        document.getElementById('errArea2').innerHTML = 'Nhập Diện Tích Phòng Không Đúng';
                                                                                    } if (img.length <= 0 || img == null) {
                                                                                        document.getElementById('errImg').innerHTML = 'Mời Chọn Hình ';
                                                                                    } else if (confirm('Bạn Muốn Tạo Căn Hộ !!!')) {
                                                                                        return true;
                                                                                    }else return false;
                                                                                    return false;
                                                                                } else if (((parseInt(estate2) + parseInt(estate1) + parseInt(estate3)) == 0) || ((parseInt(estate2) + parseInt(estate1) + parseInt(estate3)) == ${estateNumber})) {
                                                                                    
                                                                                    if (estate1 == null || estate1 <= 0) {
                                                                                        document.getElementById('errEstate1').innerHTML = 'Nhập Số Phòng Không Đúng';
                                                                                    }
                                                                                    if (price1 == null || price1 <= 0) {
                                                                                        document.getElementById('errFloor1').innerHTML = 'Nhập Giá Phòng Không Đúng';
                                                                                    }
                                                                                    if (area1 == null || area1 <= 0) {
                                                                                        document.getElementById('errArea1').innerHTML = 'Nhập Diện Tích Phòng Không Đúng';
                                                                                    }
                                                                                    if (estate2 == null || estate2 <= 0) {
                                                                                        document.getElementById('errEstate2').innerHTML = 'Nhập Số Phòng Không Đúng';
                                                                                    }
                                                                                    if (price2 == null || price2 <= 0) {
                                                                                        document.getElementById('errFloor2').innerHTML = 'Nhập Giá Phòng Không Đúng';
                                                                                    }
                                                                                    if (area2 == null || area2 <= 0) {
                                                                                        document.getElementById('errArea2').innerHTML = 'Nhập Diện Tích Phòng Không Đúng';
                                                                                    }
                                                                                    if (estate3 == null || estate3 <= 0) {
                                                                                        document.getElementById('errEstate3').innerHTML = 'Nhập Số Phòng Không Đúng';
                                                                                    }
                                                                                    if (price3 == null || price3 <= 0) {
                                                                                        document.getElementById('errFloor3').innerHTML = 'Nhập Giá Phòng Không Đúng';
                                                                                    }
                                                                                    if (area3 == null || area3 <= 0) {
                                                                                        document.getElementById('errArea3').innerHTML = 'Nhập Diện Tích Phòng Không Đúng';
                                                                                    } if (img.length <= 0 || img == null) {
                                                                                        document.getElementById('errImg').innerHTML = 'Mời Chọn Hình ';
                                                                                    } else if (confirm('Bạn Muốn Tạo Căn Hộ !!!')) {
                                                                                        return true;
                                                                                    }else return false;
                                                                                    return false;
                                                                                }
                                                                                
                                                                            }
                                                                            
                                                                            
                                                                            
                                                                            // function check  SỐ CĂN HỘ LOẠI 1
                                                                            function checkEstate1() {
                                                                                var estate1 = document.getElementById('typeNumberFloorF${item}Type1').value;
                                                                                if (estate1 == ${estateNumber}) {
                                                                                    disableFiledTrue('2');
                                                                                    disableFiledTrue('3');
                                                                                } else {
                                                                                    if (estate1 < ${estateNumber}) {
                                                                                        document.getElementById('errEstate1').innerHTML = '';
                                                                                        disableFiledFalse('2');
                                                                                        disableFiledFalse('3');
                                                                                    } else if (estate1 >${estateNumber}) {
                                                                                        document.getElementById('errEstate1').innerHTML = 'Số Căn Hộ Không Được Lớn Hơn ' +${estateNumber};
                                                                                        disableFiledTrue('2');
                                                                                        disableFiledTrue('3');
                                                                                    }
                                                                                }
                                                                            }
                                                                            // function check  SỐ CĂN HỘ LOẠI 2
                                                                            function checkEstate2() {
                                                                                var estate2 = document.getElementById('typeNumberFloorF${item}Type2').value;
                                                                                var estate1 = document.getElementById('typeNumberFloorF${item}Type1').value;
                                                                                var result = parseInt(estate2) + parseInt(estate1);
                                                                                console.log('1 ' + result);
                                                                                console.log('2 ' +${estateNumber});
                                                                                if (result > ${estateNumber}) {
                                                                                    disableFiledTrue('3');
                                                                                    document.getElementById('errEstate2').innerHTML = 'Tổng Căn Hộ Không Được Lớn Hơn ' +${estateNumber};
                                                                                } else if (result == ${estateNumber}) {
                                                                                    disableFiledTrue('3');
                                                                                    document.getElementById('errEstate2').innerHTML = '';
                                                                                } else if (result < ${estateNumber}) {
                                                                                    disableFiledFalse('3');
                                                                                    document.getElementById('errEstate2').innerHTML = '';
                                                                                    
                                                                                }
                                                                            }
                                                                            // function check  SỐ CĂN HỘ LOẠI 3
                                                                            function checkEstate3() {
                                                                                var estate2 = document.getElementById('typeNumberFloorF${item}Type2').value;
                                                                                var estate1 = document.getElementById('typeNumberFloorF${item}Type1').value;
                                                                                var estate3 = document.getElementById('typeNumberFloorF${item}Type3').value;
                                                                                var result = parseInt(estate2) + parseInt(estate1) + parseInt(estate3);
                                                                                if ((result) >${estateNumber}) {
                                                                                    document.getElementById('errEstate3').innerHTML = 'Tổng Căn Hộ Không Được Lớn Hơn ' +${estateNumber};
                                                                                } else if ((result) < ${estateNumber}) {
                                                                                    document.getElementById('errEstate3').innerHTML = 'Tổng Căn Hộ Không Được Nhỏ Hơn ' +${estateNumber};
                                                                                } else
                                                                                    document.getElementById('errEstate3').innerHTML = '';
                                                                            }
                                                                            // disable filed False
                                                                            function disableFiledFalse(num) {
                                                                                document.getElementById('typeNumberFloorF${item}Type' + num).readOnly = false;
                                                                                document.getElementById('priceB${blocks}F${item}Type' + num).readOnly = false;
                                                                                document.getElementById('bedRoomB${blocks}F${item}Type' + num).disabled = false;
                                                                                document.getElementById('bathRoomB${blocks}F${item}Type' + num).disabled = false;
                                                                                document.getElementById('areasB${blocks}F${item}Type' + num).readOnly = false;
                                                                            }
                                                                            // disable filed True
                                                                            function disableFiledTrue(num) {
                                                                                document.getElementById('typeNumberFloorF${item}Type' + num).readOnly = true;
                                                                                document.getElementById('priceB${blocks}F${item}Type' + num).readOnly = true;
                                                                                document.getElementById('bedRoomB${blocks}F${item}Type' + num).disabled = true;
                                                                                document.getElementById('bathRoomB${blocks}F${item}Type' + num).disabled = true;
                                                                                document.getElementById('areasB${blocks}F${item}Type' + num).readOnly = true;
                                                                            }
                                                                            function getEmployeeID${item}(employeeID, employeeName, employeeImg) {
                                                                                console.log(employeeID);
                                                                                console.log(employeeName);
                                                                                console.log(employeeImg);
                                                                                document.getElementById("employeeB${blocks}F${item}ID").value = employeeID;
                                                                                document.getElementById("employeeB${blocks}F${item}Name").innerHTML = employeeName;
                                                                                document.getElementById("employeeB${blocks}F${item}Image").src = employeeImg;
                                                                                console.log(document.getElementById("employeeBAF1ID").value);
                                                                            }
                                                                            ;
                                                                            
                                                                            function changetypeNumberFloorF${item}Type1() {
                                                                                var typeNumberFloorF${item}Type1 = parseInt(document.getElementById("typeNumberFloorF${item}Type1").value);
                                                                                //  document.getElementById("typeNumberFloorF${item}Type2").value = parseInt(${estateNumbers}) - typeNumberFloorF${item}Type1;
                                                                            }
                                                                            ;
                                                                            function changetypeNumberFloorF${item}Type2() {
                                                                                var typeNumberFloorF${item}Type1 = parseInt(document.getElementById("typeNumberFloorF${item}Type1").value);
                                                                                var typeNumberFloorF${item}Type2 = parseInt(document.getElementById("typeNumberFloorF${item}Type2").value);
                                                                                document.getElementById("typeNumberFloorF${item}Type3").value = parseInt(${estateNumbers}) - typeNumberFloorF${item}Type1 - typeNumberFloorF${item}Type2;
                                                                                
                                                                            }
                                                                            ;
                                                                            
                                                                            function changepriceB${blocks}F${item}Type1() {
                                                                                var priceB${blocks}F${item}Type1 = document.getElementById("priceB${blocks}F${item}Type1").value;
                                                                                document.getElementById("priceB${blocks}F${item}Type2").value = priceB${blocks}F${item}Type1;
                                                                                document.getElementById("priceB${blocks}F${item}Type3").value = priceB${blocks}F${item}Type1;
                                                                            }
                                                                            ;
                                                                            
                                                                            function changebedRoomB${blocks}F${item}Type1() {
                                                                                var bedRoomB${blocks}F${item}Type1 = document.getElementById("bedRoomB${blocks}F${item}Type1").value;
                                                                                document.getElementById("bedRoomB${blocks}F${item}Type2").value = bedRoomB${blocks}F${item}Type1;
                                                                                document.getElementById("bedRoomB${blocks}F${item}Type3").value = bedRoomB${blocks}F${item}Type1;
                                                                            }
                                                                            ;
                                                                            function changebathRoomB${blocks}F${item}Type1() {
                                                                                var bathRoomB${blocks}F${item}Type1 = document.getElementById("bathRoomB${blocks}F${item}Type1").value;
                                                                                document.getElementById("bathRoomB${blocks}F${item}Type2").value = bathRoomB${blocks}F${item}Type1;
                                                                                document.getElementById("bathRoomB${blocks}F${item}Type3").value = bathRoomB${blocks}F${item}Type1;
                                                                            }
                                                                            ;
                                                                            
                                                                            function changeareasB${blocks}F${item}Type1() {
                                                                                var areasB${blocks}F${item}Type1 = document.getElementById("areasB${blocks}F${item}Type1").value;
                                                                                document.getElementById("areasB${blocks}F${item}Type2").value = areasB${blocks}F${item}Type1;
                                                                                document.getElementById("areasB${blocks}F${item}Type3").value = areasB${blocks}F${item}Type1;
                                                                                
                                                                            }
                                                                        </script>
                                                                    </c:forEach>
                                                                </div>
                                                            </form>
                                                        </section>
                                                        <!--
                                                        <div class="widget__footer"><a class="widget__more">Show more properties</a></div>
                                                        -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="clearfix"></div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <footer class="footer container-fluid pl-30 pr-30">
                    <div class="row">
                        <div class="col-sm-12">
                            <p>2019 &copy; SGEstate24h. Prepare Page by Le Tuan Vu</p>
                        </div>
                    </div>
                </footer>
                <!-- /Footer -->

            </div>
            <!-- /Main Content -->

        </div>
        <!-- /#wrapper -->

        <!-- JavaScript -->
        <script>
            function loadCheckBox() {
                var idEstate = document.getElementById("estateID").value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("checkbox").innerHTML = this.responseText;
                    }
                };
                console.log("id " + idEstate);
                xhttp.open("GET", "EstateDetails?idEstate=" + idEstate, true);
                xhttp.send();
            }
            ;
            function autoFiledInput() {
                var a = document.getElementById('').value;
            }
            
            
            
        </script>
        <!-- jQuery -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Data table JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
        <script src="<%=request.getContextPath()%>/admin/dist/js/dataTables-data.js"></script>

        <!-- Slimscroll JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/dist/js/jquery.slimscroll.js"></script>

        <!-- simpleWeather JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/moment/min/moment.min.js"></script>
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/simpleWeather/jquery.simpleWeather.min.js"></script>
        <script src="<%=request.getContextPath()%>/admin/dist/js/simpleweather-data.js"></script>

        <!-- Progressbar Animation JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/waypoints/lib/jquery.waypoints.min.js"></script>
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/jquery.counterup/jquery.counterup.min.js"></script>

        <!-- Fancy Dropdown JS -->
        <script src="<%=request.getContextPath()%>/admin/dist/js/dropdown-bootstrap-extended.js"></script>

        <!-- Sparkline JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/jquery.sparkline/dist/jquery.sparkline.min.js"></script>

        <!-- Owl JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/owl.carousel/dist/owl.carousel.min.js"></script>

        <!-- ChartJS JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/chart.js/Chart.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/raphael/raphael.min.js"></script>
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/morris.js/morris.min.js"></script>
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/jquery-toast-plugin/dist/jquery.toast.min.js"></script>

        <!-- Switchery JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/switchery/dist/switchery.min.js"></script>

        <!-- Init JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/dist/js/init.js"></script>
        <script src="<%=request.getContextPath()%>/admin/dist/js/dashboard-data.js"></script>


    </body>

</html>
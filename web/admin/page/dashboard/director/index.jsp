<%-- 
    Document   : index
    Created on : Mar 30, 2019, 11:19:33 AM
    Author     : kiems
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <title>SGEstate24h</title>
        <meta name="description" content="Doodle is a Dashboard & Admin Site Responsive Template by hencework." />
        <meta name="keywords" content="admin, admin dashboard, admin template, cms, crm, Doodle Admin, Doodleadmin, premium admin templates, responsive admin, sass, panel, software, ui, visualization, web app, application" />
        <meta name="author" content="hencework"/>

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
            <%@ include file="/admin/page/template/director/left_sidebar.jsp" %>
            <!-- /Left Sidebar Menu -->

            <!-- Right Sidebar Menu -->
            <%@ include file="/admin/page/template/director/right_sidebar.jsp" %>
            <!-- /Right Sidebar Menu -->



            <!-- Main Content -->
            <div class="page-wrapper">
                <p id="wellcomepage" style="display: none">Bạn đã đăng nhập thành công</p>
                <div class="container-fluid pt-25">
                    <!-- Title -->
                    <div class="row heading-bg">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h3 class="txt-dark">Dashboard</h3>
                        </div>
                        <!-- Breadcrumb -->
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <ol class="breadcrumb">
                                <li><a href="<%=request.getContextPath()%>/Director">Admin</a></li>
                                <li><a href="<%=request.getContextPath()%>/Director">Dashboard</a></li>
                            </ol>
                        </div>
                        <!-- /Breadcrumb -->
                    </div>
                    <!-- /Title -->

                    <!-- Row -->
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="panel panel-default card-view panel-refresh">
                                <div class="refresh-container">
                                    <div class="la-anim-1"></div>
                                </div>
                                <div class="panel-heading">
                                    <div class="panel-body sm-data-box-1">
                                        <span class="uppercase-font weight-500 font-14 block text-center txt-dark">top 3 danh mục</span>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body">
                                        <div><iframe class="chartjs-hidden-iframe" style="width: 100%; display: block; border: 0px; height: 0px; margin: 0px; position: absolute; left: 0px; right: 0px; top: 0px; bottom: 0px;"></iframe>
                                            <canvas id="chart_6" height="191" width="247" style="display: block; width: 247px; height: 191px;"></canvas>
                                        </div>	
                                        <hr class="light-grey-hr row mt-10 mb-15">
                                        <c:forEach begin="0" end="2" items="${estateTypeListPublish1}" var="item" varStatus="i">
                                            <c:if test="${i.index == 0}">
                                                <p id="estateTypeName0" style="display: none">${estateTypeListPublish1[0].typeName}</p>
                                                <div class="label-chatrs">
                                                    <div class="">
                                                        <span class="clabels clabels-lg inline-block bg-blue mr-10 pull-left"></span>
                                                        <span class="clabels-text font-12 inline-block txt-dark capitalize-font pull-left">
                                                            <span class="block font-15 weight-500 mb-5">${estateTypeListPublish1[0].typeName}</span>
                                                            <span class="block txt-grey">
                                                                <c:forEach begin="0" end="${countEstateSoldListSize}" items="${countEstateSoldList}" var="item2">
                                                                    <c:if test="${item.id == item2.key}">
                                                                        ${item2.value} căn đã bán với 
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:forEach begin="0" end="${countMoneyEstateSoldListSize}" items="${countMoneyEstateSoldList}" var="item2">
                                                                    <c:if test="${item.id == item2.key}">
                                                                        <span id="estateTypePrice0" style="display: none">
                                                                            ${item2.value/1000000000}
                                                                        </span>
                                                                        ${item2.value/1000000000} tỷ
                                                                    </c:if>
                                                                </c:forEach>
                                                            </span>
                                                        </span>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                                <hr class="light-grey-hr row mt-10 mb-15">
                                            </c:if>
                                            <c:if test="${i.index == 1}">
                                                <p id="estateTypeName1" style="display: none">${estateTypeListPublish1[1].typeName}</p>
                                                <div class="label-chatrs">
                                                    <div class="">
                                                        <span class="clabels clabels-lg inline-block bg-green mr-10 pull-left"></span>
                                                        <span class="clabels-text font-12 inline-block txt-dark capitalize-font pull-left">
                                                            <span class="block font-15 weight-500 mb-5">${estateTypeListPublish1[1].typeName}</span>
                                                            <span class="block txt-grey">
                                                                <c:forEach begin="0" end="${countEstateSoldListSize}" items="${countEstateSoldList}" var="item2">
                                                                    <c:if test="${item.id == item2.key}">
                                                                        ${item2.value} căn đã bán với 
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:forEach begin="0" end="${countMoneyEstateSoldListSize}" items="${countMoneyEstateSoldList}" var="item2">
                                                                    <c:if test="${item.id == item2.key}">
                                                                        <span id="estateTypePrice1" style="display: none">
                                                                            ${item2.value/1000000000}
                                                                        </span>
                                                                        ${item2.value/1000000000} tỷ
                                                                    </c:if>
                                                                </c:forEach>
                                                            </span>
                                                        </span>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>        
                                                <hr class="light-grey-hr row mt-10 mb-15">
                                            </c:if>
                                            <c:if test="${i.index == 2}">
                                                <p id="estateTypeName2" style="display: none">${estateTypeListPublish1[2].typeName}</p>
                                                <div class="label-chatrs">
                                                    <div class="">
                                                        <span class="clabels clabels-lg inline-block bg-yellow mr-10 pull-left"></span>
                                                        <span class="clabels-text font-12 inline-block txt-dark capitalize-font pull-left">
                                                            <span class="block font-15 weight-500 mb-5">${estateTypeListPublish1[2].typeName}</span>
                                                            <span class="block txt-grey">
                                                                <c:forEach begin="0" end="${countEstateSoldListSize}" items="${countEstateSoldList}" var="item2">
                                                                    <c:if test="${item.id == item2.key}">
                                                                        ${item2.value} căn đã bán với 
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:forEach begin="0" end="${countMoneyEstateSoldListSize}" items="${countMoneyEstateSoldList}" var="item2">
                                                                    <c:if test="${item.id == item2.key}">
                                                                        <span id="estateTypePrice2" style="display: none">
                                                                            ${item2.value/1000000000}
                                                                        </span>
                                                                        ${item2.value/1000000000} tỷ
                                                                    </c:if>
                                                                </c:forEach>
                                                            </span>
                                                        </span>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>	
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="panel panel-default card-view">
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body sm-data-box-1">
                                        <span class="uppercase-font weight-500 font-14 block text-center txt-dark">Tổng lợi nhuận</span>	
                                        <div class="cus-sat-stat weight-500 txt-success text-center mt-5">

                                            <span class="counter-anim">
                                                <fmt:formatNumber type = "number" maxIntegerDigits = "2" value = "${sumMoneyCompany}" />
                                            </span><span> Tỷ</span>
                                        </div>
                                        <div class="progress-anim mt-20">
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success wow animated progress-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 93.12%;"></div>
                                            </div>
                                        </div>
                                        <ul class="flex-stat mt-5">
                                            <li>
                                                <span class="block">Tháng trước</span>
                                                <span class="block txt-dark weight-500 font-15">
                                                    <fmt:formatNumber type = "number" maxIntegerDigits = "2" value = "${sumMoneyCompanyByFeb}" />
                                                </span><span> Tỷ</span>
                                            </li>
                                            <li>
                                                <span class="block">Tháng này</span>
                                                <span class="block txt-dark weight-500 font-15">
                                                    <fmt:formatNumber type = "number" maxIntegerDigits = "2" value = "${sumMoneyCompanyByMar}" />
                                                </span><span> Tỷ</span>
                                            </li>
                                            <li>
                                                <c:if test="${sumMoneyCompanyByMar - sumMoneyCompanyByFeb > 0}">
                                                    <span class="block">Xu hướng</span>
                                                    <span class="block">
                                                        <i class="zmdi zmdi-trending-up txt-success font-20"></i><span> ${trendMoneyCompany}%</span>
                                                    </span>    
                                                </c:if>
                                                <c:if test="${sumMoneyCompanyByMar - sumMoneyCompanyByFeb < 0}">
                                                    <span class="block">Xu hướng</span>
                                                    <span class="block">
                                                        <i class="zmdi zmdi-trending-down txt-success font-20"></i><span> ${trendMoneyCompany}%</span>
                                                    </span>    
                                                </c:if>
                                            </li>
                                        </ul>
                                        <div class="progress-anim mt-20">
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success wow animated progress-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 93.12%;"></div>
                                            </div>
                                        </div>
                                        <ul class="flex-stat mt-5">
                                            <li class="half-width">
                                                <span class="block">Số giao dịch đang chờ</span>
                                                <span class="block txt-dark weight-500 font-15">
                                                    <fmt:formatNumber type = "number" maxIntegerDigits = "2" value = "${estateTransaction}" />
                                                </span>
                                            </li>
                                            <li class="half-width">
                                                <span class="block">Số giao dịch thành công</span>
                                                <span class="block txt-dark weight-500 font-15">
                                                    <fmt:formatNumber type = "number" maxIntegerDigits = "2" value = "${contractCountCompany}" />
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="panel panel-default card-view">
                                <div class="panel-heading">
                                    <div class="panel-body sm-data-box-1">
                                        <span class="uppercase-font weight-500 font-14 block text-center txt-dark">TOP 3 Nhân viên</span>	
                                        <div class="cus-sat-stat weight-500 txt-success text-center mt-5">

                                            <span class="counter-anim">
                                                <fmt:formatNumber type="number" pattern="###,###" value="${sumMoney/1000000}" />
                                            </span><span> Triệu</span>
                                        </div>
                                        <div class="progress-anim mt-20">
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success wow animated progress-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 93.12%;"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body">
                                        <div>
                                            <c:forEach begin="0" end="2" items="${employeeListTop}" var="item">
                                                <span class="pull-left inline-block capitalize-font txt-dark">
                                                    ${item.employeeName}
                                                </span>
                                                <span class="pull-right">
                                                    <c:forEach begin="0" end="${countMoneyEmployeeSoldSize}" items="${countMoneyEmployeeSold}" var="item2">
                                                        <c:if test="${item.id == item2.key}">
                                                            ${item2.value/1000000} triệu
                                                        </c:if>
                                                    </c:forEach>
                                                </span>
                                                <div class="clearfix"></div>
                                                <hr class="light-grey-hr row mt-10 mb-10">
                                            </c:forEach>
                                        </div>
                                    </div>	
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="panel panel-default card-view panel-refresh">
                                <div class="refresh-container">
                                    <div class="la-anim-1"></div>
                                </div>
                                <div class="panel-heading">
                                    <div class="pull-left">
                                        <h6 class="panel-title txt-dark">Doanh thu từng tháng</h6>
                                    </div>
                                    <div class="pull-right">
                                        <a href="#" class="pull-left inline-block refresh mr-15">
                                            <i class="zmdi zmdi-replay"></i>
                                        </a>
                                        <div class="pull-left inline-block dropdown">
                                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false" role="button"><i class="zmdi zmdi-more-vert"></i></a>
                                            <ul class="dropdown-menu bullet dropdown-menu-right" role="menu">
                                                <li role="presentation"><a href="javascript:void(0)" role="menuitem"><i class="icon wb-reply" aria-hidden="true"></i>option 1</a></li>
                                                <li role="presentation"><a href="javascript:void(0)" role="menuitem"><i class="icon wb-share" aria-hidden="true"></i>option 2</a></li>
                                                <li role="presentation"><a href="javascript:void(0)" role="menuitem"><i class="icon wb-trash" aria-hidden="true"></i>option 3</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body">
                                        <div><iframe class="chartjs-hidden-iframe" style="width: 100%; display: block; border: 0px; height: 0px; margin: 0px; position: absolute; left: 0px; right: 0px; top: 0px; bottom: 0px;"></iframe>
                                            <canvas id="chart_2" height="253" width="344" style="display: block; width: 344px; height: 253px;"></canvas>
                                        </div>	
                                        <div class="label-chatrs mt-30">
                                            <p id="getJanRealEstate24hIncome" style="display: none">${sumMoneyCompanyByJan1}</p>
                                            <p id="getFebRealEstate24hIncome" style="display: none">${sumMoneyCompanyByJan2}</p>
                                            <p id="getMarRealEstate24hIncome" style="display: none">${sumMoneyCompanyByJan}</p>
                                            <p id="getAprilRealEstate24hIncome" style="display: none">${sumMoneyCompanyByFeb}</p>
                                            <p id="getMayRealEstate24hIncome" style="display: none">${sumMoneyCompanyByMar}</p>
                                        </div>
                                    </div>
                                </div>	
                            </div>
                        </div>

                        <div class="col-lg-12 col-md-6 col-sm-6 col-xs-12">
                            <div class="panel panel-default card-view">
                                <div class="panel-heading">
                                    <div class="pull-left">
                                        <h3 class="txt-dark">
                                            Số căn hộ đang chờ giao dịch: ${countUnitEstateSaleList}<br>
                                            Tồng số tiền chờ giao dịch: 
                                            <fmt:formatNumber type="number" pattern="###,###" value="${countMoneyEstaetSaleList/1000000000}" />
                                            tỷ VND
                                        </h3>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body">
                                        <div class="table-wrap">
                                            <div class="table-responsive">
                                                
                                                <table id="example" class="table table-hover display  pb-30">
                                                    <thead>
                                                        <tr>
                                                            <th>Danh mục</th>
                                                            <th>Danh sách</th>
                                                            <th>Tổng số tiền</th>
                                                        </tr>
                                                    </thead>
                                                    <c:forEach begin="0" end="${estateTypeListPublishSize}" items="${estateTypeListPublish}" var="item"><tr>
                                                            <td>${item.typeName}</td>   
                                                            <td>
                                                                <c:forEach begin="0" end="${countEstateSaleListSize}" items="${countEstateSaleList}" var="item2">
                                                                    <c:if test="${item.id == item2.key}">
                                                                        ${item2.value}
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                            <td>
                                                                <c:forEach begin="0" end="${countMoneyEstateSaleListSize}" items="${countMoneyEstateSaleList}" var="item2">
                                                                    <c:if test="${item.id == item2.key}">
                                                                        ${item2.value/1000000000} tỷ
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-6 col-sm-6 col-xs-12">
                            <div class="panel panel-default card-view">
                                <div class="panel-heading">
                                    <div class="pull-left">
                                        <h3 class="txt-dark">
                                            Số căn đã bán: ${countUnitEstateSoldList}<br>
                                            Tổng số tiền đang bán: 
                                            <fmt:formatNumber type="number" pattern="###,###" value="${countMoneyEstaetSoldList/1000000000}" />
                                            tỷ VND
                                        </h3>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body">
                                        <div class="table-wrap">
                                            <div class="table-responsive">
                                                <table id="example1" class="table table-hover display  pb-30">
                                                    <thead>
                                                        <tr>
                                                            <th>Danh mục</th>
                                                            <th>Danh sách</th>
                                                            <th>Tổng số tiền căn hộ đang bán</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach begin="0" end="${estateTypeListPublishSize}" items="${estateTypeListPublish}" var="item"><tr>
                                                                <td>${item.typeName}</td>   
                                                                <td>
                                                                    <c:forEach begin="0" end="${countEstateSoldListSize}" items="${countEstateSoldList}" var="item2">
                                                                        <c:if test="${item.id == item2.key}">
                                                                            ${item2.value}
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach begin="0" end="${countMoneyEstateSoldListSize}" items="${countMoneyEstateSoldList}" var="item2">
                                                                        <c:if test="${item.id == item2.key}">
                                                                            ${item2.value/1000000000} tỷ
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Row -->

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

                <!-- GET data -->

            </div>
            <!-- /Main Content -->

        </div>
        <!-- /#wrapper -->

        <!-- JavaScript -->

        <!-- jQuery -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Data table JavaScript -->
        
        
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/datatables.net-buttons/js/buttons.flash.min.js"></script>
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/jszip/dist/jszip.min.js"></script>
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/pdfmake/build/pdfmake.min.js"></script>
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/pdfmake/build/vfs_fonts.js"></script>

        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/datatables.net-buttons/js/buttons.html5.min.js"></script>
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/datatables.net-buttons/js/buttons.print.min.js"></script>
        <script src="<%=request.getContextPath()%>/admin/dist/js/export-table-data.js"></script>

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

        <!-- Sparkline JavaScript 
        <script src="<%=request.getContextPath()%>/admin/vendors/jquery.sparkline/dist/jquery.sparkline.min.js"></script>
        `-->

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


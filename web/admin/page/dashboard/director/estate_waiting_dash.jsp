<%-- 
    Document   : index
    Created on : Mar 30, 2019, 11:19:33 AM
    Author     : kiems
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <p id="wellcomepage" style="display: none">Đây là trang "Công việc hằng ngày"</p>
                <div class="container-fluid pt-25">
                    <!-- Title -->
                    <div class="row heading-bg">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h3 class="txt-dark">ESTATE</h3>
                        </div>
                        <!-- Breadcrumb -->
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <ol class="breadcrumb">
                                <li><a href="<%=request.getContextPath()%>/Director">Admin</a></li>
                                <li><a href="<%=request.getContextPath()%>/EstateList?user=director">Estate</a></li>
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
                                        Tổng quan
                                    </h3>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div  class="panel-wrapper collapse in">
                                <div  class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="panel panel-default card-view pa-0">
                                                <div class="panel-wrapper collapse in">
                                                    <div class="panel-body pa-0">
                                                        <div class="sm-data-box bg-red">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div class="col-xs-6 text-center pl-0 pr-0 data-wrap-left">
                                                                        <span class="txt-light block counter"><span class="counter-anim">${countContractWaitSale}</span></span>
                                                                        <a href="<%=request.getContextPath()%>/DashboardDirector" class="weight-500 uppercase-font txt-light block font-13">
                                                                            Yêu cầu giao dịch
                                                                        </a>
                                                                    </div>
                                                                    <div class="col-xs-6 text-center  pl-0 pr-0 data-wrap-right">
                                                                        <i class="fa fa-bell txt-light data-right-rep-icon"></i>
                                                                    </div>
                                                                </div>	
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="panel panel-default card-view pa-0">
                                                <div class="panel-wrapper collapse in">
                                                    <div class="panel-body pa-0">
                                                        <div class="sm-data-box bg-yellow">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div class="col-xs-6 text-center pl-0 pr-0 data-wrap-left">
                                                                        <span class="txt-light block counter"><span class="counter-anim">${countEstateWait}</span></span>
                                                                        <span class="weight-500 uppercase-font txt-light block">
                                                                            <a href="<%=request.getContextPath()%>/EstateList?user=director&filter=waitting for director" class="weight-500 uppercase-font txt-light block font-13">
                                                                                nhà-đất chờ duyệt
                                                                            </a>
                                                                        </span>
                                                                    </div>
                                                                    <div class="col-xs-6 text-center  pl-0 pr-0 data-wrap-right">
                                                                        <i class="fa fa-home txt-light data-right-rep-icon"></i>
                                                                    </div>
                                                                </div>	
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="panel panel-default card-view pa-0">
                                                <div class="panel-wrapper collapse in">
                                                    <div class="panel-body pa-0">
                                                        <div class="sm-data-box bg-green">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div class="col-xs-6 text-center pl-0 pr-0 data-wrap-left">
                                                                        <span class="txt-light block counter"><span class="counter-anim">${countProjectWait}</span></span>
                                                                        <span class="weight-500 uppercase-font txt-light block"> chung cư chờ duyệt</span>
                                                                    </div>
                                                                    <div class="col-xs-6 text-center  pl-0 pr-0 data-wrap-right">
                                                                        <i class="fa fa-institution txt-light data-right-rep-icon"></i>
                                                                    </div>
                                                                </div>	
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="panel panel-default card-view pa-0">
                                                <div class="panel-wrapper collapse in">
                                                    <div class="panel-body pa-0">
                                                        <div class="sm-data-box bg-blue">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div class="col-xs-6 text-center pl-0 pr-0 data-wrap-left">
                                                                        <span class="txt-light block counter"><span class="counter-anim">46.43</span>%</span>
                                                                        <span class="weight-500 uppercase-font txt-light block"> Tài chính</span>
                                                                    </div>
                                                                    <div class="col-xs-6 text-center  pl-0 pr-0 pt-25  data-wrap-right">
                                                                        <div id="sparkline_4" style="width: 100px; overflow: hidden; margin: 0px auto;"></div>
                                                                    </div>
                                                                </div>	
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Row -->

                    <!-- Row -->
                    <div class="row">
                        <div class="panel panel-default card-view">
                            <div class="panel-heading">
                                <div class="pull-left">
                                    <h3 class="txt-dark">
                                        Danh sách nhà:
                                    </h3>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="panel-wrapper collapse in">
                                <div class="panel-body">
                                    <div class="row">
                                        <c:forEach items="${estateList}" var="estate">
                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                <div class="panel 
                                                     <c:choose>
                                                         <c:when test="${estate.estateStatus == 'waitting to transaction'}">
                                                             panel-danger 
                                                         </c:when>
                                                         <c:when test="${estate.estateStatus == 'waitting for employee'}">
                                                             panel-warning
                                                         </c:when>
                                                         <c:when test="${estate.estateStatus == 'waitting for director' ||
                                                                         estate.estateStatus == 'waitting for director create' ||
                                                                         estate.estateStatus == 'waitting for director edit'
                                                                 }">
                                                             panel-warning
                                                         </c:when>
                                                         <c:when test="${estate.estateStatus == 'waitting for director delete'}">
                                                             panel-warning
                                                         </c:when>
                                                         <c:when test="${estate.estateStatus == 'sold'}">
                                                             panel-primary
                                                         </c:when>
                                                         <c:when test="${estate.estateStatus == 'publish'}">
                                                             panel-success
                                                         </c:when>
                                                         <c:when test="${estate.estateStatus == 'project'}">
                                                             panel-success
                                                         </c:when>
                                                     </c:choose>
                                                     contact-card card-view
                                                     ">

                                                    <div class="panel-heading">
                                                        <div class="pull-left">
                                                            <div class="pull-left user-detail-wrap">	
                                                                <span class="block card-user-name">
                                                                    ${estate.estateName}
                                                                </span>
                                                                <span class="block card-user-desn">
                                                                    <c:choose>
                                                                        <c:when test="${estate.estateStatus == 'waitting to transaction'}">
                                                                            Đang đợi giao dịch 
                                                                        </c:when>
                                                                        <c:when test="${estate.estateStatus == 'waitting for employee'}">
                                                                            Đang đợi nhân viên tư vấn
                                                                        </c:when>
                                                                        <c:when test="${estate.estateStatus == 'waitting for director' ||
                                                                                        estate.estateStatus == 'waitting for director create' ||
                                                                                        estate.estateStatus == 'waitting for director edit'
                                                                                }">
                                                                            Đang đợi giám đốc đồng ý
                                                                        </c:when>
                                                                        <c:when test="${estate.estateStatus == 'waitting for director delete'}">
                                                                            Đang đợi giám đốc đồng ý
                                                                        </c:when>
                                                                        <c:when test="${estate.estateStatus == 'sold'}">
                                                                            Đã bán
                                                                        </c:when>
                                                                        <c:when test="${estate.estateStatus == 'publish'}">
                                                                            Đang chờ bán
                                                                        </c:when>
                                                                        <c:when test="${estate.estateStatus == 'project'}">
                                                                            Chung cư
                                                                        </c:when>
                                                                    </c:choose>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="pull-right">
                                                            <c:if test="${estate.estateStatus == 'waitting for director create' || estate.estateStatus == 'waitting for director edit'}">
                                                                <a class="pull-left inline-block mr-15" href="<%=request.getContextPath()%>/EstateArgree?estateID=${estate.id}&choice=add">
                                                                    <i class="glyphicon glyphicon-ok txt-light"></i>
                                                                </a>
                                                                <a class="pull-left inline-block mr-15" href="<%=request.getContextPath()%>/EstateArgree?estateID=${estate.id}&choice=remove">
                                                                    <i class="glyphicon glyphicon-remove txt-light"></i>
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${estate.estateStatus == 'waitting for director delete'}">
                                                                <a class="pull-left inline-block mr-15" href="<%=request.getContextPath()%>/EstateArgree?estateID=${estate.id}&choice=add">
                                                                    <i class="glyphicon glyphicon-ok txt-light"></i>
                                                                </a>
                                                            </c:if>
                                                            <a class="pull-left inline-block mr-15" href="<%=request.getContextPath()%>/EstateDetails?estateID=${estate.id}" target="_blank">
                                                                <i class="glyphicon glyphicon-zoom-in txt-light"></i>
                                                            </a>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="panel-wrapper collapse in">
                                                        <div class="panel-body row">
                                                            <div class="pull-right mr-15" >
                                                                <img src="${estate.image1st}" alt="estateImage" width="150px" height="150px">
                                                            </div>
                                                            <div class="user-others-details pl-15 pr-15">
                                                                <div class="mb-15">
                                                                    <span class="inline-block capitalize-font mr-5">Phòng ngủ:</span>
                                                                    <span class="txt-dark">${estate.bedRoom}</span>
                                                                </div>
                                                                <div class="mb-15">
                                                                    <span class="inline-block capitalize-font mr-5">Phòng tắm:</span>
                                                                    <span class="txt-dark">${estate.bathRoom}</span>
                                                                </div>
                                                                <div class="mb-15">
                                                                    <span class="inline-block capitalize-font mr-5">Garages:</span>
                                                                    <span class="txt-dark">${estate.garages}M<sup>2</sup></span>
                                                                </div>
                                                                <div class="mb-15">
                                                                    <span class="inline-block capitalize-font mr-5">Diện tích:</span>
                                                                    <span class="txt-dark">${estate.areas}M<sup>2</sup></span>
                                                                </div>
                                                                <div class="mb-15">
                                                                    <span class="inline-block capitalize-font mr-5">Loại nhà:</span>
                                                                    <span class="txt-dark">${estate.estateTypeId.typeName}</span>
                                                                </div>
                                                            </div>
                                                            <hr class="light-grey-hr mt-20 mb-20"/>
                                                            <div class="emp-detail pl-15 pr-15">
                                                                <div class="mb-5">
                                                                    <span class="inline-block capitalize-font mr-5">Địa chỉ:</span>
                                                                    <span class="txt-dark">${estate.address1} <br> ${estate.address2}</span>
                                                                </div>
                                                                <div>
                                                                    <span class="inline-block capitalize-font mr-5">Giá bán:</span>
                                                                    <span class="txt-dark">12000 VND</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
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


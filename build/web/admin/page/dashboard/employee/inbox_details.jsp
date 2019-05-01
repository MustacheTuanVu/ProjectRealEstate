<%-- 
    Document   : index
    Created on : Mar 30, 2019, 11:19:33 AM
    Author     : kiems
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
            <%@ include file="/admin/page/template/employee/left_sidebar.jsp" %>
            <!-- /Left Sidebar Menu -->

            <!-- Right Sidebar Menu -->
            <%@ include file="/admin/page/template/director/right_sidebar.jsp" %>
            <!-- /Right Sidebar Menu -->

            <!-- Main Content -->
            <div class="page-wrapper">
                <div class="container-fluid">
                    <!-- Title -->
                    <div class="row heading-bg">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h5 class="txt-dark">inbox</h5>
                        </div>
                        <!-- Breadcrumb -->
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <ol class="breadcrumb">
                                <li><a href="index.html">Dashboard</a></li>
                                <li><a href="#"><span>apps</span></a></li>
                                <li class="active"><span>inbox</span></li>
                            </ol>
                        </div>
                        <!-- /Breadcrumb -->
                    </div>
                    <!-- /Title -->

                    <!-- Row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default card-view pa-0">
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body pa-0">
                                        <div class="mail-box">
                                            <div class="row">
                                                <aside class="col-lg-12 col-md-12 pl-4">
                                                    <div class="panel panel-refresh pa-0">
                                                        <div class="refresh-container">
                                                            <div class="la-anim-1"></div>
                                                        </div>
                                                        <div class="panel-heading pt-20 pb-20 pl-15 pr-15">
                                                            <div class="pull-left">
                                                                <h6 class="panel-title txt-dark">Tin nhắn</h6>
                                                            </div>
                                                            <div class="pull-right">
                                                                <a href="#" class="pull-left inline-block refresh">
                                                                    <i class="zmdi zmdi-replay"></i>
                                                                </a>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                        <div class="panel-wrapper collapse in">
                                                            <div class="panel-body inbox-body pa-0">
                                                                <div class="heading-inbox">
                                                                    <div class="container-fluid">
                                                                        <div class="pull-left">
                                                                            <div class="compose-btn">
                                                                                <a class="btn btn-sm mr-10" href="#" data-toggle="modal" title="Compose"><i class="zmdi zmdi-chevron-left"></i></a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <hr class="light-grey-hr mt-10 mb-15"/>
                                                                    <div class="container-fluid mb-20">	
                                                                        <h4 class="weight-500"> Khách hẹn tư vấn mua nhà tại ${find.estateId.address2}</h4>
                                                                    </div>	
                                                                </div>
                                                                <div class="sender-info">
                                                                    <div class="container-fluid">
                                                                        <div class="sender-img-wrap pull-left mr-20">
                                                                            <img class="sender-img" alt="user" src="${find.customerId.customerImg}">
                                                                        </div>
                                                                        <div class="sender-details   pull-left">
                                                                            <span class="capitalize-font pr-5 txt-dark block font-15 weight-500 head-font">${find.customerId.customerName}</span>
                                                                            <span class="block">
                                                                                to
                                                                                <span>me</span>
                                                                            </span>	
                                                                        </div>	
                                                                        <div class="pull-right">
                                                                            <div class="inline-block mr-5">
                                                                                <span class="inbox-detail-time-1 font-12"><fmt:formatDate value="${find.contactTime}" pattern="dd/MM" /></span>
                                                                                <span class="inbox-detail-time-2 font-12 inline-block">(Lịch hẹn)</span>
                                                                            </div>
                                                                            <div class="inline-block dropdown">
                                                                                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false" role="button"><i class="zmdi   zmdi-more-vert"></i></a>
                                                                                <ul class="dropdown-menu bullet dropdown-menu-right"  role="menu">
                                                                                    <li role="presentation"><a href="javascript:void(0)" role="menuitem"><i class="icon wb-reply" aria-hidden="true"></i>Đổi thời gian</a></li>
                                                                                    <li role="presentation"><a href="javascript:void(0)" role="menuitem"><i class="icon wb-share" aria-hidden="true"></i>Đồng ý</a></li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="container-fluid view-mail mt-20">
                                                                    <p>
                                                                        ${find.contactContext}
                                                                    </p>
                                                                </div>
                                                                <hr class="light-grey-hr mt-20 mb-20"/>
                                                                <div class="container-fluid attachment-mail mt-40 mb-40">
                                                                    <div class="download-blocks mb-20">
                                                                        <span class="capitalize-font pr-5 txt-dark block font-15 weight-500 head-font">Thông tin liên lạc</span>
                                                                        <p>Địa chỉ: <span class="pr-15">${find.estateId.address2}</span></p>
                                                                        <p>Số điện thoại: <span class="pr-15">${find.customerId.phone}</span></p>
                                                                        <p>Thời gian hẹn: <span class="pr-15">
                                                                            Ngày <fmt:formatDate value="${find.contactTime}" pattern="dd" />
                                                                            Tháng <fmt:formatDate value="${find.contactTime}" pattern="MM" />
                                                                        </span></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </aside>
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
                            <p>2017 &copy; Doodle. Pampered by Hencework</p>
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


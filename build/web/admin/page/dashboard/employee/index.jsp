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
            <%@ include file="/admin/page/template/employee/left_sidebar.jsp" %>
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
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-default card-view">
                                <div class="panel-heading">
                                    <div class="pull-left">
                                        <h3 class="txt-dark">
                                            Xin chào! Bạn đã đăng nhập vào khu vực Quản trị của SGEstate24h!<br>
                                            <small class="text-muted"> Công việc của bạn bao gồm những việc sau:</small>
                                        </h3>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div  class="panel-wrapper collapse in">
                                    <div  class="panel-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <h4>Quản lý nhà-đất</h4>
                                                <hr>
                                                <span class="fa fa-home"></span><a href="<%=request.getContextPath()%>/EstateCreate"> Thêm nhà đất</a>
                                                <hr>
                                                <span class="fa fa-home"></span><a href="#"> Danh sách nhà đất</a>
                                                <hr>
                                                <span class="fa fa-home"></span><a href="#"> Kiểm tra nhà đất</a>
                                                <span class="fa fa-home"></span><a class="<c:if test="${active == 'CreateEstate'}">active</c:if>" href="<%=request.getContextPath()%>/EstateCreate1" data-toggle="collapse" data-target="#dashboard_dr">
                                                    Thêm nhà đất</a>
                                                <hr>
                                                <span class="fa fa-home"></span><a class="<c:if test="${active == 'EstateList'}">active</c:if>" href="<%=request.getContextPath()%>/EstateList?user=employee" data-toggle="collapse" data-target="#dashboard_dr"> 
                                                    Danh sách nhà đất</a>
                                                <hr>
                                                <span class="fa fa-home"></span><a class="<c:if test="${active == 'EstateTypeList'}">active</c:if>" href="<%=request.getContextPath()%>/EstateTypeList" data-toggle="collapse" data-target="#dashboard_dr">
                                                    Danh mục nhà đất</a>
                                                <hr>
                                                <span class="fa fa-home"></span> <a class="<c:if test="${active == 'FeatureList'}">active</c:if>" href="<%=request.getContextPath()%>/FeatureList" data-toggle="collapse" data-target="#dashboard_dr">
                                                    Nội thất-chức năng</a>
                                                <hr>
                                            </div>
                                            <div class="col-md-4">
                                                <h4>Quản lý giao dịch - khách hàng</h4>
                                                <hr>
                                                <span class="fa fa-paper-plane-o"></span><a href="#"> Các yêu cầu giao dịch</a>
                                                <hr>
                                                <span class="fa fa-list-ul"></span><a href="#"> Danh sách giao dịch</a>
                                                <hr>
                                                <span class="fa fa-users"></span><a href="#"> Danh sách khách hàng</a>
                                                <hr>
                                                <span class="fa fa-legal"></span><a href="#"> Danh sách hợp đồng</a>
                                                <span class="fa fa-users"></span><a class="<c:if test="${active == 'CustomerOfEmployee'}">active</c:if>" href="<%=request.getContextPath()%>/CustomerOfEmployee" data-toggle="collapse" data-target="#dashboard_dr">
                                                    Danh sách khách hàng</a>
                                                <hr>
                                                <span class="fa fa-users"><a class="<c:if test="${active == 'ContractOfEmployee'}">active</c:if>" href="<%=request.getContextPath()%>/ContractOfEmployee" data-toggle="collapse" data-target="#dashboard_dr">
                                                    Danh sách hợp đồng</a>
                                                <hr>
                                                <span class="fa-calendar"></span><a href="#"> Lịch hẹn</a>
                                                <hr>
                                            </div>
                                            <div class="col-md-4">
                                                <h4>Quản lý bài viết</h4>
                                                <hr>
                                                <span class="fa fa-pencil"></span><a href="<%=request.getContextPath()%>/CreateBlog"> Tạo bài viết</a>
                                                <hr>
                                                <span class="fa fa-files-o"></span><a href="<%=request.getContextPath()%>/BlogList"> Danh sách bài viết</a>
                                                <hr>
                                                <span class="fa fa-comment"></span><a href="<%=request.getContextPath()%>"> Comment chờ duyệt</a>
                                                <hr>
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


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
                            <h3 class="txt-dark">Works</h3>
                        </div>
                        <!-- Breadcrumb -->
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <ol class="breadcrumb">
                                <li><a href="<%=request.getContextPath()%>/Director">Admin</a></li>
                                <li><a href="<%=request.getContextPath()%>/DashboardDirector">Works</a></li>
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
                                        Công việc đang chờ bạn hôm nay!
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
                                                                        <span class="weight-500 uppercase-font txt-light block">
                                                                            <a href="<%=request.getContextPath()%>/ProjectList?user=director" class="weight-500 uppercase-font txt-light block font-13">
                                                                                chung cư chờ duyệt
                                                                            </a>
                                                                        </span>
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
                                        Danh sách giao dịch:
                                    </h3>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="panel-wrapper collapse in">
                                <div class="panel-body">
                                    <div class="table-wrap">
                                        <div class="table-responsive">
                                            <table id="datable_1" class="table table-hover display  pb-30">
                                                <thead>
                                                    <tr>
                                                        <th>Khách hàng</th>
                                                        <th>Nhân viên</th>
                                                        <th>Địa chỉ</th>
                                                        <th>Giá mong muốn</th>
                                                        <th>Tình trạng</th>
                                                    </tr>
                                                </thead>
                                                <c:forEach items="${contractList}" var="item">
                                                    <c:if test="${item.estateId.assignDetails == null}">
                                                        <c:if test="${item.contractId.status == 'waitting for employee'}">
                                                            <tr>
                                                                <td>${item.contractId.customerId.customerName}</td>
                                                                <td>${item.contractId.employeeId.employeeName}</td>
                                                                <td>${item.estateId.address1} - ${item.estateId.address2}</td>
                                                                <td>${item.estateId.price}</td>
                                                                <td>
                                                                    <c:if test="${item.estateId.assignDetails == null}">
                                                                        <c:if test="${item.contractId.status == 'waitting for employee'}">
                                                                            <a data-toggle="modal" data-target="#${item.estateId.id}" class="label label-danger">Khách muốn bán</a>
                                                                            <!-- sample modal content -->
                                                                            <div id="${item.estateId.id}" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                                                                <div class="modal-dialog modal-lg">
                                                                                    <div class="modal-content">
                                                                                        <div class="modal-header">
                                                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                                                            <h5 class="modal-title" id="myLargeModalLabel">Chọn nhân viên</h5>
                                                                                        </div>
                                                                                        <div class="modal-body">
                                                                                            <h5 class="mb-15">Bạn cần cử 1 nhân viên xuống hiện trường xem xét</h5>
                                                                                            <!-- Row -->
                                                                                            <div class="row">
                                                                                                <c:forEach items="${employeeList}" var="employee">
                                                                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                                                        <div class="panel panel-success contact-card card-view">
                                                                                                            <div class="panel-heading">
                                                                                                                <div class="pull-left">
                                                                                                                    <div class="pull-left user-img-wrap mr-15">
                                                                                                                        <img class="card-user-img img-circle pull-left" src="${employee.employeeImg}" alt="user"/>
                                                                                                                    </div>
                                                                                                                    <div class="pull-left user-detail-wrap">	
                                                                                                                        <span class="block card-user-name">
                                                                                                                            ${employee.employeeName}
                                                                                                                        </span>
                                                                                                                        <span class="block card-user-desn">
                                                                                                                            Nhân viên
                                                                                                                        </span>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="pull-right">
                                                                                                                    <a class="pull-left inline-block mr-15" href="<%=request.getContextPath()%>/AgreeSaleRequest?estateID=${item.estateId.id}&employeeID=${employee.id}">
                                                                                                                        <i class="glyphicon glyphicon-ok txt-light"></i>
                                                                                                                    </a>
                                                                                                                    <a class="pull-left inline-block mr-15" href="#">
                                                                                                                        <i class="glyphicon glyphicon-user txt-light"></i>
                                                                                                                    </a>
                                                                                                                </div>
                                                                                                                <div class="clearfix"></div>
                                                                                                            </div>
                                                                                                            <div class="panel-wrapper collapse in">
                                                                                                                <div class="panel-body row">
                                                                                                                    <div class="user-others-details pl-15 pr-15">
                                                                                                                        <div class="mb-15">
                                                                                                                            <i class="zmdi zmdi-email-open inline-block mr-10"></i>
                                                                                                                            <span class="inline-block txt-dark">${employee.employeeMail}</span>
                                                                                                                        </div>
                                                                                                                        <div class="mb-15">
                                                                                                                            <i class="zmdi zmdi-smartphone inline-block mr-10"></i>
                                                                                                                            <span class="inline-block txt-dark">${employee.employeePhone}</span>
                                                                                                                        </div>
                                                                                                                        <div class="mb-15">
                                                                                                                            <i class="zmdi zmdi-phone inline-block mr-10"></i>
                                                                                                                            <span class="inline-block txt-dark">${employee.employeePhone}</span>
                                                                                                                        </div>
                                                                                                                        <div>	
                                                                                                                            <i class="glyphicon glyphicon-home inline-block mr-10"></i>
                                                                                                                            <span class="inline-block txt-dark">${employee.employeeAddress}</span>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                    <hr class="light-grey-hr mt-20 mb-20"/>
                                                                                                                    <div class="emp-detail pl-15 pr-15">
                                                                                                                        <div class="mb-5">
                                                                                                                            <span class="inline-block capitalize-font mr-5">Số nhà đang tư vấn:</span>
                                                                                                                            <span class="txt-dark">
                                                                                                                                <c:forEach begin="0" end="${countEstateByEmployeeSize}" items="${countEstateByEmployee}" var="count">
                                                                                                                                    <c:if test="${employee.id == count.key}">
                                                                                                                                        ${count.value}
                                                                                                                                    </c:if>
                                                                                                                                </c:forEach>
                                                                                                                            </span>
                                                                                                                        </div>
                                                                                                                        <div>
                                                                                                                            <span class="inline-block capitalize-font mr-5">Số nhà đã bán được:</span>
                                                                                                                            <span class="txt-dark">
                                                                                                                                <c:forEach begin="0" end="${countEstateSoldByEmployeeSize}" items="${countEstateSoldByEmployee}" var="count2">
                                                                                                                                    <c:if test="${employee.id == count2.key}">
                                                                                                                                        ${count2.value}
                                                                                                                                    </c:if>
                                                                                                                                </c:forEach>
                                                                                                                            </span>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>	
                                                                                                </c:forEach>
                                                                                            </div>
                                                                                            <!-- Row -->
                                                                                        </div>
                                                                                        <div class="modal-footer">
                                                                                            <button type="button" class="btn btn-danger text-left" data-dismiss="modal">Close</button>
                                                                                        </div>
                                                                                    </div>
                                                                                    <!-- /.modal-content -->
                                                                                </div>
                                                                                <!-- /.modal-dialog -->
                                                                            </div>
                                                                            <!-- /.modal -->
                                                                            <!-- Button trigger modal -->
                                                                        </c:if>
                                                                    </c:if>
                                                                    <c:if test="${item.contractId.status == 'done'}">
                                                                        <span class="label label-success">Hoàn thành</span>
                                                                    </c:if>
                                                                </td>
                                                            </tr>
                                                        </c:if>   
                                                    </c:if>
                                                </c:forEach>
                                            </table>
                                        </div>
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


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
                <p id="wellcomepage" style="display: none">Đây là trang "Danh sách giao dịch"</p>
                <div class="container-fluid pt-25">
                    <!-- Title -->
                    <div class="row heading-bg">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h3 class="txt-dark">Giao dịch</h3>
                        </div>
                        <!-- Breadcrumb -->
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <ol class="breadcrumb">
                                <li><a href="<%=request.getContextPath()%>/Director">Admin</a></li>
                                <li><a href="<%=request.getContextPath()%>/DashboardDirector">Danh sách giao dịch</a></li>
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
                                                                        <a href="#" class="weight-500 uppercase-font txt-light block font-13">
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
                                                                        <span class="weight-500 uppercase-font txt-light block"> nhà-đất chờ duyệt</span>
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
                                                <c:forEach items="${contractDetails}" var="item">
                                                    <tr>
                                                        <td>${item.contractId.customerId.customerName}</td>
                                                        <td>${item.contractId.employeeId.employeeName}</td>
                                                        <td>${item.estateId.address2}</td>
                                                        <c:if test="${item.estateId.estateStatusId.id== 2 || item.estateId.estateStatusId.id==5}">
                                                            <td>${item.estateId.price/1000000000} Tỷ VND</td>
                                                        </c:if>
                                                        <c:if test="${item.estateId.estateStatusId.id== 1 || item.estateId.estateStatusId.id==4}">
                                                            <td>${item.estateId.price/1000000} Triệu VND</td>
                                                        </c:if>
                                                        
                                                        <td>
                                                            <c:if test="${item.estateId.assignDetails == null}">
                                                                <c:if test="${item.contractId.status == 'waitting for employee'}">
                                                                    <a data-toggle="modal" data-target=".bs-example-modal-lg" class="label label-danger">Khách muốn bán</a>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${item.estateId.assignDetails != null}">
                                                                <c:if test="${item.contractId.status == 'waitting for employee'}">
                                                                    <a href="<%=request.getContextPath()%>/EstateEdit?estateID=${item.estateId.id}"  class="label label-danger">Đang chờ nhân viên khảo sát</a>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${item.contractId.status == 'waitting to transaction'}">
                                                                <a data-toggle="modal" data-target="#${item.estateId.id}" class="label label-danger">Đang chờ nhân viên tư vấn</a>
                                                                <!-- sample modal content -->
                                                                <div id="${item.estateId.id}" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                                                    <div class="modal-dialog modal-lg">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                                                <h5 class="modal-title" id="myLargeModalLabel">Chọn nhân viên</h5>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h5 class="mb-15">Thông tin hẹn tư vấn</h5>
                                                                                <div class="row">
                                                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                                                        <div class="panel panel-default border-panel card-view">
                                                                                            <div class="panel-heading">
                                                                                                <div class="pull-left">
                                                                                                    <h6 class="panel-title txt-dark">Thông tin bất động sản</h6>
                                                                                                </div>
                                                                                                <div class="clearfix"></div>
                                                                                            </div>
                                                                                            <div class="panel-wrapper collapse in">
                                                                                                <div class="panel-body">
                                                                                                    <div class="mb-5">
                                                                                                        <img width="200px" height="100px" src="${item.estateId.image1st}" alt="hinhanhbatdongsan">
                                                                                                    </div> 
                                                                                                    <div class="mb-5">
                                                                                                        <span class="inline-block capitalize-font mr-5">Mã: </span>
                                                                                                        <span class="txt-dark">${item.estateId.address1} - ${item.estateId.id}</span>
                                                                                                    </div> 
                                                                                                    <div class="mb-5">
                                                                                                        <span class="inline-block capitalize-font mr-5">Tình trạng: </span>
                                                                                                        <span class="txt-dark">Sẵn sàng giao dịch</span>
                                                                                                    </div> 
                                                                                                    <div class="mb-5">
                                                                                                        <span class="inline-block capitalize-font mr-5">Địa chỉ bất động sản: </span>
                                                                                                        <span class="txt-dark">${item.estateId.address1} - ${item.estateId.address2}</span>
                                                                                                    </div> 
                                                                                                    <div class="mb-5">
                                                                                                        <span class="inline-block capitalize-font mr-5">Giá niêm yết: </span>
                                                                                                        <span class="txt-dark">${item.estateId.price}</span>
                                                                                                    </div>
                                                                                                    <div class="mb-5">
                                                                                                        <a href="<%=request.getContextPath()%>/EstateDetails?estateID=${item.estateId.id}" target="_blank" class="btn btn-default">Chi tiết</a>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                                                        <div class="panel panel-default border-panel card-view">
                                                                                            <div class="panel-heading">
                                                                                                <div class="pull-left">
                                                                                                    <h6 class="panel-title txt-dark">Thông tin khách hàng</h6>
                                                                                                </div>
                                                                                                <div class="clearfix"></div>
                                                                                            </div>
                                                                                            <div class="panel-wrapper collapse in">
                                                                                                <div class="panel-body">
                                                                                                    <div class="mb-5">
                                                                                                        <img width="100px" height="100px" src="${item.contractId.customerId.customerImg}" alt="hinhanhkhach">
                                                                                                    </div>
                                                                                                    <div class="mb-5">
                                                                                                        <span class="inline-block capitalize-font mr-5">Khách: </span>
                                                                                                        <span class="txt-dark">${item.contractId.customerId.customerName}</span>
                                                                                                    </div>
                                                                                                    <div class="mb-5">
                                                                                                        <span class="inline-block capitalize-font mr-5">Điện thoại: </span>
                                                                                                        <span class="txt-dark">${item.contractId.customerId.phone}</span>
                                                                                                    </div>
                                                                                                    <div class="mb-5">
                                                                                                        <span class="inline-block capitalize-font mr-5">Email: </span>
                                                                                                        <span class="txt-dark">${item.contractId.customerId.mail}</span>
                                                                                                    </div>
                                                                                                    <div class="mb-5">
                                                                                                        <span class="inline-block capitalize-font mr-5">Địa chỉ: </span>
                                                                                                        <span class="txt-dark">${item.contractId.customerId.customerAddress}</span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <form action="<%=request.getContextPath()%>/CreateContract" method="POST" class="text-right">
                                                                                    <input type="hidden" name="money" value="${item.estateId.price}">
                                                                                    <input type="hidden" name="price" value="${item.estateId.price}">
                                                                                    <input type="hidden" name="customer" value="${item.contractId.customerId.id}">
                                                                                    <input type="hidden" name="contract" value="${item.contractId.id}">
                                                                                    <button type="submit" class="btn btn-success text-right">Hợp đồng-giao dịch thành công</button>
                                                                                    <button type="button" class="btn btn-danger text-left" data-dismiss="modal">Đóng</button>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                        <!-- /.modal-content -->
                                                                    </div>
                                                                    <!-- /.modal-dialog -->
                                                                </div>
                                                                <!-- /.modal -->
                                                                <!-- Button trigger modal -->
                                                            </c:if>
                                                            <c:if test="${item.contractId.status == 'done'}">
                                                                <span class="label label-success">Hoàn thành</span>
                                                            </c:if>
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


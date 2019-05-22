<%-- 
    Document   : index
    Created on : Apr 22, 2019, 10:33:15 PM
    Author     : Cuong
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
            <%@ include file="/admin/page/template/manager/left_sidebar.jsp" %>
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

                                <div class="widget__content" id="section-2" style="display: block;">

                                    <div class="info__about">
                                        <h4 class="info__about-title">
                                            Chi tiết hợp đồng
                                        </h4>

                                        <label  class="control-label">Dự Án </label>
                                        <select onchange=" getAddress()" name="cbmName" id="cbmName" class="form-control">
                                            <c:forEach items="${listProject}" var="list">
                                                <option value="${list.projectId}">${list.projectName}</option>
                                            </c:forEach>
                                        </select>
                                        <label  class="control-label">Địa Chỉ </label>
                                        <input type="text" readonly="true" id="txtAddress" class="form-control" />
                                        <input type="hidden" id="txtIDProject" name="txtIDProject" />
                                        <label  class="control-label">Từ </label><span id="errdateFrom" style="color: red"></span><input class="form-control" onchange="checkDateFrom()" type="date" name="txtdateFrom" id="dateFrom" />
                                        <label  class="control-label"> Đến</label> <span id="errdateTo" style="color: red"></span><input class="form-control" onchange="checkDateTo()" type="date" name="txtdateTo" id="dateTo" />

                                        <button onclick="getTable()"  class="form__submit">Xem</button>
                                        <button onclick="printDiv('section-to-print')" class="form__submit">In</button>

                                        <div id="section-to-print" class="maincontent textview">

                                            <h3 align="center"><strong>Báo Cáo Dự Án</strong><br>
                                                <span id="dateShow"></span>
                                            </h3>

                                            <div class="panel-wrapper collapse in">
                                                <table>
                                                    <tr>
                                                        <td>SGEstate24h</td>
                                                        <td id="tdNameProject"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>17/5 CMT8, Phường 3, Quận 10, Tp. Hồ Chí Minh</td>
                                                        <td id="tdAddress"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>+1 202 555 0135</td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>SGEstate24h@gmail.com</td>
                                                        <td ></td>
                                                    </tr>
                                                </table>
                                                <div class="panel-body">
                                                    <div class="table-wrap">
                                                        <div class="table-responsive">
                                                            <table class="table table-hover display  pb-30" >
                                                                <thead>
                                                                    <tr>
                                                                        <td>Mã Căn Hộ</td>
                                                                        <td>Block</td>
                                                                        <td>Diện Tích</td>
                                                                        <td>Tầng</td>
                                                                        <td>Ngày Bán</td>
                                                                        <td>Giá</td>

                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tableEstate">

                                                                </tbody>
                                                            </table>
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
            window.onload=function (){
                getAddress();
            }
            function getAddress() {
                var cbmName = document.getElementById('cbmName').value;
                var txtAddress = document.getElementById('txtAddress');
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        txtAddress.value = this.responseText;
                        var a = document.getElementById('cbmName');
                        document.getElementById('tdNameProject').innerHTML = a.options[a.selectedIndex].text;
                        document.getElementById('tdAddress').innerHTML = this.responseText;
                        return true;
                    } else
                        return false;
                };
                xhttp.open("POST", "Report?idProject=" + cbmName, true);
                xhttp.send();
            }
            function checkDateFrom() {
                var dateFrom = document.getElementById('dateFrom').value;
                if (dateFrom == null || dateFrom == '') {
                    document.getElementById('errdateFrom').innerHTML = 'Mời Bạn Chọn Ngày Bắt Đầu ';
                    return false;
                } else {
                    document.getElementById('errdateFrom').innerHTML = '';
                    return true;
                }
            }
            function checkDateTo() {
                var dateTo = document.getElementById('dateTo').value;
                var dateFrom = document.getElementById('dateFrom').value;
                if (dateTo == null || dateTo == '') {
                    document.getElementById('errdateTo').innerHTML = 'Mời Bạn Chọn Ngày Kết Thúc';
                    return false;
                } else {
                    if (dateTo >= dateFrom) {
                        document.getElementById('errdateTo').innerHTML = '';
                        document.getElementById('dateShow').innerHTML = '(' + dateTo + '-' + dateFrom + ')';
                        return true;
                    }
                    else {
                        document.getElementById('errdateTo').innerHTML = 'Chọn Ngày Kết Thúc Không Đúng';
                        return false;
                    }
                }
            }
            function getTable() {
                var cbmName = document.getElementById('cbmName').value;
                var dateTo = document.getElementById('dateTo').value;
                var dateFrom = document.getElementById('dateFrom').value;
                var xhttp = new XMLHttpRequest();
                if (getAddress() && checkDateFrom() && checkDateTo()) {
    
}
                getAddress();
                checkDateFrom();
                checkDateTo();
                
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        console.log('table ' + this.responseText);
                        document.getElementById('tableEstate').innerHTML = this.responseText;
                    }
                };
                xhttp.open("POST", "ReportRatingProject?idProject=" + cbmName + "&dateFrom=" + dateFrom + "&dateTo=" + dateTo, true);
                xhttp.send();
            }
        </script>

        <script>
            function printDiv(divName) {
                var printContents = document.getElementById(divName).innerHTML;
                var originalContents = document.body.innerHTML;
                document.body.innerHTML = printContents;
                window.print();
                document.body.innerHTML = originalContents;
            }
        </script>
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
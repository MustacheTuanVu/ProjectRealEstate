<%-- 
    Document   : index
    Created on : Mar 30, 2019, 11:19:33 AM
    Author     : kiems
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script type="text/javascript" src="<%=request.getContextPath()%>/ckfinder/ckfinder.js"></script>
        <script type="text/javascript">
            function BrowseServer1() {
                var finder = new CKFinder();
                finder.basePath = '../';
                finder.selectActionFunction = SetFileField1;
                finder.popup();
            }
            function SetFileField1(fileUrl) {
                document.getElementById('image1st').value = fileUrl;
                document.getElementById('imageup1st').src = fileUrl;
            }
        </script>

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
                                        <form onsubmit="return KiemTraBatBuoc()" action="<%=request.getContextPath()%>/CreateUser" class="form form--flex form--property form--basic js-form-property-1">
                                            <div class="col-md-12">
                                                <div class="col-md-6 mb-10">
                                                    <img src="<%=request.getContextPath()%>/CKFinderJava/userfiles/files/01.jpg" onclick="BrowseServer1()" id="imageup1st" alt="avatar" width="208" height="208">
                                                    <input type="hidden" id="image1st" name="txtImg"/>
                                                </div>
                                                <div class="col-md-6 mb-10">
                                                    <div class="panel panel-danger card-view" style="display: none${displayError}">
                                                        <div class="panel-heading">
                                                            <div class="pull-left">
                                                                <h6 class="panel-title txt-light">Thêm vào bị lỗi</h6>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                        <div class="panel-wrapper collapse in">
                                                            <div class="panel-body">
                                                                <p>${duplicate}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="nameForm" class="col-md-6 mb-10">
                                                <div class="form-group">
                                                    <label class="control-label mb-10">Họ & Tên</label>
                                                    <!--<input required type="text" name="fullName" class="form-control">-->
                                                    <input  id="in-2" required name="txtName" class="form-control">
                                                    <span id="tb-hoten" class="help-block"></span>
                                                </div>

                                            </div>
                                            <div class="col-md-6 mb-10">
                                                <div class="form-group">
                                                    <label class="control-label mb-10">Vị trí</label>
                                                    <select id="in-5" name="userRole"  required class="form-control js-in-select">
                                                        <option value="employee">Nhân viên tư vấn</option>
                                                        <option value="manager">Nhân viên quản lý</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-10">
                                                <div class="form-group">
                                                    <label for="in-3" class="control-label mb-10 text-left">Chứng Minh Nhân Dân</label>
                                                    <input id="in-3" value="${customer.employeeIndentityCard}" required name="txtCard" class="form-control">
                                                    <span id="tb-cmnd"></span>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-10">
                                                <div class="form-group">
                                                    <label for="in-4" class="control-label mb-10 text-left">Địa Chỉ</label>
                                                    <input id="in-4" required name="txtAddress"  class="form-control">
                                                    <span id="tb-diachi"></span>
                                                    <!-- end of block .form-property__control-->
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-10">
                                                <div class="form-group">
                                                    <label for="in-11" class="control-label mb-10 text-left">Điện Thoại</label>
                                                    <input id="in-11" name="txtPhone" type="tel" required class="form-control">
                                                    <span id="tb-dienthoai"></span>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-10">
                                                <div class="form-group">
                                                    <label for="in-12" class="control-label mb-10 text-left">Email</label>
                                                    <input id="in-12" name="txtMail" type="email" required class="form-control">
                                                    <span id="tb-email"></span>
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-10">
                                                <button type="submit" name="submit" value="submit" class="btn btn-primary">Tạo</button>
                                            </div>
                                        </form>
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

        <script type="text/javascript">
                                                        var TB_SPACE = "Vui lòng nhập vào kí tự";
                                                        var TB_KITU = "Vui lòng nhập số kí tự trong khoảng";
                                                        var TB_SO = "Vui lòng kiểm tra số điện thoại";
                                                        var TB_Email = "Vui lòng kiểm tra lại email";
                                                        function KiemTraSoKiTu(idTextBox, idThongBao, minLength,
                                                                maxLength, thongBao) {
                                                            //alert('OK2'); 
                                                            // var giaTri = $(idTextBox).val();
                                                            var giaTri = document.getElementById(idTextBox).value;
                                                            var tag = document.getElementById(idThongBao);
                                                            if (giaTri.length < minLength || giaTri.length > maxLength) {
                                                                tag.style.display = "block";
                                                                tag.innerHTML = thongBao + " " + minLength + "> " + maxLength;
                                                                return false;
                                                            } else {
                                                                tag.style.display = "none";
                                                                return true;
                                                            }
                                                        }
                                                        function KiemTraSoDienThoai(idTextBox, idThongBao, thongBao) {
                                                            var giaTri = document.getElementById(idTextBox).value;
                                                            var tag = document.getElementById(idThongBao);
                                                            var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
                                                            if (vnf_regex.test(giaTri)) {
                                                                tag.style.display = "none";
                                                                return true;
                                                            } else {
                                                                tag.style.display = "block";
                                                                tag.innerHTML = thongBao;
                                                                return false;
                                                            }
                                                        }
                                                        function KiemTraEmail(idTextBox, idThongBao, thongBao) {
                                                            var patt = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                                                            var giaTri = $('#' + idTextBox).val();
                                                            console.log(giaTri);
                                                            var tag = document.getElementById(idThongBao);
                                                            if (patt.test(giaTri)) {
                                                                tag.style.display = "none";
                                                                return true;
                                                            } else {
                                                                tag.style.display = "block";
                                                                tag.innerHTML = thongBao;
                                                                return false;
                                                            }
                                                        }
                                                        function KiemTraBatBuoc() {
                                                            if (KiemTraSoKiTu('in-2', 'tb-hoten', 5, 20, TB_KITU)
                                                                    && KiemTraSoKiTu('in-4', 'tb-diachi', 20, 100, TB_KITU)
                                                                    && KiemTraSoDienThoai('in-11', 'tb-dienthoai', TB_SO)
                                                                    && KiemTraEmail('in-12', 'tb-email', TB_Email)) {
                                                                return true;
                                                            } else {
                                                                return false;
                                                            }
                                                        }
//            $('#btnLuu').click(function(){{
//                 KiemTraSoKiTu('in-2', 'tb-hoten', 5, 15, TB_SPACE);
//                 alert('OK');
//            })
                                                        //document.getElementById("btnLuu").addEventListener("click",function(){
                                                        //alert('OK');
                                                        //KiemTraSoKiTu('in-2', 'tb-hoten', 5, 15, TB_SPACE);
                                                        //});
        </script>
    </body>

</html>


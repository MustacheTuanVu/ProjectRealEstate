<%-- 
    Document   : project_list
    Created on : Apr 23, 2019, 11:16:28 AM
    Author     : Cuong
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

        <!-- cuong add
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0, shrink-to-fit=no">
        <meta name="format-detection" content="telephone=no">
        <!-- Loading Source Sans Pro font that is used in this theme-->
        <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700%7cSource+Sans+Pro:200,400,600,700,900,400italic,700italic&amp;subset=latin,latin-ext" rel="stylesheet" type="text/css">
        <!-- Boostrap and other lib styles-->
        <!-- build:cssvendor-->
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
                                        <form onsubmit="return checkForm()"  action="<%=request.getContextPath()%>/EstateAutoCreate1" >
                                            <div  style="display: ${getBlock}">
                                                <label for="in-1" class="control-label">Số Block</label>
                                                <div>
                                                    <select id="cbmBlock" onchange="getValueComboBox()"  class="form-control" >
                                                    </select>
                                                </div>
                                                <input type="hidden" id="txtCbm" name="numberBlock1" value="20" />
                                                <label for="in-1" class="control-label">Tên Block</label> &nbsp;<span style="color: red" >*</span>&nbsp; &nbsp;<span id="errBlockName" style="color: red" ></span>
                                                <input type="hidden"  name="projectID" value="${projectID}">
                                                <input id="in-1"  onkeyup="return checkBlockName()"    type="text" name="block" data-placeholder="---" class="form-control">
                                                <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                    <div class="parsley-required"></div>
                                                </div>


                                                <label for="in-2" class="control-label">Số Căn Hộ Của Từng Tầng</label>&nbsp;<span style="color: red" >*</span>&nbsp; &nbsp;<span id="errFloor" style="color: red" ></span>
                                                <input id="in-2"  type="number" onkeyup="return checkFloor()" name="estateNumber" data-placeholder="---" class="form-control">
                                                <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                    <div class="parsley-required">${message}</div>
                                                </div>
                                            </div>

                                            <div >
                                                <button  type="submit" name="getBlock" value="yes" class="form__submit">Xác Nhận</button>
                                            </div>
                                        </form>  
                                    </div>

                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="widget js-widget widget--details">
                                <div class="widget__header">
                                    <h2 class="widget__title">Thông số kỹ thuật dự án & Thông số kỹ thuật đơn vị</h2>
                                </div>
                                <div class="widget__content">
                                    <div class="datatable datatable--property">
                                        <div class="datatable__wrap">
                                            <table class="js-property-table datatable__table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <td class="datatable__head-1">Căn Hộ</td>
                                                        <td class="datatable__head-2 datatable__head-sort">Block</td>

                                                        <td class="datatable__head-3 datatable__head-sort">Tầng</td>
                                                        <td class="datatable__head-4 datatable__head-sort">Diện tích(M<sup>2</sup>)</td>
                                                        <td class="datatable__head-5 datatable__head-sort">Phòng ngủ</td>
                                                        <td class="datatable__head-6 datatable__head-sort">Phòng tắm</td>
                                                        <td class="datatable__head-7 datatable__head-sort">Giá (VNĐ)</td>
                                                        <td class="datatable__head-8 datatable__head-sort">Trạng thái</td>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${estateList}" var="item">
                                                        <tr <c:if test="${item.estateStatus=='project'}">onclick="myFunction(${item.id})"</c:if>

                                                            <c:if test="${item.estateStatus!='project'}">style="background: #cccccc !important"</c:if>>

                                                                <td class="datatable__cell datatable__cell--5">${item.id}</td>
                                                            <td class="datatable__cell datatable__cell--5">${item.block}</td>
                                                            <td class="datatable__cell datatable__cell--5">${item.floor}</td>
                                                            <td class="datatable__cell datatable__cell--5">${item.areas}</td>
                                                            <td class="datatable__cell datatable__cell--5">${item.bedRoom}</td>
                                                            <td class="datatable__cell datatable__cell--5">${item.bathRoom}</td>
                                                            <td class="datatable__cell datatable__cell--5">${item.price}</td>
                                                            <td class="datatable__cell datatable__cell--5">
                                                                <c:if test="${item.estateStatus=='project'}">
                                                                    Đang Mở Bán
                                                                </c:if>
                                                                <c:if test="${item.estateStatus=='Saled'}">
                                                                    Đã Bán
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    <div id="${item.id}" tabindex="-1" role="dialog" class="modal fade">
                                                        <div role="document" class="modal-dialog modal-md">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="widget js-widget widget--dashboard">
                                                                        <div class="widget__header">

                                                                            <h2 class="widget__title">Chi tiết bất động sản</h2>

                                                                        </div>
                                                                        <div class="widget__content">
                                                                            <!-- BEGIN SECTION ACTIVITY-->
                                                                            <section class="activity activity--feed">
                                                                                <ul class="activity__list">

                                                                                    <li class="activity__date">Số bất động sản ${item.id}</li>

                                                                                    <li class="activity__item">
                                                                                        <div class="activity__title">
                                                                                            <a>Block: </a>${item.block}
                                                                                        </div>
                                                                                    </li>
                                                                                    <li class="activity__item">
                                                                                        <div class="activity__title">

                                                                                            <a>Số tầng: </a>${item.floor}

                                                                                        </div>
                                                                                    </li>
                                                                                    <li class="activity__item">
                                                                                        <div class="activity__title">

                                                                                            <a>Diện tích </a>${item.areas}

                                                                                        </div>
                                                                                    </li>
                                                                                    <li class="activity__item">
                                                                                        <div class="activity__title">

                                                                                            <a>Phòng ngủ </a>${item.bedRoom}

                                                                                        </div>
                                                                                    </li>
                                                                                    <li class="activity__item">
                                                                                        <div class="activity__title">

                                                                                            <a>Phòng tắm </a>${item.bathRoom}

                                                                                        </div>
                                                                                    </li>
                                                                                    <li class="activity__item">
                                                                                        <div class="activity__title">

                                                                                            <a>Giá  </a>${item.price}

                                                                                        </div>
                                                                                    </li>
                                                                                    <li class="activity__item">
                                                                                        <div class="activity__title">

                                                                                            <a>Trạng thái: </a>${item.estateStatus}


                                                                                        </div>
                                                                                    </li>
                                                                                </ul>
                                                                                <div class="widget__footer">
                                                                                    <a href="<%=request.getContextPath()%>/EstateDetails?estateID=${item.id}" class="widget__more">

                                                                                        Yêu cầu mua

                                                                                    </a>
                                                                                </div>
                                                                            </section>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
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
        <!--cuong add -->
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?libraries=places,drawing,geometry"></script>
        <script type="text/javascript" src="http://cdn.ckeditor.com/4.5.6/standard/ckeditor.js"></script>
        <!--
        Contains vendor libraries (Bootstrap3, Jquery, Chosen, etc) already compiled into a single file, with
        versions that are verified to work with our theme. Normally, you should not edit that file.
        -->
        <!-- build:jsvendor-->
        <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/vendor.js"></script>
        <!-- endbuild-->
        <!--
        This file is used for demonstration purposes and contains example property items, that are mostly used to
        render markers on the map. You can safely delete this file, after you've adapted the demo.js code
        to use your own data.
        -->
        <!-- build:jsdemodata-->
        <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/demodata.js"></script>
        <!-- endbuild-->
        <!--
        The library code that Realtyspace theme relies on, in order to function properly.
        Normally, you should not edit this file or add your own code there.
        -->
        <!-- build:jsapp-->
        <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/app.js"></script>
        <!-- endbuild-->
        <!--
        the main file, that you should modify. It contains lots of examples of
        plugin usage, with detailed comments about specific sections of the code.
        -->
        <!-- build:jsdemo-->
        <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/demo.js"></script>
        <!-- endbuild--><!-- inject:ga  -->
        <!-- endinject -->


        <!-- JavaScript -->
        <script>
            function getValueComboBox(){
                var cbmBlock=document.getElementById('cbmBlock').value;
                document.getElementById('txtCbm').value=cbmBlock;
               
  
    }
                                                            function checkForm() {
                                                                var errFloor = document.getElementById('errFloor');
                                                                var floorNum = document.getElementById('in-2').value;
                                                                
                                                                var blockName = document.getElementById('in-1').value;
                                                                var errBlockName=document.getElementById("errBlockName");
                                                                
                                                                if (floorNum.length == '') {
                                                                    errFloor.innerHTML = 'Mời Bạn Nhập Số Tầng !!!';
                                                                    
                                                                } 
                                                                if (blockName.length == '') {
                                                                    errBlockName.innerHTML = 'Mời Bạn Tên Block !!!';
                                                                    return false;
                                                                } else{
                                                                    return true;
                                                                }
                                                            }
                                                            ;
                                                            function checkFloor() {
                                                                var errFloor = document.getElementById('errFloor');
                                                                var floorNum = document.getElementById('in-2').value;
                                                                
                                                                if (floorNum < 1 || floorNum >= 20) {
                                                                    errFloor.innerHTML = 'Số Tầng Từ 1 Đến 20 !!!';
                                                                    return false;
                                                                } else
                                                                    errFloor.innerHTML = '';
                                                                return true;
                                                                {
                                                                }
                                                            }
                                                            ;
                                                            function checkBlockName() {
                                                                var blockName = document.getElementById('in-1').value;
                                                                blockName = blockName.replace(/\s+/g, "");
                                                                document.getElementById('in-1').value = blockName;
                                                                var xhttp = new XMLHttpRequest();
                                                                xhttp.onreadystatechange = function () {
                                                                    if (this.readyState == 4 && this.status == 200) {
                                                                        if (this.responseText == 1) {
                                                                            document.getElementById("errBlockName").innerHTML = 'Tên Block Đã Tồn Tại !!!';
                                                                            return false;
                                                                        } else
                                                                        if (blockName.length > 2 || blockName.length == 0) {
                                                                            document.getElementById("errBlockName").innerHTML = 'Tên Block 1 Đến 2 Ký Tự !!!';
                                                                            return false;
                                                                        } else {
                                                                            document.getElementById("errBlockName").innerHTML = '';
                                                                            return true;
                                                                        }
                                                                    }
                                                                };
                                                                xhttp.open("POST", "EstateAutoCreate1?blockName=" + blockName, true);
                                                                xhttp.send();
                                                            }
                                                            ;
                                                            window.onload = (function () {
                                                                
                                                                var xhttp = new XMLHttpRequest();
                                                                xhttp.onreadystatechange = function () {
                                                                    if (this.readyState == 4 && this.status == 200) {
                                                                        document.getElementById("cbmBlock").innerHTML = this.responseText;
                                                                        getValueComboBox();
                                                                    }
                                                                };
                                                                xhttp.open("POST", "EstateAutoCreate1", true);
                                                                xhttp.send();
                                                            });</script>
        <!-- jQuery -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/jquery/dist/jquery.min.js"></script>

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
                                                            $(window).on('load', function () {
                                                                $('#modal').modal('${modal}');
                                                                $('#modalEdit').modal('${modalEdit}');
                                                            });
        </script>

    </body>

</html>



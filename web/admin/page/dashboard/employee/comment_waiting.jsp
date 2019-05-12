<%-- 
    Document   : index
    Created on : Mar 30, 2019, 11:19:33 AM
    Author     : kiems
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
                            <h3 class="txt-dark">Quản Lý Comment</h3>
                        </div>
                        <!-- Breadcrumb -->
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <ol class="breadcrumb">
                                <li><a href="<%=request.getContextPath()%>/Director">Admin</a></li>
                                <li><a href="<%=request.getContextPath()%>/ListCommentWait">Danh sách Comment</a></li>
                            </ol>
                        </div>
                        <!-- /Breadcrumb -->
                    </div>
                    <!-- /Title -->

                    <!-- Row -->

                    <!-- /Row -->

                    <!-- Row -->
                    <div class="row">
                        <div class="panel panel-default card-view">
                            <div class="panel-heading">
                                <div class="pull-left">
                                    <h3 class="txt-dark">
                                        Danh sách Comment Chờ Duyệt: <input onclick="deleteCommnet(this)" type="button" value="Xóa" id="btnXoa"/> <input onclick="deleteCommnet(this)" value="Duyệt" type="button" id="btnDuyet"/>
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
                                                        <th></th>
                                                        <th>Người Dùng</th>
                                                        <th>Nội Dung</th>
                                                        <th>Loại </th>

                                                        <th>Ngày Bình Luận</th>
                                                    </tr>
                                                </thead>

                                                <c:forEach items="${listCommet}" var="item">
                                                    <tr>
                                                        <td>
                                                            <input type="checkbox" id="ckbCommnet" name="ckbCommnet" value="${item.idComment}" />

                                                        </td>
                                                        <c:if test="${item.roleComment=='guest'}">
                                                            <td>${item.emailComment}</td>
                                                        </c:if>
                                                        <c:if test="${item.roleComment=='customer'}">
                                                            <td>${item.idUser.customer.customerName}</td>
                                                        </c:if>
                                                        <td><textarea readonly="true" rows="5" cols="40">${item.content}</textarea>
                                                        </td>
                                                        <td> Bình Luận</td>

                                                        <td>
                                                            <fmt:formatDate pattern="dd-MM-yyyy" value="${item.dateComment}" var="day"/>
                                                            ${day}
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:forEach items="${listReply}" var="item">
                                                    <tr>
                                                        <td>
                                                            <input type="checkbox" id="ckbReply" name="ckbReply" value="${item.idReply}" />
                                                        </td>
                                                        <c:if test="${item.roleReply=='guest'}">
                                                            <td>${item.emailReply}</td>
                                                        </c:if>
                                                        <c:if test="${item.roleReply=='customer'}">
                                                            <td>${item.idUser.customer.customerName}</td>
                                                        </c:if>
                                                            <td><textarea readonly="true" rows="5" cols="40">${item.content}</textarea>
                                                        </td>
                                                        <td> Trả Lời Bình Luận</td>

                                                        <td>
                                                            <fmt:formatDate pattern="dd-MM-yyyy" value="${item.dateReply}" var="day"/>
                                                            ${day}
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

        <script>
                                            function deleteCommnet(action) {
                                                var action1 = action.value
                                                var comment = document.getElementsByName('ckbCommnet');
                                                var reply = document.getElementsByName('ckbReply');
                                                var dem = 0;
                                                var a = null;
                                                var b = null;
                                                var listComment = new Array();
                                                for (var i = 0; i < comment.length; i++) {
                                                    if (comment[i].checked === true) {
                                                        listComment[i] = comment[i].value;
                                                        dem++;
                                                    }
                                                }
                                                var listReply = new Array();
                                                for (var i = 0; i < reply.length; i++) {
                                                    if (reply[i].checked === true) {
                                                        listReply[i] = reply[i].value;
                                                        dem++;
                                                    }
                                                }
                                                if (dem === 0) {
                                                    alert('Bạn Chưa Chọn !!!');
                                                    return;
                                                }
                                                if (action1 === ('Xóa')) {
                                                    a = confirm('Bạn Muốn Xóa ' + dem + ' Bình Luận !!!');
                                                    b = 'Xóa Thành Công !!!';
                                                }
                                                else {
                                                    action1 = 'Duyet';
                                                    a = confirm('Bạn Muốn Duyệt ' + dem + ' Bình Luận !!!');
                                                    b = 'Duyệt Thành Công !!!';
                                                }
                                                if (a == true) {
                                                    var xhttp = new XMLHttpRequest();
                                                    xhttp.onreadystatechange = function () {
                                                        if (this.readyState == 4 && this.status == 200) {
                                                            //document.getElementById("demo").innerHTML = this.responseText;
                                                            alert(b);
                                                            window.location.reload();
                                                        }
                                                    };
                                                    xhttp.open("POST", "CommentAction?action=" + action1 + "&Comment=" + listComment + "&Reply=" + listReply, true);
                                                    xhttp.send();
                                                }
                                            }
        </script>
    </body>
</html>


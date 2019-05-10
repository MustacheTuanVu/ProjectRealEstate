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
        <script type="text/javascript" src="<%=request.getContextPath()%>/ckfinder/ckfinder.js"></script>
        <script type="text/javascript">
            function BrowseServer() {
                var finder = new CKFinder();
                finder.basePath = '../';
                finder.selectActionFunction = SetFileField;
                finder.popup();
            }
            function SetFileField(fileUrl) {
                var countimage = 0;
                if (document.getElementById('imageup1st').src === "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg") {
                    document.getElementById('image1st').value = fileUrl;
                    document.getElementById('imageup1st').src = fileUrl;
                    document.getElementById('countimage').innerHTML = "Estate have 1/5 photo";
                } else if (document.getElementById('imageup2st').src === "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg") {
                    document.getElementById('image2st').value = fileUrl;
                    document.getElementById('imageup2st').src = fileUrl;
                    document.getElementById('countimage').innerHTML = "Estate have 2/5 photo";
                } else if (document.getElementById('imageup3st').src === "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg") {
                    document.getElementById('image3st').value = fileUrl;
                    document.getElementById('imageup3st').src = fileUrl;
                    document.getElementById('countimage').innerHTML = "Estate have 3/5 photo";
                } else if (document.getElementById('imageup4st').src === "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg") {
                    document.getElementById('image4st').value = fileUrl;
                    document.getElementById('imageup4st').src = fileUrl;
                    document.getElementById('countimage').innerHTML = "Estate have 4/5 photo";
                } else if (document.getElementById('imageup5st').src === "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg") {
                    document.getElementById('image5st').value = fileUrl;
                    document.getElementById('imageup5st').src = fileUrl;
                    document.getElementById('countimage').innerHTML = "Estate have 5/5 photo";
                }
            }
        </script>
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
        <script type="text/javascript">
            function BrowseServer2() {
                var finder = new CKFinder();
                finder.basePath = '../';
                finder.selectActionFunction = SetFileField2;
                finder.popup();
            }
            function SetFileField2(fileUrl) {
                document.getElementById('image2st').value = fileUrl;
                document.getElementById('imageup2st').src = fileUrl;
            }
        </script>
        <script type="text/javascript">
            function BrowseServer3() {
                var finder = new CKFinder();
                finder.basePath = '../';
                finder.selectActionFunction = SetFileField3;
                finder.popup();
            }
            function SetFileField3(fileUrl) {
                document.getElementById('image3st').value = fileUrl;
                document.getElementById('imageup3st').src = fileUrl;
            }
        </script>
        <script type="text/javascript">
            function BrowseServer4() {
                var finder = new CKFinder();
                finder.basePath = '../';
                finder.selectActionFunction = SetFileField4;
                finder.popup();
            }
            function SetFileField4(fileUrl) {
                document.getElementById('image4st').value = fileUrl;
                document.getElementById('imageup4st').src = fileUrl;
            }
        </script>
        <script type="text/javascript">
            function BrowseServer5() {
                var finder = new CKFinder();
                finder.basePath = '../';
                finder.selectActionFunction = SetFileField5;
                finder.popup();
            }
            function SetFileField5(fileUrl) {
                document.getElementById('image5st').value = fileUrl;
                document.getElementById('imageup5st').src = fileUrl;
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
                <p id="wellcomepage" style="display: none">Đây là trang "Danh sách bất động sản"</p>
                <div class="container-fluid pt-25">
                    <!-- Title -->
                    <div class="row heading-bg">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h3 class="txt-dark">ESTATE</h3>
                        </div>
                        <!-- Breadcrumb -->
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <ol class="breadcrumb">
                                <li><a href="<%=request.getContextPath()%>/admin">Employee</a></li>
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
                                                                        <span class="txt-light block counter">
                                                                            <span class="counter-anim">
                                                                                ${countContractWaitSale}
                                                                            </span>
                                                                        </span>
                                                                        <a href="<%=request.getContextPath()%>/EstateList?user=director&filter=waitting to transaction" class="weight-500 uppercase-font txt-light block font-13">
                                                                            Đang đợi giao dịch
                                                                        </a>
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
                                        <a href="<%=request.getContextPath()%>/EstateList?user=director&filter=waitting for employee" >
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
                                                                                Đang đợi nhân viên tư vấn
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
                                        </a>
                                        <a href="<%=request.getContextPath()%>/EstateList?user=director&filter=publish" >
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
                                                                                Đang chờ bán
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
                                        </a>
                                        <a href="<%=request.getContextPath()%>/EstateList?user=director&filter=sold" >
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                <div class="panel panel-default card-view pa-0">
                                                    <div class="panel-wrapper collapse in">
                                                        <div class="panel-body pa-0">
                                                            <div class="sm-data-box bg-blue">
                                                                <div class="container-fluid">
                                                                    <div class="row">
                                                                        <div class="col-xs-6 text-center pl-0 pr-0 data-wrap-left">
                                                                            <span class="txt-light block counter"><span class="counter-anim">${countProjectWait2}</span></span>
                                                                            <span class="weight-500 uppercase-font txt-light block"> 
                                                                                Đã bán
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
                                        </a>
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
                                    <div class="input-group">
                                        <form action="<%=request.getContextPath()%>/EstateList">
                                            <input type="hidden" name="user" value="director">
                                            <input type="text" class="form-control" name="searchInput" placeholder="Nhập Địa Chỉ" style="width: 500px;">
                                            <button type="submit" name="search" value="search" class="btn btn-default">Search</button>
                                        </form>    
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="panel-wrapper collapse in">
                                <div class="panel-body">
                                    <div class="row">
                                        <c:forEach items="${estateList}" var="estate">
                                            <c:if test="${estate.estateStatus != 'project'}">
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
                                                                                <c:if test="${estate.estateStatusId.id == '1'}">
                                                                                    Sẵn sàn để cho thuê
                                                                                </c:if>
                                                                                <c:if test="${estate.estateStatusId.id == '2'}">
                                                                                    Sẵn sàn để bán
                                                                                </c:if>
                                                                            </c:when>
                                                                            <c:when test="${estate.estateStatus == 'project'}">
                                                                                Chung cư
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div class="pull-right">
                                                                <c:if test="${estate.estateStatus == 'publish'}">
                                                                    <a class="pull-left inline-block mr-15" href="<%=request.getContextPath()%>/EstateEdit?estateID=${estate.id}" >
                                                                        <i class="zmdi zmdi-edit txt-light" ></i>
                                                                    </a>
                                                                    <a class="pull-left inline-block mr-15" href="<%=request.getContextPath()%>/EstateArgree?estateID=${estate.id}&choice=remove">
                                                                        <i class="zmdi zmdi-delete txt-light"></i>
                                                                    </a>
                                                                </c:if>

                                                                <!-- cuong add -->
                                                                <!-- start modal-->

                                                                <!-- end modal -->

                                                                <div class="pull-left inline-block dropdown">
                                                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false" role="button"><i class="zmdi zmdi-more-vert txt-light"></i></a>
                                                                    <ul class="dropdown-menu bullet dropdown-menu-right"  role="menu">
                                                                        <li role="presentation">
                                                                            <a href="<%=request.getContextPath()%>/EstateDetails?estateID=${estate.id}" target="_blank" role="menuitem">
                                                                                <i class="icon wb-reply" aria-hidden="true"></i>Xem bài đăng
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
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
                                                                        <span class="txt-dark">${estate.address2}</span>
                                                                    </div>
                                                                    <div>
                                                                        <span class="inline-block capitalize-font mr-5">Giá bán:</span>
                                                                        <c:if test="${estate.estateStatusId.id == '1'}">
                                                                            <span class="txt-dark">${estate.price} triệu VND</span>
                                                                        </c:if>
                                                                        <c:if test="${estate.estateStatusId.id == '2'}">
                                                                            <span class="txt-dark">${estate.price} tỷ VND</span>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>                    
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
        <script>
            function loadCheckBox() {
                var idEstate = document.getElementById("estateID").value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("checkbox").innerHTML = this.responseText;
                    }
                };
                console.log("id " + idEstate);
                xhttp.open("GET", "EstateDetails?idEstate=" + idEstate, true);
                xhttp.send();
            }
        </script>
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


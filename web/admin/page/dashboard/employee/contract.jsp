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
                if (document.getElementById('imageup1st').src === "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg") {
                    document.getElementById('image1st').value = fileUrl;
                    document.getElementById('imageup1st').src = fileUrl;
                    document.getElementById('countimage').innerHTML = "Bạn còn thiếu 4 hình";
                } else if (document.getElementById('imageup2st').src === "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg") {
                    document.getElementById('image2st').value = fileUrl;
                    document.getElementById('imageup2st').src = fileUrl;
                    document.getElementById('countimage').innerHTML = "Bạn còn thiếu 3 hình";
                } else if (document.getElementById('imageup3st').src === "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg") {
                    document.getElementById('image3st').value = fileUrl;
                    document.getElementById('imageup3st').src = fileUrl;
                    document.getElementById('countimage').innerHTML = "Bạn còn thiếu 2 hình";
                } else if (document.getElementById('imageup4st').src === "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg") {
                    document.getElementById('image4st').value = fileUrl;
                    document.getElementById('imageup4st').src = fileUrl;
                    document.getElementById('countimage').innerHTML = "Bạn còn thiếu 1 hình";
                } else if (document.getElementById('imageup5st').src === "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg") {
                    document.getElementById('image5st').value = fileUrl;
                    document.getElementById('imageup5st').src = fileUrl;
                    document.getElementById('countimage').innerHTML = "Bạn đã hoàn thành bước chọn hình, có thể tiếp tục bước kế tiếp";
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
                document.getElementById('countimage').innerHTML = "Bạn còn thiếu 4 hình";

                var actionsBar = document.getElementsByClassName("actions clearfix")[0];
                var part = "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg";
                var imageup1st = document.getElementById('imageup1st');
                var imageup2st = document.getElementById('imageup2st');
                var imageup3st = document.getElementById('imageup3st');
                var imageup4st = document.getElementById('imageup4st');
                var imageup5st = document.getElementById('imageup5st');
                if (imageup1st.src === part || imageup2st === part || imageup3st === part || imageup4st === part || imageup5st) {
                    actionsBar.style.display = "none";
                } else {
                    actionsBar.style.display = "block";
                }
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
                document.getElementById('countimage').innerHTML = "Bạn còn thiếu 3 hình";

                var actionsBar = document.getElementsByClassName("actions clearfix")[0];
                var part = "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg";
                var imageup1st = document.getElementById('imageup1st');
                var imageup2st = document.getElementById('imageup2st');
                var imageup3st = document.getElementById('imageup3st');
                var imageup4st = document.getElementById('imageup4st');
                var imageup5st = document.getElementById('imageup5st');
                if (imageup1st.src === part || imageup2st === part || imageup3st === part || imageup4st === part || imageup5st) {
                    actionsBar.style.display = "none";
                } else {
                    actionsBar.style.display = "block";
                }
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
                document.getElementById('countimage').innerHTML = "Bạn còn thiếu 2 hình";

                var actionsBar = document.getElementsByClassName("actions clearfix")[0];
                var part = "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg";
                var imageup1st = document.getElementById('imageup1st');
                var imageup2st = document.getElementById('imageup2st');
                var imageup3st = document.getElementById('imageup3st');
                var imageup4st = document.getElementById('imageup4st');
                var imageup5st = document.getElementById('imageup5st');
                if (imageup1st.src === part || imageup2st === part || imageup3st === part || imageup4st === part || imageup5st) {
                    actionsBar.style.display = "none";
                } else {
                    actionsBar.style.display = "block";
                }
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
                document.getElementById('countimage').innerHTML = "Bạn còn thiếu 1 hình";

                var actionsBar = document.getElementsByClassName("actions clearfix")[0];
                var part = "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg";
                var imageup1st = document.getElementById('imageup1st');
                var imageup2st = document.getElementById('imageup2st');
                var imageup3st = document.getElementById('imageup3st');
                var imageup4st = document.getElementById('imageup4st');
                var imageup5st = document.getElementById('imageup5st');
                if (imageup1st.src === part || imageup2st === part || imageup3st === part || imageup4st === part || imageup5st) {
                    actionsBar.style.display = "none";
                } else {
                    actionsBar.style.display = "block";
                }
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
                document.getElementById('countimage').innerHTML = "Bạn đã hoàn thành bước chọn hình, có thể tiếp tục bước kế tiếp";

                var actionsBar = document.getElementsByClassName("actions clearfix")[0];
                var part = "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg";
                var imageup1st = document.getElementById('imageup1st');
                var imageup2st = document.getElementById('imageup2st');
                var imageup3st = document.getElementById('imageup3st');
                var imageup4st = document.getElementById('imageup4st');
                var imageup5st = document.getElementById('imageup5st');
                if (imageup1st.src === part || imageup2st === part || imageup3st === part || imageup4st === part || imageup5st) {
                    actionsBar.style.display = "block";
                } else {
                    actionsBar.style.display = "none";
                }
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
                                                        <td>
                                                            <c:if test="${item.estateId.estateStatusId.id == 2 || item.estateId.estateStatusId.id == 5}">
                                                                ${item.estateId.price/1000000000} Tỷ VND
                                                            </c:if>
                                                            <c:if test="${item.estateId.estateStatusId.id == 1 || item.estateId.estateStatusId.id == 4}">
                                                                ${item.estateId.price/1000000} Triệu VND
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <c:if test="${item.estateId.assignDetails == null}">
                                                                <c:if test="${item.contractId.status == 'waitting for employee'}">
                                                                    <a data-toggle="modal" data-target=".bs-example-modal-lg" class="label label-danger">Khách muốn bán</a>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${item.estateId.assignDetails != null}">
                                                                <c:if test="${item.contractId.status == 'waitting for employee'}">
                                                                    <a data-toggle="modal" data-target="#${item.estateId.id}" class="label label-danger" href="" >Đang chờ nhân viên khảo sát</a>
                                                                    <div id="${item.estateId.id}" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                                                        <div class="container-fluid pt-25">

                                                                            <!-- Row -->
                                                                            <div class="row">
                                                                                <div class="col-sm-12">
                                                                                    <div class="panel panel-default card-view">
                                                                                        <div class="panel-heading">
                                                                                            <div class="pull-left">
                                                                                                <h6 class="panel-title txt-dark">Basic Wizard</h6>
                                                                                            </div>
                                                                                            <div class="clearfix"></div>
                                                                                        </div>
                                                                                        <div class="panel-wrapper collapse in">
                                                                                            <div class="panel-body">
                                                                                                <form onsubmit="return checkStep1()" method="POST" action="<%=request.getContextPath()%>/EstateEdit" class="form form--flex form--property form--basic js-form-property-1">
                                                                                                    <div id="example-basic">
                                                                                                        <h3><span class="head-font capitalize-font">Thông tin cơ bản</span></h3>
                                                                                                        <section>
                                                                                                            <div class="row">
                                                                                                                <div class="col-md-6">
                                                                                                                    <div id="estateNameForm" class="form-group">
                                                                                                                        <label class="control-label mb-10">Tiêu đề bán</label>
                                                                                                                        <input type="text" onchange="checkStep1()" id="estateName" value="${item.estateId.estateName}" class="form-control" name="estateName">
                                                                                                                        <input type="hidden" id="estateID" value="${item.estateId.id}" class="form-control" name="estateID">
                                                                                                                        <span id="estateNameMessage" class="help-block" style="display: none"> Tiêu đề cần tối thiểu 5 ký tự, tối đa 27 ký tự. </span>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-6">
                                                                                                                    <div class="form-group">
                                                                                                                        <label class="control-label mb-10">Loại nhà</label>
                                                                                                                        <select class="form-control" name="estateTypeId">
                                                                                                                            <c:forEach items="${estateTypeList}" var="estateTypeList">
                                                                                                                                <option value="${estateTypeList.id}" ${item.estateId.estateTypeId.id==estateTypeList.id ? 'selected':''}>${estateTypeList.typeName}</option>
                                                                                                                            </c:forEach>
                                                                                                                        </select>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-6">
                                                                                                                    <div class="form-group">
                                                                                                                        <label class="control-label mb-10">Số lượng phòng ngủ</label>
                                                                                                                        <select class="form-control" name="bedRoom">
                                                                                                                            <option value="0" ${item.estateId.bedRoom=='0' ? 'selected':''}>0</option>
                                                                                                                            <option value="1" ${item.estateId.bedRoom=='1' ? 'selected':''}>1</option>
                                                                                                                            <option value="2" ${item.estateId.bedRoom=='2' ? 'selected':''}>2</option>
                                                                                                                            <option value="3" ${item.estateId.bedRoom=='3' ? 'selected':''}>3</option>
                                                                                                                            <option value="4" ${item.estateId.bedRoom=='4' ? 'selected':''}>4</option>
                                                                                                                            <option value="5" ${item.estateId.bedRoom=='5' ? 'selected':''}>5</option>
                                                                                                                            <option value="6" ${item.estateId.bedRoom=='6' ? 'selected':''}>6</option>
                                                                                                                            <option value="7" ${item.estateId.bedRoom=='7' ? 'selected':''}>7</option>
                                                                                                                            <option value="8" ${item.estateId.bedRoom=='8' ? 'selected':''}>8</option>
                                                                                                                            <option value="9" ${item.estateId.bedRoom=='9' ? 'selected':''}>9</option>
                                                                                                                            <option value="10" ${item.estateId.bedRoom=='10' ? 'selected':''}>10</option>
                                                                                                                        </select>
                                                                                                                    </div>

                                                                                                                </div>
                                                                                                                <div class="col-md-6">
                                                                                                                    <div class="form-group">
                                                                                                                        <label class="control-label mb-10">Số lượng phòng tắm</label>
                                                                                                                        <select class="form-control" name="bathRoom">
                                                                                                                            <option value="0" ${item.estateId.bathRoom==0 ? 'selected':''}>0</option>
                                                                                                                            <option value="1" ${item.estateId.bathRoom==1 ? 'selected':''}>1</option>
                                                                                                                            <option value="2" ${item.estateId.bathRoom==2 ? 'selected':''}>2</option>
                                                                                                                            <option value="3" ${item.estateId.bathRoom==3 ? 'selected':''}>3</option>
                                                                                                                            <option value="4" ${item.estateId.bathRoom==4 ? 'selected':''}>4</option>
                                                                                                                            <option value="5" ${item.estateId.bathRoom=='5' ? 'selected':''}>5</option>
                                                                                                                            <option value="6" ${item.estateId.bathRoom==6 ? 'selected':''}>6</option>
                                                                                                                            <option value="7" ${item.estateId.bathRoom==7 ? 'selected':''}>7</option>
                                                                                                                            <option value="8" ${item.estateId.bathRoom==8 ? 'selected':''}>8</option>
                                                                                                                            <option value="9" ${item.estateId.bathRoom==9 ? 'selected':''}>9</option>
                                                                                                                            <option value="10" ${item.estateId.bathRoom==10 ? 'selected':''}>10</option>
                                                                                                                        </select>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-6">
                                                                                                                    <div class="form-group">
                                                                                                                        <div id="garagesForm" class="form-group">
                                                                                                                            <label class="control-label mb-10">Garages </label> (m<sup>2</sup>)
                                                                                                                            <input onchange="checkStep1()" id="garages" type="number" value="${item.estateId.garages}"  class="form-control" name="garages">
                                                                                                                            <span id="garagesMessage" class="help-block" style="display: none"> Tối thiểu 0 m2, tối đa 25 m2. </span>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-6">
                                                                                                                    <div class="form-group">
                                                                                                                        <div id="priceForm" class="form-group">
                                                                                                                            <label id="setPriceVND" class="control-label mb-10">Giá (đơn vị triệu VND)</label>
                                                                                                                            <input onchange="checkStep1()" id="price" type="number"  
                                                                                                                                   value="<c:set var="price" value="${item.estateId.price}"/><c:set var="priceRent" value="${price/1000000}"/><c:set var="priceSale" value="${price/1000000000}"/><c:if test = "${item.estateId.estateStatusId.estateStatusName == 'Cho thuê' || item.estateId.estateStatusId.estateStatusName == 'Đã thuê'}">${priceRent}</c:if><c:if test = "${item.estateId.estateStatusId.estateStatusName == 'Bán' || item.estateId.estateStatusId.estateStatusName == 'Đã bán'}">${priceSale}</c:if>" 
                                                                                                                            class="form-control" name="price">
                                                                                                                            <span id="priceMessage" class="help-block" style="display: none"> Tối thiểu 0,1 tỷ VND , tối đa 10 tỷ VND. </span>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-6">
                                                                                                                    <div class="form-group">
                                                                                                                        <div id="areasForm" class="form-group">
                                                                                                                            <label class="control-label mb-10">Diện tích </label>(m<sup>2</sup>)
                                                                                                                            <input onchange="checkStep1()" id="areas" type="number" id="estateName" value="${item.estateId.areas}" class="form-control" name="areas">
                                                                                                                            <span id="areasMessage" class="help-block" style="display: none"> Tối thiểu 20 m2, tối đa 999 m2. </span>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-6">
                                                                                                                    <div class="form-group">
                                                                                                                        <label class="control-label mb-10">Hướng</label>
                                                                                                                        <select class="form-control" name="direction">
                                                                                                                            <option value="Đông" ${item.estateId.direction=='Đông' ? 'selected':''}>Đông</option>
                                                                                                                            <option value="Tây" ${item.estateId.direction=='Tây' ? 'selected':''}>Tây</option>
                                                                                                                            <option value="Nam" ${item.estateId.direction=='Nam' ? 'selected':''}>South</option>
                                                                                                                            <option value="Bắc" ${item.estateId.direction=='Bắc' ? 'selected':''}>North</option>
                                                                                                                            <option value="Đông Bắc" ${item.estateId.direction=='Đông Bắc' ? 'selected':''}>Đông Bắc</option>
                                                                                                                            <option value="Đông Nam" ${item.estateId.direction=='Đông Nam' ? 'selected':''}>Đông Nam</option>
                                                                                                                            <option value="Tây Bắc" ${item.estateId.direction=='Tây Bắc' ? 'selected':''}>Tây Bắc</option>
                                                                                                                            <option value="Tây Nam" ${item.estateId.direction=='Tây Nam' ? 'selected':''}>Tây Nam</option>
                                                                                                                        </select>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-6">
                                                                                                                    <div class="form-group">
                                                                                                                        <label class="control-label mb-10">Tình trạng</label>
                                                                                                                        <select onclick="setPriceType()" id="estateStatusId" class="form-control" name="estateStatusId">
                                                                                                                            <option value="1" ${item.estateId.estateStatusId.id=='1' ? 'selected':''}>Cho Thuê</option>
                                                                                                                            <option value="2" ${item.estateId.estateStatusId.id=='2' ? 'selected':''}>Cho Bán</option>
                                                                                                                        </select>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-6">
                                                                                                                    <div class="form-group">
                                                                                                                        <div id="addressForm" class="form-group">
                                                                                                                            <label class="control-label mb-10">Địa chỉ</label>
                                                                                                                            <input onchange="checkStep1()" type="text" value="${item.estateId.address2}" id="address" class="form-control" name="address2">
                                                                                                                            <span id="addressMessage" class="help-block" style="display: none"> Địa chỉ cần tối thiểu 30 ký tự, tối đa 50 ký tự. </span>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-6">
                                                                                                                    <div class="form-group">
                                                                                                                        <label class="control-label mb-10">Quận</label>
                                                                                                                        <select class="form-control" name="district">
                                                                                                                            <option value="1" ${item.estateId.district=='1' ? 'selected':''}>1</option>
                                                                                                                            <option value="2" ${item.estateId.district=='2' ? 'selected':''}>2</option>
                                                                                                                            <option value="3" ${item.estateId.district=='3' ? 'selected':''}>3</option>
                                                                                                                            <option value="4" ${item.estateId.district=='4' ? 'selected':''}>4</option>
                                                                                                                            <option value="5" ${item.estateId.district=='5' ? 'selected':''}>5</option>
                                                                                                                            <option value="6" ${item.estateId.district=='6' ? 'selected':''}>6</option>
                                                                                                                            <option value="7" ${item.estateId.district=='7' ? 'selected':''}>7</option>
                                                                                                                            <option value="8" ${item.estateId.district=='8' ? 'selected':''}>8</option>
                                                                                                                            <option value="9" ${item.estateId.district=='9' ? 'selected':''}>9</option>
                                                                                                                            <option value="10" ${item.estateId.district=='10' ? 'selected':''}>10</option>
                                                                                                                            <option value="11" ${item.estateId.district=='11' ? 'selected':''}>11</option>
                                                                                                                            <option value="12" ${item.estateId.district=='12' ? 'selected':''}>12</option>
                                                                                                                            <option value="Bình Thạnh" ${item.estateId.district=='Bình Thạnh' ? 'selected':''}>Bình Thạnh</option>
                                                                                                                            <option value="Thủ Đức" ${item.estateId.district=='Thủ Đức' ? 'selected':''}>Thủ Đức</option>
                                                                                                                            <option value="Gò Vấp" ${item.estateId.district=='Gò Vấp' ? 'selected':''}>Gò Vấp</option>
                                                                                                                            <option value="Hóc Môn" ${item.estateId.district=='Hóc Môn' ? 'selected':''}>Hóc Môn</option>
                                                                                                                        </select>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-6">
                                                                                                                    <div id="yearBuildForm" class="form-group">
                                                                                                                        <fmt:formatDate pattern="yyyy" value="${item.estateId.yearBuild}" var="date" ></fmt:formatDate>
                                                                                                                            <label class="control-label mb-10">Năm xây </label> <span class="text-muted">(dd/mm/yyyy)</span> 
                                                                                                                            <input onchange="checkStep1()" id="yearBuild" name="yearBuild"  type="text" data-mask="9999" class="form-control">
                                                                                                                            <span id="yearBuildMessage" class="help-block" style="display: none"> Chỉ nhận thời gian từ năm 2000 tới năm 2019. </span>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                    <div class="col-md-6">
                                                                                                                        <div id="estateDescriptionForm" class="form-group">
                                                                                                                            <label class="control-label mb-10 text-left">Nội dung</label>
                                                                                                                            <textarea onchange="checkStep1()" id="estateDescription" class="form-control" rows="5" name="estateDescription">${item.estateId.estateContent}</textarea>
                                                                                                                        <span id="estateDescriptionMessage" class="help-block" style="display: none"> Nội dung cần ít nhất 1000 ký tự và tối đa 2000 ký tự </span>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </section>
                                                                                                        <h3><span class="head-font capitalize-font">Hình ảnh</span></h3>
                                                                                                        <section>
                                                                                                            <div class="row">
                                                                                                                <div class="col-md-4">
                                                                                                                    <div class="panel panel-default card-view pa-0">
                                                                                                                        <div class="panel-wrapper collapse in">
                                                                                                                            <div class="panel-body pa-0">
                                                                                                                                <article class="col-item">
                                                                                                                                    <div class="photo">
                                                                                                                                        <input id="image1st" name="image1st" type="hidden"/>
                                                                                                                                        <a onclick="BrowseServer1();"> 
                                                                                                                                            <img width="240" height="160" id="imageup1st" name="imageup1st" src="http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg" alt="Product Image" /> 
                                                                                                                                        </a>
                                                                                                                                    </div>
                                                                                                                                </article>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-4">
                                                                                                                    <div class="panel panel-default card-view pa-0">
                                                                                                                        <div class="panel-wrapper collapse in">
                                                                                                                            <div class="panel-body pa-0">
                                                                                                                                <article class="col-item">
                                                                                                                                    <div class="photo">
                                                                                                                                        <input id="image2st" name="image2st" type="hidden"/>
                                                                                                                                        <a onclick="BrowseServer2();"> 
                                                                                                                                            <img width="240" height="160" id="imageup2st" name="imageup2st" src="http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg" alt="Product Image" /> 
                                                                                                                                        </a>
                                                                                                                                    </div>
                                                                                                                                </article>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-4">
                                                                                                                    <div class="panel panel-default card-view pa-0">
                                                                                                                        <div class="panel-wrapper collapse in">
                                                                                                                            <div class="panel-body pa-0">
                                                                                                                                <article class="col-item">
                                                                                                                                    <div class="photo">
                                                                                                                                        <input id="image3st" name="image3st" type="hidden"/>
                                                                                                                                        <a onclick="BrowseServer3();"> 
                                                                                                                                            <img width="240" height="160" id="imageup3st" name="imageup3st" src="http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg" alt="Product Image" /> 
                                                                                                                                        </a>
                                                                                                                                    </div>
                                                                                                                                </article>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-4">
                                                                                                                    <div class="panel panel-default card-view pa-0">
                                                                                                                        <div class="panel-wrapper collapse in">
                                                                                                                            <div class="panel-body pa-0">
                                                                                                                                <article class="col-item">
                                                                                                                                    <div class="photo">
                                                                                                                                        <input id="image4st" name="image4st" type="hidden"/>
                                                                                                                                        <a onclick="BrowseServer4();"> 
                                                                                                                                            <img width="240" height="160" id="imageup4st" name="imageup4st" src="http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg" alt="Product Image" /> 
                                                                                                                                        </a>
                                                                                                                                    </div>
                                                                                                                                </article>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-4">
                                                                                                                    <div class="panel panel-default card-view pa-0">
                                                                                                                        <div class="panel-wrapper collapse in">
                                                                                                                            <div class="panel-body pa-0">
                                                                                                                                <article class="col-item">
                                                                                                                                    <div class="photo">
                                                                                                                                        <input id="image5st" name="image5st" type="hidden"/>
                                                                                                                                        <a onclick="BrowseServer5();"> 
                                                                                                                                            <img width="240" height="160" id="imageup5st" name="imageup5st" src="http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg" alt="Product Image" /> 
                                                                                                                                        </a>
                                                                                                                                    </div>
                                                                                                                                </article>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </section>
                                                                                                        <h3><span class="head-font capitalize-font">Nội thất-Chức năng</span></h3>
                                                                                                        <section>
                                                                                                            <div class="checkbox">
                                                                                                                <c:forEach items="${listEeatures}" var="listEeatures">
                                                                                                                    <input value="${listEeatures.featuresId}" type="checkbox" name="feature" id="${listEeatures.featuresId}" >
                                                                                                                    <label for="${listEeatures.featuresId}" style="margin-right: 100px;">${listEeatures.featureName}</label>
                                                                                                                </c:forEach>
                                                                                                            </div>
                                                                                                            <input type="submit" class="btn btn-primary" value="oke">
                                                                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                                                        </section>
                                                                                                    </div>
                                                                                                </form>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!-- /Row -->
                                                                            </div>
                                                                        </div>
                                                                        <!-- /.modal-dialog -->
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
                                                                                                            <span class="txt-dark">
                                                                                                                <c:if test="${item.estateId.estateStatusId.id == 2 || item.estateId.estateStatusId.id == 5}">
                                                                                                                    ${item.estateId.price/1000000000} Tỷ VND
                                                                                                                </c:if>
                                                                                                                <c:if test="${item.estateId.estateStatusId.id == 1 || item.estateId.estateStatusId.id == 4}">
                                                                                                                    ${item.estateId.price/1000000} Triệu VND
                                                                                                                </c:if>

                                                                                                            </span>
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
        <script type="text/javascript">
            function setPriceType() {
                var estateStatusId1 = document.getElementById('estateStatusId').value;
                if (estateStatusId1 === '1') {
                    document.getElementById('setPriceVND').innerHTML = "Giá (Đơn Vị Triệu VND)";
                    document.getElementById('priceMessage').innerHTML = "Giá cho thuê tối thiểu 1 triệu VND , tối đa 100 triệu VND.";
                } else if (estateStatusId1 === '2') {
                    document.getElementById('setPriceVND').innerHTML = "Giá (Đơn Vị Tỷ VND)";
                    document.getElementById('priceMessage').innerHTML = "Giá bán tối thiểu 0,1 tỷ VND , tối đa 10 tỷ VND.";
                }
            }
        </script>

        <script type="text/javascript">
            function checkStep1() {

                var estateName = document.getElementById('estateName').value;
                var estateNameForm = document.getElementById('estateNameForm');
                var estateNameMessage = document.getElementById('estateNameMessage');
                if (estateName.length < 5 || estateName.length > 27) {
                    estateNameForm.classList.add("has-error");
                    estateNameMessage.style.display = "block";
                } else {
                    estateNameForm.classList.remove("has-error");
                    estateNameMessage.style.display = "none";
                }

                var garages = document.getElementById('garages').value;
                var garagesForm = document.getElementById('garagesForm');
                var garagesMessage = document.getElementById('garagesMessage');
                if (garages.length === 0 || garages > 25) {
                    garagesForm.classList.add("has-error");
                    garagesMessage.style.display = "block";
                } else {
                    garagesForm.classList.remove("has-error");
                    garagesMessage.style.display = "none";
                }

                var price = document.getElementById('price').value;
                var priceForm = document.getElementById('priceForm');
                var priceMessage = document.getElementById('priceMessage');

                var estateStatusId1 = document.getElementById('estateStatusId').value;
                if (estateStatusId1 === '1') {
                    if (price.length === 0 || price < 1 || price > 100) {
                        priceForm.classList.add("has-error");
                        priceMessage.style.display = "block";
                    } else {
                        priceForm.classList.remove("has-error");
                        priceMessage.style.display = "none";
                    }
                } else if (estateStatusId1 === '2') {
                    if (price.length === 0 || price < 0.1 || price > 10) {
                        priceForm.classList.add("has-error");
                        priceMessage.style.display = "block";
                    } else {
                        priceForm.classList.remove("has-error");
                        priceMessage.style.display = "none";
                    }
                }

                var areas = document.getElementById('areas').value;
                var areasForm = document.getElementById('areasForm');
                var areasMessage = document.getElementById('areasMessage');
                console.log(price);
                if (areas.length === 0 || areas < 20 || areas > 999) {
                    areasForm.classList.add("has-error");
                    areasMessage.style.display = "block";
                } else {
                    areasForm.classList.remove("has-error");
                    areasMessage.style.display = "none";
                }

                var address = document.getElementById('address').value;
                var addressForm = document.getElementById('addressForm');
                var addressMessage = document.getElementById('addressMessage');
                console.log(price);
                if (address.length < 30 || address > 50) {
                    addressForm.classList.add("has-error");
                    addressMessage.style.display = "block";
                } else {
                    addressForm.classList.remove("has-error");
                    addressMessage.style.display = "none";
                }

                var yearBuild = document.getElementById('yearBuild').value;
                var yearBuildForm = document.getElementById('yearBuildForm');
                var yearBuildMessage = document.getElementById('yearBuildMessage');
                console.log(price);
                if (yearBuild < 2000 || yearBuild > 2019) {
                    yearBuildForm.classList.add("has-error");
                    yearBuildMessage.style.display = "block";
                } else {
                    yearBuildForm.classList.remove("has-error");
                    yearBuildMessage.style.display = "none";
                }

                var estateDescription = document.getElementById('estateDescription').value;
                var estateDescriptionForm = document.getElementById('estateDescriptionForm');
                var estateDescriptionMessage = document.getElementById('estateDescriptionMessage');
                console.log(price);
                if (estateDescription.length < 1000 || estateDescription.length > 2000) {
                    estateDescriptionForm.classList.add("has-error");
                    estateDescriptionMessage.style.display = "block";
                } else {
                    estateDescriptionForm.classList.remove("has-error");
                    estateDescriptionMessage.style.display = "none";
                }
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


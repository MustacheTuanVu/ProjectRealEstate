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

        <!-- vector map CSS -->
        <link href="<%=request.getContextPath()%>/admin/vendors/bower_components/jquery-wizard.js/css/wizard.css" rel="stylesheet" type="text/css"/>

        <!-- jquery-steps css -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/vendors/bower_components/jquery.steps/demo/css/jquery.steps.css">

        <!-- Data table CSS -->
        <link href="<%=request.getContextPath()%>/admin/vendors/bower_components/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>

        <!-- bootstrap-touchspin CSS -->
        <link href="<%=request.getContextPath()%>/admin/vendors/bower_components/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css" rel="stylesheet" type="text/css"/>

        <!-- Custom CSS -->
        <link href="<%=request.getContextPath()%>/admin/dist/css/style.css" rel="stylesheet" type="text/css">

        <style>
            .wizard > .actions {
                display: none;
            }
        </style>

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
            <%@ include file="/admin/page/template/director/left_sidebar.jsp" %>
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
                        <div class="col-sm-12">
                            <div class="panel panel-default card-view">
                                <div class="panel-heading">
                                    <div class="pull-left">
                                        <h6 class="panel-title txt-dark">Đăng nhà bán/thuê</h6>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body">
                                        <form action="<%=request.getContextPath()%>/EstateEdit" method="POST" class="form form--flex form--property form--basic js-form-property-1">
                                            <div id="example-basic">
                                                <h3><span class="head-font capitalize-font">Thông tin cơ bản</span></h3>
                                                <section>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <input type="hidden" name="estateID" value="${find.id}">
                                                            <div id="estateNameForm" class="form-group">
                                                                <label class="control-label mb-10">Tiêu đề bán</label>
                                                                <input onchange="checkStep1()" value="${find.estateName}" type="text" id="estateName" class="form-control" name="estateName">
                                                                <span id="estateNameMessage" class="help-block" style="display: none"> Tiêu đề cần tối thiểu 5 ký tự, tối đa 27 ký tự. </span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label mb-10">Loại nhà</label>
                                                                <select class="form-control" name="estateTypeId">
                                                                    <c:forEach items="${estateTypeList}" var="estateTypeList">
                                                                        <option value="${estateTypeList.id}"
                                                                                <c:if test="${estateTypeList.id == find.estateTypeId.id}">selected</c:if>
                                                                                    >
                                                                                ${estateTypeList.typeName}
                                                                        </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label mb-10">Số lượng phòng ngủ</label>
                                                                <select class="form-control" name="bedRoom">
                                                                    <option value="0" <c:if test="${find.bedRoom == '0'}">selected</c:if>>0</option>
                                                                    <option value="1" <c:if test="${find.bedRoom == '1'}">selected</c:if>>1</option>
                                                                    <option value="2" <c:if test="${find.bedRoom == '2'}">selected</c:if>>2</option>
                                                                    <option value="3" <c:if test="${find.bedRoom == '3'}">selected</c:if>>3</option>
                                                                    <option value="4" <c:if test="${find.bedRoom == '4'}">selected</c:if>>4</option>
                                                                    <option value="5" <c:if test="${find.bedRoom == '5'}">selected</c:if>>5</option>
                                                                    <option value="6" <c:if test="${find.bedRoom == '6'}">selected</c:if>>6</option>
                                                                    <option value="7" <c:if test="${find.bedRoom == '7'}">selected</c:if>>7</option>
                                                                    <option value="8" <c:if test="${find.bedRoom == '8'}">selected</c:if>>8</option>
                                                                    <option value="9" <c:if test="${find.bedRoom == '9'}">selected</c:if>>9</option>
                                                                    <option value="10" <c:if test="${find.bedRoom == '10'}">selected</c:if>>10</option>
                                                                    </select>
                                                                </div>

                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="control-label mb-10">Số lượng phòng tắm</label>
                                                                    <select class="form-control" name="bathRoom">
                                                                        <option value="0" <c:if test="${find.bathRoom == '0'}">selected</c:if>>0</option>
                                                                    <option value="1" <c:if test="${find.bathRoom == '1'}">selected</c:if>>1</option>
                                                                    <option value="2" <c:if test="${find.bathRoom == '2'}">selected</c:if>>2</option>
                                                                    <option value="3" <c:if test="${find.bathRoom == '3'}">selected</c:if>>3</option>
                                                                    <option value="4" <c:if test="${find.bathRoom == '4'}">selected</c:if>>4</option>
                                                                    <option value="5" <c:if test="${find.bathRoom == '5'}">selected</c:if>>5</option>
                                                                    <option value="6" <c:if test="${find.bathRoom == '6'}">selected</c:if>>6</option>
                                                                    <option value="7" <c:if test="${find.bathRoom == '7'}">selected</c:if>>7</option>
                                                                    <option value="8" <c:if test="${find.bathRoom == '8'}">selected</c:if>>8</option>
                                                                    <option value="9" <c:if test="${find.bathRoom == '9'}">selected</c:if>>9</option>
                                                                    <option value="10" <c:if test="${find.bathRoom == '10'}">selected</c:if>>10</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <div id="garagesForm" class="form-group">
                                                                        <label class="control-label mb-10">Garages (đơn vị m<sup>2</sup>)</label>
                                                                        <input onchange="checkStep1()" value="${find.garages}" type="number" id="garages" class="form-control" name="garages">
                                                                    <span id="garagesMessage" class="help-block" style="display: none"> Tối thiểu 0 m2, tối đa 25 m2. </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div id="priceForm" class="form-group">
                                                                    <label id="setPriceVND" class="control-label mb-10">Giá (đơn vị tỷ VND)</label>
                                                                    <input onchange="checkStep1()" step="any" value="${find.price}" type="number" id="price" class="form-control" name="price">
                                                                    <span id="priceMessage" class="help-block" style="display: none"> Tối thiểu 0,1 tỷ VND , tối đa 10 tỷ VND. </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div id="areasForm" class="form-group">
                                                                <label class="control-label mb-10">Diện tích</label>
                                                                <input onchange="checkStep1()" value="${find.areas}" type="number" id="areas" class="form-control" name="areas">
                                                                <span id="areasMessage" class="help-block" style="display: none"> Tối thiểu 20 m2, tối đa 999 m2. </span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label mb-10">Hướng</label>
                                                                <select class="form-control" name="direction">
                                                                    <option value="Đông" <c:if test="${find.direction == 'Đông'}">selected</c:if>>Đông</option>
                                                                    <option value="Tây" <c:if test="${find.direction == 'Tây'}">selected</c:if>>Tây</option>
                                                                    <option value="Nam" <c:if test="${find.direction == 'Nam'}">selected</c:if>>Nam</option>
                                                                    <option value="Bắc" <c:if test="${find.direction == 'Bắc'}">selected</c:if>>Bắc</option>
                                                                    <option value="Đông Bắc" <c:if test="${find.direction == 'Đông Bắc'}">selected</c:if>>Đông Bắc</option>
                                                                    <option value="Đông Nam" <c:if test="${find.direction == 'Đông Nam'}">selected</c:if>>Đông Nam</option>
                                                                    <option value="Tây Bắc" <c:if test="${find.direction == 'Tây Bắc'}">selected</c:if>>Tây Bắc</option>
                                                                    <option value="Tây Nam" <c:if test="${find.direction == 'Tây Nam'}">selected</c:if>>Tây Nam</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="control-label mb-10">Tình trạng</label>
                                                                    <select onclick="setPriceType()" class="form-control" id="estateStatusId" name="estateStatusId">
                                                                        <option value="1" <c:if test="${find.estateStatusId.id == '1'}">selected</c:if>>Cho Thuê</option>
                                                                        <option value="2" <c:if test="${find.estateStatusId.id == '2'}">selected</c:if>>Cho Bán</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div id="addressForm" class="form-group">
                                                                    <label class="control-label mb-10">Địa chỉ</label>
                                                                    <input onchange="checkStep1()" value="${find.address2}" type="text" id="address" class="form-control" name="address2">
                                                                <span id="addressMessage" class="help-block" style="display: none"> Địa chỉ cần tối thiểu 30 ký tự, tối đa 50 ký tự. </span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label mb-10">Quận</label>
                                                                <select class="form-control" name="district">
                                                                    <c:if test="${find.district != null}">
                                                                        <option value="${find.district}" selected>${find.district}</option>
                                                                    </c:if>
                                                                    <c:if test="${find.district == null}">
                                                                        <option value="1">1</option>
                                                                        <option value="2">2</option>
                                                                        <option value="3">3</option>
                                                                        <option value="4">4</option>
                                                                        <option value="5">5</option>
                                                                        <option value="6">6</option>
                                                                        <option value="7">7</option>
                                                                        <option value="8">8</option>
                                                                        <option value="9">9</option>
                                                                        <option value="10">10</option>
                                                                        <option value="11">11</option>
                                                                        <option value="12">12</option>
                                                                        <option value="Bình Thạnh">Bình Thạnh</option>
                                                                        <option value="Thủ Đức">Thủ Đức</option>
                                                                        <option value="Gò Vấp">Gò Vấp</option>
                                                                        <option value="Hóc Môn">Hóc Môn</option>
                                                                    </c:if>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div id="yearBuildForm" class="form-group">
                                                                <label class="control-label mb-10">Năm xây</label>
                                                                <input onchange="checkStep1()" value="<fmt:formatDate value="${find.yearBuild}" pattern="yyyy" />" id="yearBuild" name="yearBuild" type="text" placeholder="" data-mask="9999" class="form-control">
                                                                <span id="yearBuildMessage" class="help-block" style="display: none"> Chỉ nhận thời gian từ năm 2000 tới năm 2019. </span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div id="estateDescriptionForm" class="form-group">
                                                                <label class="control-label mb-10 text-left">Nội dung</label>
                                                                <textarea onchange="checkStep1()" id="estateDescription" class="form-control" rows="5" name="estateDescription">${find.estateContent}</textarea>
                                                                <span id="estateDescriptionMessage" class="help-block" style="display: none"> Nội dung cần ít nhất 1000 ký tự và tối đa 2000 ký tự </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>
                                                <h3><span class="head-font capitalize-font">Hình ảnh</span></h3>
                                                <section>
                                                    <div class="row">
                                                        <h5 id="countimage">Bạn cần chọn đủ 5 hình để thực hiện bước kế tiếp</h5>
                                                        <div class="col-md-4">
                                                            <div class="panel panel-default card-view pa-0">
                                                                <div class="panel-wrapper collapse in">
                                                                    <div class="panel-body pa-0">
                                                                        <article class="col-item">
                                                                            <div class="photo">
                                                                                <input value="${find.image1st}" id="image1st" name="image1st" type="hidden"/>
                                                                                <a onclick="BrowseServer1();"> 
                                                                                    <img width="240" height="160" id="imageup1st" name="imageup1st" src="${find.image1st}" alt="Product Image" /> 
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
                                                                                <input value="${find.image2st}" id="image2st" name="image2st" type="hidden"/>
                                                                                <a onclick="BrowseServer2();"> 
                                                                                    <img width="240" height="160" id="imageup2st" name="imageup2st" src="${find.image2st}" alt="Product Image" /> 
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
                                                                                <input value="${find.image3st}" id="image3st" name="image3st" type="hidden"/>
                                                                                <a onclick="BrowseServer3();"> 
                                                                                    <img width="240" height="160" id="imageup3st" name="imageup3st" src="${find.image3st}" alt="Product Image" /> 
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
                                                                                <input value="${find.image4st}" id="image4st" name="image4st" type="hidden"/>
                                                                                <a onclick="BrowseServer4();"> 
                                                                                    <img width="240" height="160" id="imageup4st" name="imageup4st" src="${find.image4st}" alt="Product Image" /> 
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
                                                                                <input value="${find.image5st}" id="image5st" name="image5st" type="hidden"/>
                                                                                <a onclick="BrowseServer5();"> 
                                                                                    <img width="240" height="160" id="imageup5st" name="imageup5st" src="${find.image5st}" alt="Product Image" /> 
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
                                                        <c:forEach items="${featureEstateList}" var="item">
                                                            <input value="${item.featuresId}" type="checkbox" name="feature" id="${item.featuresId}" checked>
                                                            <label for="${item.featuresId}" style="margin-right: 100px;">${item.featureName}</label>
                                                        </c:forEach>
                                                        <c:forEach items="${featureEstateListNot}" var="item">
                                                            <input value="${item.featuresId}" type="checkbox" name="feature" id="${item.featuresId}">
                                                            <label for="${item.featuresId}" style="margin-right: 100px;">${item.featureName}</label>
                                                        </c:forEach>
                                                    </div>
                                                </section>
                                                <h3><span class="head-font capitalize-font">Chỉ định nhân viên</span></h3>
                                                <section>
                                                    <!-- Row -->
                                                    <div class="row">
                                                        <c:forEach items="${employeeList}" var="employee">
                                                            <c:if test="${employee.employeeMail != 'wait'}">
                                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                    <div id="panelEmployee${employee.id}"
                                                                         <c:if test="${employee.id == employees}">style="display: block"</c:if> 
                                                                         <c:if test="${employee.id != employees}">style="display: none"</c:if> 
                                                                             class="panel 
                                                                         <c:if test="${employee.id == employees}">panel-danger</c:if> 
                                                                         <c:if test="${employee.id != employees}">panel-success</c:if> 
                                                                             contact-card card-view">
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
                                                                                 <a class="pull-left inline-block mr-15" onclick="getEmployeeID(${employee.id})">
                                                                                     <i id="tickEmployee${employee.id}" class="glyphicon 
                                                                                        <c:if test="${employee.id == employees}">glyphicon-remove</c:if>
                                                                                        <c:if test="${employee.id != employees}">glyphicon-ok</c:if> 
                                                                                            txt-light">
                                                                                        </i>
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
                                                            </c:if>
                                                        </c:forEach>
                                                        <input type="hidden" id="employeeIDGet" name="employeeID" value="${employees}">
                                                    </div>
                                                    <!-- Row -->
                                                    <button class="btn btn-success btn-anim" type="submit" name="submit" value="submit">
                                                        <i class="icon-rocket"></i>
                                                        <span class="btn-text">Đăng lên</span>
                                                    </button>
                                                </section>
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
            function getEmployeeID(employeeID) {
                document.getElementById('employeeIDGet').value = employeeID;

                if (document.getElementById('panelEmployee' + employeeID).classList.contains("panel-success")) {
                    document.getElementById('panelEmployee' + employeeID).classList.remove("panel-success");
                    document.getElementById('panelEmployee' + employeeID).classList.add("panel-danger");
                    document.getElementById('tickEmployee' + employeeID).classList.remove("glyphicon-ok");
                    document.getElementById('tickEmployee' + employeeID).classList.add("glyphicon-remove");

            <c:forEach items="${employeeList}" var="employee">
                <c:if test="${employee.employeeMail != 'wait'}">
                    if (employeeID !== ${employee.id}) {
                        document.getElementById('panelEmployee' + ${employee.id}).style.display = "none";
                    }
                </c:if>
            </c:forEach>
                } else {
                    document.getElementById('panelEmployee' + employeeID).classList.remove("panel-danger");
                    document.getElementById('panelEmployee' + employeeID).classList.add("panel-success");
                    document.getElementById('tickEmployee' + employeeID).classList.remove("glyphicon-remove");
                    document.getElementById('tickEmployee' + employeeID).classList.add("glyphicon-ok");
            <c:forEach items="${employeeList}" var="employee">
                <c:if test="${employee.employeeMail != 'wait'}">
                    document.getElementById('panelEmployee' + ${employee.id}).style.display = "block";
                </c:if>
            </c:forEach>
                }
            }
        </script>

        <script type="text/javascript">
            function checkStep1() {
                var actionsBar = document.getElementsByClassName("actions clearfix")[0];

                var estateName = document.getElementById('estateName').value;
                var estateNameForm = document.getElementById('estateNameForm');
                var estateNameMessage = document.getElementById('estateNameMessage');
                if (estateName.length < 5 || estateName.length > 27) {
                    actionsBar.style.display = "none";
                    estateNameForm.classList.add("has-error");
                    estateNameMessage.style.display = "block";
                } else {
                    actionsBar.style.display = "block";
                    estateNameForm.classList.remove("has-error");
                    estateNameMessage.style.display = "none";
                }

                var garages = document.getElementById('garages').value;
                var garagesForm = document.getElementById('garagesForm');
                var garagesMessage = document.getElementById('garagesMessage');
                if (garages.length === 0 || garages > 25) {
                    actionsBar.style.display = "none";
                    garagesForm.classList.add("has-error");
                    garagesMessage.style.display = "block";
                } else {
                    actionsBar.style.display = "block";
                    garagesForm.classList.remove("has-error");
                    garagesMessage.style.display = "none";
                }

                var price = document.getElementById('price').value;
                var priceForm = document.getElementById('priceForm');
                var priceMessage = document.getElementById('priceMessage');

                var estateStatusId1 = document.getElementById('estateStatusId').value;
                if (estateStatusId1 === '1') {
                    if (price.length === 0 || price < 1 || price > 100) {
                        actionsBar.style.display = "none";
                        priceForm.classList.add("has-error");
                        priceMessage.style.display = "block";
                    } else {
                        actionsBar.style.display = "block";
                        priceForm.classList.remove("has-error");
                        priceMessage.style.display = "none";
                    }
                } else if (estateStatusId1 === '2') {
                    if (price.length === 0 || price < 0.1 || price > 10) {
                        actionsBar.style.display = "none";
                        priceForm.classList.add("has-error");
                        priceMessage.style.display = "block";
                    } else {
                        actionsBar.style.display = "block";
                        priceForm.classList.remove("has-error");
                        priceMessage.style.display = "none";
                    }
                }



                var areas = document.getElementById('areas').value;
                var areasForm = document.getElementById('areasForm');
                var areasMessage = document.getElementById('areasMessage');
                console.log(price);
                if (areas.length === 0 || areas < 20 || areas > 999) {
                    actionsBar.style.display = "none";
                    areasForm.classList.add("has-error");
                    areasMessage.style.display = "block";
                } else {
                    actionsBar.style.display = "block";
                    areasForm.classList.remove("has-error");
                    areasMessage.style.display = "none";
                }

                var address = document.getElementById('address').value;
                var addressForm = document.getElementById('addressForm');
                var addressMessage = document.getElementById('addressMessage');
                console.log(price);
                if (address.length < 30 || address > 50) {
                    actionsBar.style.display = "none";
                    addressForm.classList.add("has-error");
                    addressMessage.style.display = "block";
                } else {
                    actionsBar.style.display = "block";
                    addressForm.classList.remove("has-error");
                    addressMessage.style.display = "none";
                }

                var yearBuild = document.getElementById('yearBuild').value;
                var yearBuildForm = document.getElementById('yearBuildForm');
                var yearBuildMessage = document.getElementById('yearBuildMessage');
                console.log(price);
                if (yearBuild < 2000 || yearBuild > 2019) {
                    actionsBar.style.display = "none";
                    yearBuildForm.classList.add("has-error");
                    yearBuildMessage.style.display = "block";
                } else {
                    actionsBar.style.display = "block";
                    yearBuildForm.classList.remove("has-error");
                    yearBuildMessage.style.display = "none";
                }

                var estateDescription = document.getElementById('estateDescription').value;
                var estateDescriptionForm = document.getElementById('estateDescriptionForm');
                var estateDescriptionMessage = document.getElementById('estateDescriptionMessage');
                console.log(price);
                if (estateDescription.length < 1000 || estateDescription.length > 2000) {
                    actionsBar.style.display = "none";
                    estateDescriptionForm.classList.add("has-error");
                    estateDescriptionMessage.style.display = "block";
                } else {
                    actionsBar.style.display = "block";
                    estateDescriptionForm.classList.remove("has-error");
                    estateDescriptionMessage.style.display = "none";
                }
            }
        </script>
        <!-- jQuery -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/jasny-bootstrap/dist/js/jasny-bootstrap.min.js"></script>		

        <!-- Form Wizard JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/jquery.steps/build/jquery.steps.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>

        <!-- Form Wizard Data JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/dist/js/form-wizard-data.js"></script>

        <!-- Data table JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>

        <!-- Bootstrap Touchspin JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>

        <!-- Starrr JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/dist/js/starrr.js"></script>

        <!-- Slimscroll JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/dist/js/jquery.slimscroll.js"></script>

        <!-- Fancy Dropdown JS -->
        <script src="<%=request.getContextPath()%>/admin/dist/js/dropdown-bootstrap-extended.js"></script>

        <!-- Owl JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/owl.carousel/dist/owl.carousel.min.js"></script>

        <!-- Switchery JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/vendors/bower_components/switchery/dist/switchery.min.js"></script>

        <!-- Init JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/dist/js/init.js"></script>
    </body>

</html>


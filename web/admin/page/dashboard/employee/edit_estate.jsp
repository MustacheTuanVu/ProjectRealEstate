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
                                        <form action="<%=request.getContextPath()%>/EstateEdit" method="POST" class="form form--flex form--property form--basic js-form-property-1">
                                            <div id="example-basic">
                                                <h3><span class="head-font capitalize-font">Thông tin cơ bản</span></h3>
                                                <section>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label mb-10">Tiêu đề bán</label>
                                                                <input type="hidden" name="estateID" value="${find.id}">
                                                                <input value="${find.estateName}" type="text" id="estateName" class="form-control" name="estateName">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label mb-10">Loại nhà</label>
                                                                <select id="in-15" required name="estateTypeId" data-placeholder="---" class="form-control">
                                                                    <option label=" "></option>
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
                                                                <select id="in-5" name="bedRoom" data-placeholder="Choose number..." required class="form-control js-in-select">
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
                                                                    <select id="in-5" name="bathRoom" data-placeholder="Choose number..." required class="form-control js-in-select">
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
                                                                    <div class="form-group">
                                                                        <label class="control-label mb-10">Garages</label>
                                                                        <input value="${find.garages}" type="number" id="estateName" class="form-control" name="garages">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div class="form-group">
                                                                    <label class="control-label mb-10">Giá</label>
                                                                    <input value="${find.price}" type="number" id="estateName" class="form-control" name="price">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div class="form-group">
                                                                    <label class="control-label mb-10">Diện tích</label>
                                                                    <input value="${find.areas}" type="number" id="estateName" class="form-control" name="areas">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label mb-10">Hướng</label>
                                                                <select id="in-5" name="direction" data-placeholder="Choose a Direction..." required class="form-control js-in-select">
                                                                    <option label=" "></option>
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
                                                                    <select id="in-2" required name="estateStatusId" data-placeholder="---" class="form-control">
                                                                        <option label=" "></option>
                                                                    <c:forEach items="${estateStatusList}" var="estateStatusList">
                                                                        <option value="${estateStatusList.id}"
                                                                                <c:if test="${find.estateStatusId.id == estateStatusList.id}">selected</c:if>
                                                                                    >
                                                                                ${estateStatusList.estateStatusName}
                                                                        </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div class="form-group">
                                                                    <label class="control-label mb-10">Địa chỉ 1</label>
                                                                    <input value="${find.address1}" type="text" id="estateName" class="form-control" name="address1">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div class="form-group">
                                                                    <label class="control-label mb-10">Địa chỉ 2</label>
                                                                    <input value="${find.address2}" type="text" id="estateName" class="form-control" name="address2">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label mb-10">Quận</label>
                                                                <select id="in-5" name="district" re data-placeholder="Chọn quận..." required class="form-control js-in-select">
                                                                    <c:if test="${find.district != null}">
                                                                        <option value="${find.district}" selected>${find.district}</option>
                                                                    </c:if>
                                                                    <c:if test="${find.district == null}">
                                                                        <option value="1" selected>1</option>
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
                                                            <div class="form-group">
                                                                <label class="control-label mb-10">Năm xây</label>
                                                                <input value="<fmt:formatDate value="${find.yearBuild}" pattern="MM/dd/yyyy" />" name="yearBuild" type="text" placeholder="" data-mask="99/99/9999" class="form-control">
                                                                <span class="text-muted">dd/mm/yyyy</span> 
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label mb-10 text-left">Nội dung</label>
                                                                <textarea class="form-control" rows="5" name="estateDescription">${find.estateContent}</textarea>
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
                                                            <input value="${item.featuresId}" type="checkbox" name="feature" id="${item.featuresId}" >
                                                            <label for="${item.featuresId}" style="margin-right: 100px;">${item.featureName}</label>
                                                        </c:forEach>
                                                    </div>
                                                    <input name="submit" type="submit" class="btn btn-primary" value="oke">
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


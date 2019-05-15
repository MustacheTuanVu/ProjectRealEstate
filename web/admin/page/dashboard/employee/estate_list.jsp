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
            <%@ include file="/admin/page/template/employee/left_sidebar.jsp" %>
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
                            <h3 class="txt-dark">Danh Sách Nhà Đất</h3>
                        </div>
                        <!-- Breadcrumb -->
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <ol class="breadcrumb">
                                <li><a href="<%=request.getContextPath()%>/Employee">Nhân Viên</a></li>
                                <li><a href="<%=request.getContextPath()%>/EstateList?user=employee">Nhà Đất</a></li>
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
                                                                        <span class="txt-light block counter"><span class="counter-anim"></span></span>
                                                                        <a href="<%=request.getContextPath()%>/EstateList?user=employee&filter=waitting to transaction" class="weight-500 uppercase-font txt-light block font-13">
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
                                        <a href="<%=request.getContextPath()%>/EstateList?user=employee&filter=waitting for employee" >
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                <div class="panel panel-default card-view pa-0">
                                                    <div class="panel-wrapper collapse in">
                                                        <div class="panel-body pa-0">
                                                            <div class="sm-data-box bg-yellow">
                                                                <div class="container-fluid">
                                                                    <div class="row">
                                                                        <div class="col-xs-6 text-center pl-0 pr-0 data-wrap-left">
                                                                            <span class="txt-light block counter"><span class="counter-anim"></span></span>
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
                                        <a href="<%=request.getContextPath()%>/EstateList?user=employee&filter=publish" >
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                <div class="panel panel-default card-view pa-0">
                                                    <div class="panel-wrapper collapse in">
                                                        <div class="panel-body pa-0">
                                                            <div class="sm-data-box bg-green">
                                                                <div class="container-fluid">
                                                                    <div class="row">
                                                                        <div class="col-xs-6 text-center pl-0 pr-0 data-wrap-left">
                                                                            <span class="txt-light block counter"><span class="counter-anim"></span></span>
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
                                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="panel panel-default card-view pa-0">
                                                <div class="panel-wrapper collapse in">
                                                    <div class="panel-body pa-0">
                                                        <div class="sm-data-box bg-blue">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div class="col-xs-6 text-center pl-0 pr-0 data-wrap-left">
                                                                        <span class="txt-light block counter"><span class="counter-anim"></span></span>
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
                                            <input type="hidden" name="user" value="employee">
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
                                                                            Đang chờ bán
                                                                        </c:when>
                                                                        <c:when test="${estate.estateStatus == 'project'}">
                                                                            Chung cư
                                                                        </c:when>
                                                                    </c:choose>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="pull-right">
                                                            
                                                            <a onclick="loadCheckBox(${estate.id})" data-toggle="modal" data-target="#${estate.id}" class="pull-left inline-block mr-15" href="" >
                                                                <i class="zmdi zmdi-edit txt-light" ></i>
                                                            </a>
                                                            <!-- cuong add -->
                                                            <!-- start modal-->
                                                            <div id="${estate.id}" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
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
                                                                                        <form method="POST" action="<%=request.getContextPath()%>/EstateDetails?idEstate=${estate.id}" class="form form--flex form--property form--basic js-form-property-1">
                                                                                            <div id="example-basic">
                                                                                                <h3><span class="head-font capitalize-font">Thông tin cơ bản</span></h3>
                                                                                                <section>
                                                                                                    <div class="row">
                                                                                                        <div class="col-md-6">
                                                                                                            <div class="form-group">
                                                                                                                <label class="control-label mb-10">Tiêu đề bán</label>
                                                                                                                <input type="text" id="estateName" value="${estate.estateName}" class="form-control" name="estateName">
                                                                                                                <input type="hidden" id="estateID" value="${estate.id}" class="form-control" name="estateID">
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-6">
                                                                                                            <div class="form-group">
                                                                                                                <label class="control-label mb-10">Loại nhà</label>
                                                                                                                <select class="form-control" name="estateTypeId">
                                                                                                                    <c:forEach items="${estateTypeList}" var="estateTypeList">
                                                                                                                        <option value="${estateTypeList.id}" ${estate.estateTypeId.id==estateTypeList.id ? 'selected':''}>${estateTypeList.typeName}</option>
                                                                                                                    </c:forEach>
                                                                                                                </select>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-6">
                                                                                                            <div class="form-group">
                                                                                                                <label class="control-label mb-10">Số lượng phòng ngủ</label>
                                                                                                                <select class="form-control" name="bedRoom">
                                                                                                                    <option value="0" ${estate.bedRoom=='0' ? 'selected':''}>0</option>
                                                                                                                    <option value="1" ${estate.bedRoom=='1' ? 'selected':''}>1</option>
                                                                                                                    <option value="2" ${estate.bedRoom=='2' ? 'selected':''}>2</option>
                                                                                                                    <option value="3" ${estate.bedRoom=='3' ? 'selected':''}>3</option>
                                                                                                                    <option value="4" ${estate.bedRoom=='4' ? 'selected':''}>4</option>
                                                                                                                    <option value="5" ${estate.bedRoom=='5' ? 'selected':''}>5</option>
                                                                                                                    <option value="6" ${estate.bedRoom=='6' ? 'selected':''}>6</option>
                                                                                                                    <option value="7" ${estate.bedRoom=='7' ? 'selected':''}>7</option>
                                                                                                                    <option value="8" ${estate.bedRoom=='8' ? 'selected':''}>8</option>
                                                                                                                    <option value="9" ${estate.bedRoom=='9' ? 'selected':''}>9</option>
                                                                                                                    <option value="10" ${estate.bedRoom=='10' ? 'selected':''}>10</option>
                                                                                                                </select>
                                                                                                            </div>

                                                                                                        </div>
                                                                                                        <div class="col-md-6">
                                                                                                            <div class="form-group">
                                                                                                                <label class="control-label mb-10">Số lượng phòng tắm</label>
                                                                                                                <select class="form-control" name="bathRoom">
                                                                                                                    <option value="0" ${estate.bathRoom==0 ? 'selected':''}>0</option>
                                                                                                                    <option value="1" ${estate.bathRoom==1 ? 'selected':''}>1</option>
                                                                                                                    <option value="2" ${estate.bathRoom==2 ? 'selected':''}>2</option>
                                                                                                                    <option value="3" ${estate.bathRoom==3 ? 'selected':''}>3</option>
                                                                                                                    <option value="4" ${estate.bathRoom==4 ? 'selected':''}>4</option>
                                                                                                                    <option value="5" ${estate.bathRoom=='5' ? 'selected':''}>5</option>
                                                                                                                    <option value="6" ${estate.bathRoom==6 ? 'selected':''}>6</option>
                                                                                                                    <option value="7" ${estate.bathRoom==7 ? 'selected':''}>7</option>
                                                                                                                    <option value="8" ${estate.bathRoom==8 ? 'selected':''}>8</option>
                                                                                                                    <option value="9" ${estate.bathRoom==9 ? 'selected':''}>9</option>
                                                                                                                    <option value="10" ${estate.bathRoom==10 ? 'selected':''}>10</option>
                                                                                                                </select>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-6">
                                                                                                            <div class="form-group">
                                                                                                                <div class="form-group">
                                                                                                                    <label class="control-label mb-10">Garages </label> (m<sup>2</sup>)
                                                                                                                    <input type="number" value="${estate.garages}"  class="form-control" name="garages">
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-6">
                                                                                                            <div class="form-group">
                                                                                                                <div class="form-group">
                                                                                                                    <label class="control-label mb-10">Giá</label>
                                                                                                                    <input type="number"  value="${estate.price}" class="form-control" name="price">
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-6">
                                                                                                            <div class="form-group">
                                                                                                                <div class="form-group">
                                                                                                                    <label class="control-label mb-10">Diện tích </label>(m<sup>2</sup>)
                                                                                                                    <input type="number" id="estateName" value="${estate.areas}" class="form-control" name="areas">
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-6">
                                                                                                            <div class="form-group">
                                                                                                                <label class="control-label mb-10">Hướng</label>
                                                                                                                <select class="form-control" name="direction">
                                                                                                                    <option value="Đông" ${estate.direction=='Đông' ? 'selected':''}>Đông</option>
                                                                                                                    <option value="Tây" ${estate.direction=='Tây' ? 'selected':''}>Tây</option>
                                                                                                                    <option value="Nam" ${estate.direction=='Nam' ? 'selected':''}>South</option>
                                                                                                                    <option value="Bắc" ${estate.direction=='Bắc' ? 'selected':''}>North</option>
                                                                                                                    <option value="Đông Bắc" ${estate.direction=='Đông Bắc' ? 'selected':''}>Đông Bắc</option>
                                                                                                                    <option value="Đông Nam" ${estate.direction=='Đông Nam' ? 'selected':''}>Đông Nam</option>
                                                                                                                    <option value="Tây Bắc" ${estate.direction=='Tây Bắc' ? 'selected':''}>Tây Bắc</option>
                                                                                                                    <option value="Tây Nam" ${estate.direction=='Tây Nam' ? 'selected':''}>Tây Nam</option>
                                                                                                                </select>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-6">
                                                                                                            <div class="form-group">
                                                                                                                <label class="control-label mb-10">Tình trạng</label>
                                                                                                                <select class="form-control" name="estateStatusId">
                                                                                                                    <option value="1" ${estate.estateStatusId.id=='1' ? 'selected':''}>Cho Thuê</option>
                                                                                                                    <option value="2" ${estate.estateStatusId.id=='2' ? 'selected':''}>Cho Bán</option>
                                                                                                                </select>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-6">
                                                                                                            <div class="form-group">
                                                                                                                <div class="form-group">
                                                                                                                    <label class="control-label mb-10">Địa chỉ 1</label>
                                                                                                                    <input type="text" value="${estate.address1}" id="estateName" class="form-control" name="address1">
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-6">
                                                                                                            <div class="form-group">
                                                                                                                <div class="form-group">
                                                                                                                    <label class="control-label mb-10">Địa chỉ 2</label>
                                                                                                                    <input type="text" value="${estate.address2}" id="estateName" class="form-control" name="address2">
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-6">
                                                                                                            <div class="form-group">
                                                                                                                <label class="control-label mb-10">Quận</label>
                                                                                                                <select class="form-control" name="district">
                                                                                                                    <option value="1" ${estate.district=='1' ? 'selected':''}>1</option>
                                                                                                                    <option value="2" ${estate.district=='2' ? 'selected':''}>2</option>
                                                                                                                    <option value="3" ${estate.district=='3' ? 'selected':''}>3</option>
                                                                                                                    <option value="4" ${estate.district=='4' ? 'selected':''}>4</option>
                                                                                                                    <option value="5" ${estate.district=='5' ? 'selected':''}>5</option>
                                                                                                                    <option value="6" ${estate.district=='6' ? 'selected':''}>6</option>
                                                                                                                    <option value="7" ${estate.district=='7' ? 'selected':''}>7</option>
                                                                                                                    <option value="8" ${estate.district=='8' ? 'selected':''}>8</option>
                                                                                                                    <option value="9" ${estate.district=='9' ? 'selected':''}>9</option>
                                                                                                                    <option value="10" ${estate.district=='10' ? 'selected':''}>10</option>
                                                                                                                    <option value="11" ${estate.district=='11' ? 'selected':''}>11</option>
                                                                                                                    <option value="12" ${estate.district=='12' ? 'selected':''}>12</option>
                                                                                                                    <option value="Bình Thạnh" ${estate.district=='Bình Thạnh' ? 'selected':''}>Bình Thạnh</option>
                                                                                                                    <option value="Thủ Đức" ${estate.district=='Thủ Đức' ? 'selected':''}>Thủ Đức</option>
                                                                                                                    <option value="Gò Vấp" ${estate.district=='Gò Vấp' ? 'selected':''}>Gò Vấp</option>
                                                                                                                    <option value="Hóc Môn" ${estate.district=='Hóc Môn' ? 'selected':''}>Hóc Môn</option>
                                                                                                                </select>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-6">
                                                                                                            <div class="form-group">
                                                                                                                <fmt:formatDate pattern="dd-MM-yyyy" value="${estate.yearBuild}" var="date" ></fmt:formatDate>
                                                                                                                    <label class="control-label mb-10">Năm xây </label> <span class="text-muted">(dd/mm/yyyy)</span> 
                                                                                                                    <input name="yearBuild"  type="text" placeholder="" data-mask="99/99/9999" class="form-control">
                                                                                                                </div>
                                                                                                            </div>
                                                                                                            <div class="col-md-6">
                                                                                                                <div class="form-group">
                                                                                                                    <label class="control-label mb-10 text-left">Nội dung</label>
                                                                                                                    <textarea class="form-control" rows="5" name="estateDescription">${estate.estateContent}</textarea>
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
                                                                                                                                    <c:if test="${estate.image1st== ''}" >
                                                                                                                                        <img width="240" height="160" id="imageup1st" name="imageup1st" src="http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg" alt="Product Image" /> 
                                                                                                                                    </c:if>
                                                                                                                                    <c:if test="${estate.image1st!= ''}" >
                                                                                                                                        <img width="240" height="160" id="imageup1st" name="imageup1st" src="${estate.image1st}" alt="Product Image" /> 
                                                                                                                                    </c:if>
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
                                                                                                                                    <c:if test="${estate.image2st== ''}" >
                                                                                                                                        <img width="240" height="160" id="imageup2st" name="imageup2st" src="http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg" alt="Product Image" /> 
                                                                                                                                    </c:if>
                                                                                                                                    <c:if test="${estate.image2st!= ''}" >
                                                                                                                                        <img width="240" height="160" id="imageup2st" name="imageup2st" src="${estate.image2st}" alt="Product Image" /> 
                                                                                                                                    </c:if>
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
                                                                                                                                    <c:if test="${estate.image3st== ''}" >
                                                                                                                                        <img width="240" height="160" id="imageup3st" name="imageup3st" src="http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg" alt="Product Image" /> 
                                                                                                                                    </c:if>
                                                                                                                                    <c:if test="${estate.image3st!= ''}" >
                                                                                                                                        <img width="240" height="160" id="imageup3st" name="imageup3st" src="${estate.image3st}" alt="Product Image" /> 
                                                                                                                                    </c:if>
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
                                                                                                                                    <c:if test="${estate.image4st== ''}" >
                                                                                                                                        <img width="240" height="160" id="imageup4st" name="imageup4st" src="http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg" alt="Product Image" /> 
                                                                                                                                    </c:if>
                                                                                                                                    <c:if test="${estate.image4st!= ''}" >
                                                                                                                                        <img width="240" height="160" id="imageup4st" name="imageup4st" src="${estate.image4st}" alt="Product Image" /> 
                                                                                                                                    </c:if>
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
                                                                                                                                    <c:if test="${estate.image5st== ''}" >
                                                                                                                                        <img width="240" height="160" id="imageup5st" name="imageup5st" src="http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg" alt="Product Image" /> 
                                                                                                                                    </c:if>
                                                                                                                                    <c:if test="${estate.image5st!= ''}" >
                                                                                                                                        <img width="240" height="160" id="imageup5st" name="imageup5st" src="${estate.image5st}" alt="Product Image" /> 
                                                                                                                                    </c:if>
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
                                                                                                    <div id="checkbox" class="checkbox">

                                                                                                        <c:forEach items="${listEeatures}" var="listEeatures">
                                                                                                            <input value="${listEeatures.featuresId}"  type="checkbox" name="feature${listEeatures.featuresId}" id="${listEeatures.featuresId}" >
                                                                                                            <label for="${listEeatures.featuresId}" style="margin-right: 100px;">${estate.featureDetailsList}-${listEeatures.featureName}</label>
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
                                                            </div>

                                                            <!-- end modal -->
                                                            <a class="pull-left inline-block mr-15" href="#">
                                                                <i class="zmdi zmdi-delete txt-light"></i>
                                                            </a>
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
                                                                    <span class="txt-dark"> ${estate.address2}</span>
                                                                </div>
                                                                <div>
                                                                    <span class="inline-block capitalize-font mr-5">Giá bán:</span>
                                                                    <span class="txt-dark">
                                                                        <c:if test="${estate.estateStatusId.id == 2 || estate.estateStatusId.id == 5}">
                                                                            ${estate.price/1000000000} Tỷ VND
                                                                        </c:if>
                                                                        <c:if test="${estate.estateStatusId.id == 1 || estate.estateStatusId.id == 4}">
                                                                            ${estate.price/1000000} Triệu VND
                                                                        </c:if>
                                                                    </span>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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


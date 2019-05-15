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
                                                                                                <form method="POST" action="<%=request.getContextPath()%>/EstateEdit" class="form form--flex form--property form--basic js-form-property-1">
                                                                                                    <div id="example-basic">
                                                                                                        <h3><span class="head-font capitalize-font">Thông tin cơ bản</span></h3>
                                                                                                        <section>
                                                                                                            <div class="row">
                                                                                                                <div class="col-md-6">
                                                                                                                    <div class="form-group">
                                                                                                                        <label class="control-label mb-10">Tiêu đề bán</label>
                                                                                                                        <input type="text" id="estateName" value="${item.estateId.estateName}" class="form-control" name="estateName">
                                                                                                                        <input type="hidden" id="estateID" value="${item.estateId.id}" class="form-control" name="estateID">
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
                                                                                                                        <div class="form-group">
                                                                                                                            <label class="control-label mb-10">Garages </label> (m<sup>2</sup>)
                                                                                                                            <input type="number" value="${item.estateId.garages}"  class="form-control" name="garages">
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-6">
                                                                                                                    <div class="form-group">
                                                                                                                        <div class="form-group">
                                                                                                                            <label class="control-label mb-10">Giá</label>
                                                                                                                            <input type="number"  value="${item.estateId.price}" class="form-control" name="price">
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-6">
                                                                                                                    <div class="form-group">
                                                                                                                        <div class="form-group">
                                                                                                                            <label class="control-label mb-10">Diện tích </label>(m<sup>2</sup>)
                                                                                                                            <input type="number" id="estateName" value="${item.estateId.areas}" class="form-control" name="areas">
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
                                                                                                                        <select class="form-control" name="estateStatusId">
                                                                                                                            <option value="1" ${item.estateId.estateStatusId.id=='1' ? 'selected':''}>Cho Thuê</option>
                                                                                                                            <option value="2" ${item.estateId.estateStatusId.id=='2' ? 'selected':''}>Cho Bán</option>
                                                                                                                        </select>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-6">
                                                                                                                    <div class="form-group">
                                                                                                                        <div class="form-group">
                                                                                                                            <label class="control-label mb-10">Địa chỉ 1</label>
                                                                                                                            <input type="text" value="${item.estateId.address1}" id="estateName" class="form-control" name="address1">
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-6">
                                                                                                                    <div class="form-group">
                                                                                                                        <div class="form-group">
                                                                                                                            <label class="control-label mb-10">Địa chỉ 2</label>
                                                                                                                            <input type="text" value="${item.estateId.address2}" id="estateName" class="form-control" name="address2">
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
                                                                                                                    <div class="form-group">
                                                                                                                        <fmt:formatDate pattern="dd-MM-yyyy" value="${item.estateId.yearBuild}" var="date" ></fmt:formatDate>
                                                                                                                            <label class="control-label mb-10">Năm xây </label> <span class="text-muted">(dd/mm/yyyy)</span> 
                                                                                                                            <input name="yearBuild"  type="text" placeholder="" data-mask="99/99/9999" class="form-control">
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                    <div class="col-md-6">
                                                                                                                        <div class="form-group">
                                                                                                                            <label class="control-label mb-10 text-left">Nội dung</label>
                                                                                                                            <textarea class="form-control" rows="5" name="estateDescription">${item.estateId.estateContent}</textarea>
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


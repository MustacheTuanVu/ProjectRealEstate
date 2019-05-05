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
                        <div class="col-sm-12">
                            <div class="panel panel-default card-view">
                               
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body">
                                        <form method="POST" action="<%=request.getContextPath()%>/ProjectCreate" class="form form--flex form--property form--basic js-form-property-1">
                                            
                                                <h3><span class="head-font capitalize-font">Thông tin cơ bản</span></h3>
                                                
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label mb-10">Tên Dự Án</label>
                                                                <input id="in-1" required type="text" name="projectName" data-placeholder="---" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label mb-10">Số Block</label>
                                                                <input id="in-10" type="number" name="blockNumber" placeholder="" required class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label mb-10">Địa Chỉ</label>
                                                                <input id="in-6" type="text" name="address" required class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label mb-10">Số Tầng</label>
                                                                <input id="in-10" type="number" name="floorNumber" placeholder="" required class="form-control">
                                                            </div>

                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div class="form-group">
                                                                    <label class="control-label mb-10">Thời Gian Hoàn Thành</label>
                                                                    <input name="yearBuild" type="text" id="in-datetime" value="01/01/2019" data-time-picker="false" data-single-picker="true" class="js-datetimerange form-control">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div class="form-group">
                                                                    <label class="control-label mb-10">Giới Thiệu Dự Án</label>
                                                                    <textarea id="in-6" name="projectContent" rows="4" cols="50" class="form-control"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                       
                                                <h3><span class="head-font capitalize-font">Hình ảnh</span></h3>
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
                                                <input type="submit" name="submit" value="Tạo Dự Án" class="btn btn--default"/>
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


<%-- 
    Document   : edit_blog
    Created on : May 4, 2019, 9:46:32 PM
    Author     : Cuong
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
            function SetFileField(fileUrl) {
                var countimage = 0;
                if (document.getElementById('imageup1st').src === "http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg") {
                    document.getElementById('image1st').value = fileUrl;
                    document.getElementById('imageup1st').src = fileUrl;
                    document.getElementById('countimage').innerHTML = "Bất động sản có 1 đến 5 hình ảnh";
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
                                        <h2 class="panel-title txt-dark">Chi Tiết Bài Viết</h2>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body">
                                        <form method="POST" action="<%=request.getContextPath()%>/EditBlog?idPost=${post.postId}" class="form form--flex form--property form--basic js-form-property-1">

                                            <div class="form-group">
                                                <input type="hidden"  name="txtID" />
                                                <label for="in-article-title" class="control-label">Hình ảnh bài viết <span id="errImg1" style="color: red; padding-left: 10px"></span> </label>
                                                <br/>
                                                <img  onchange="return checkForm()" src="${post.postImage}" onclick="BrowseServer1()" id="imageup1st" alt="avatar" width="208" height="208">
                                                <input  onchange="return checkForm()" type="hidden"  id="image1st" name="txtImg"/>

                                            </div>
                                            <div class="form-group">
                                                <label for="in-article-title" class="control-label">Tiêu đề <span  style="color: red; padding-left: 10px" id="errTitle1"></span></label>

                                                <input type="text" value="${post.postTilte}" onchange="return checkForm()"  name="title" id="in-article-title" class="form-control">

                                            </div>
                                            <div class="form-group">

                                                <label for="in-article-title" class="control-label">Nội Dung</label>

                                                <select name="cat" id="in-2">
                                                    <c:forEach items="${list}" var="cat" >
                                                        <option value="${cat.categoryId}" ${cat.categoryId==post.postCategory.categoryId ? 'selected':''}  class="form-control">${cat.categoryName}</option> 
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">

                                                <label for="in-article-title" class="control-label">Mô tả <span style="color: red ; padding-left: 10px" id="errDes1"></span></label>

                                                <textarea  onchange="return checkForm()" id="txtDes" name="editor1" class="form-control js-ckeditor">${post.postContent}</textarea>
                                            </div>
                                            <button onclick="return confirm('Bạn Có Muốn Thay Đổi !!!')" type="submit" class="form__submit">Lưu Thay Đổi</button>
                                            <button type="button" class="form__submit" data-dismiss="modal">Thoát</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Row -->
                </div>
                <div id="myModalFail" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>

                                <h4 class="modal-title"> <strong>Lưu tên bài viết hoàn thành !!!</strong></h4>

                                <img src="<%=request.getContextPath()%>/assets/media-demo/oke.png" style="margin-left: 60px;" width="150" height="150" alt="error">
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

        <script >
            function checkTextaere(var123) {
                var txtDes = document.getElementById('txtDes').value;
                console.log('12345 ' + txtDes);
                console.log('123456 ' + var123);
            }
            function checkForm() {
                var txtImg = document.getElementById('image1st').value;
                var txtTitle = document.getElementById('in-article-title').value;
                var txtDes = document.getElementById('txtDes').value;
                console.log('123 ' + txtDes);
                txtTitle = txtTitle.replace(/^\s+|\s+$/g, "");
                txtDes = txtDes.replace(/^\s+|\s+$/g, "");
                if (txtImg.length === 0) {
                    document.getElementById('errImg1').innerHTML = 'Vui lòng chọn hình ảnh !!!';
                } else {
                    document.getElementById('errImg1').innerHTML = '';
                }
                if (txtTitle.length > 51 || txtTitle.length < 5) {
                    document.getElementById('errTitle1').innerHTML = 'Tiêu đề phải từ 6 đến 50 kí tự !!!';
                } else {
                    document.getElementById('errTitle1').innerHTML = '';
                }
                if (txtDes.length < 100) {
                    document.getElementById('errDes1').innerHTML = 'Mô tả ít nhất 200 kí tự !!!';
                } else {
                    document.getElementById('errDes1').innerHTML = '';
                    return true;
                }
                return false;
            }
        </script>
        <script src="//cdn.ckeditor.com/4.5.6/standard-all/ckeditor.js"></script>
        <script>
            // Note: in this sample we use CKEditor with two extra plugins:
            // - uploadimage to support pasting and dragging images,
            // - image2 (instead of image) to provide images with captions.
            // Additionally, the CSS style for the editing area has been slightly modified to provide responsive images during editing.
            // All these modifications are not required by CKFinder, they just provide better user experience.
            if (typeof CKEDITOR !== 'undefined') {
                CKEDITOR.addCss('img {max-width:100%; height: auto;}');
                var editor = CKEDITOR.replace('editor1', {
                    extraPlugins: 'uploadimage,image2',
                    removePlugins: 'image',
                    height: 350
                });
                // Just call CKFinder.setupCKEditor and pass the CKEditor instance as the first argument.
                // The second parameter (optional), is the path for the CKFinder installation (default = "/ckfinder/").
                // NOTE POINT
                CKFinder.setupCKEditor(editor, {basePath: '<%=request.getContextPath()%>/ckfinder/'});
                // It is also possible to pass an object with selected CKFinder properties as a second argument.
                // CKFinder.setupCKEditor( editor, { basePath : '../', skin : 'v1' } ) ;
            } else {
                document.getElementById('description').innerHTML = '<div class="tip-a tip-a-alert">This sample requires working Internet connection to load CKEditor from CDN.</div>'
            }
        </script>
        <script type="text/javascript" >
            function BrowseServer()
            {
                // You can use the "CKFinder" class to render CKFinder in a page:
                var finder = new CKFinder();
                finder.basePath = '../';	// The path for the installation of CKFinder (default = "/ckfinder/").
                finder.selectActionFunction = SetFileField;
                finder.popup();
            }
            function SetFileField(fileUrl)
            {
                document.getElementById('xFilePath').value = fileUrl;
            }
        </script>
        <script type="text/javascript">
            $(window).on('load', function () {
                $('#myModal').modal('${myModal}');
            });
        </script>
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
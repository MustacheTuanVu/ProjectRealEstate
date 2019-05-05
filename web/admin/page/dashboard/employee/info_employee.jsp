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
                            <h3 class="txt-dark">Thông Tin Cá Nhân</h3>
                        </div>
                        <!-- Breadcrumb -->
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <ol class="breadcrumb">
                                <li><a href="<%=request.getContextPath()%>/Employee">Admin</a></li>
                                <li><a href="<%=request.getContextPath()%>/EditEmployee">Thông Tin Cá Nhân</a></li>
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
                                        <div class="col-md-12">
                                            <!-- start form -->
                                            <form onsubmit="return KiemTraBatBuoc()" method="POST" action="CustomerDetails" class="form form--flex form--property form--basic js-form-property-1">

                                                <div id="form-block-1" class="form__block js-form-block">

                                                    <img src="${customer.employeeImg}" onclick="BrowseServer1()" id="imageup1st" alt="avatar" width="208" height="208">

                                                    <input type="hidden" value="${customer.employeeImg}" id="image1st" name="txtImg"/>
                                                    <div class="row">
                                                        <div class="form-group" style="display:none">
                                                            <label for="in-1" class="control-label mb-10 text-left">ID</label>
                                                            <input id="in-1" value="${customer.id}" readonly name="txtID" data-placeholder="---" value="Lara Group Agency" class="form-control">

                                                        </div>
                                                        <div class="form-group">
                                                            <label for="in-2" class="control-label mb-10 text-left">Họ Tên</label>
                                                            <input  id="in-2" value="${customer.employeeName}" required name="txtName" data-placeholder="---" value="Lara Group Agency" class="form-control">
                                                            <span id="tb-hoten"></span>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="in-3" class="control-label mb-10 text-left">Chứng Minh Nhân Dân</label>
                                                            <input <c:if test="${customer.employeeIndentityCard != 'wait'}"> </c:if> id="in-3" value="${customer.employeeIndentityCard}" required name="txtCard" data-placeholder="---" value="Lara Group Agency" class="form-control">
                                                                <span id="tb-cmnd"></span>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="in-4" class="control-label mb-10 text-left">Địa Chỉ</label>
                                                                <input id="in-4" value="${customer.employeeAddress}" required name="txtAddress" data-placeholder="---" value="Lara Group Agency" class="form-control">
                                                            <span id="tb-diachi"></span>
                                                            <!-- end of block .form-property__control-->
                                                        </div>
                                                    </div>
                                                </div>
                                                <header class="form__header">
                                                    <h3 data-rel="#form-block-2" class="form__title js-form-title">Liên Hệ</h3>
                                                </header>
                                                <div id="form-block-2" class="form__block js-form-block">
                                                    <div class="row">
                                                        <div class="form-group">
                                                            <label for="in-11" class="control-label mb-10 text-left">Điện Thoại</label>
                                                            <input id="in-11" name="txtPhone" value="${customer.employeePhone}" type="tel" required value="adam.svenson@realtyspace.com" class="form-control">
                                                            <span id="tb-dienthoai"></span>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="in-12" class="control-label mb-10 text-left">Email</label>
                                                            <input id="in-12" name="txtMail" value="${customer.employeeMail}" type="email" placeholder="" required value="adam.svenson@realtyspace.com" class="form-control">
                                                            <span id="tb-email"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <header class="form__header">
                                                    <h3 data-rel="#form-block-3" class="form__title js-form-title">Giới Thiệu Bản Thân</h3>
                                                </header>
                                                <div id="form-block-3" class="form__block js-form-block">
                                                    <div class="row">
                                                        <div class="form-group form-group--description">
                                                            <label for="in-13" class="control-label mb-10 text-left">Mô Tả</label>
                                                            <textarea id="in-13" name="txtContent" required data-parsley-trigger="keyup" data-parsley-minlength="200" data-parsley-validation-threshold="10" data-parsley-minlength-message="You need to enter at least a 200 caracters long comment.." class="form-control form-control--description">${customer.employeeContent}</textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <input type="hidden" value="${customer.employeeImg}" id="image1st" name="txtImg"/>
                                                    <button class="form__submit" id="btnLuu">Lưu</button>
                                                </div>
                                            </form>
                                            <hr>
                                            <form method="POST" onsubmit="return checkPass()" action="EditEmployee" class="form form--flex">
                                                <header class="form__header">
                                                    <h3 data-rel="#form-block-5" class="form__title js-form-title">Thay đổi mật khẩu</h3>
                                                </header>
                                                <div id="form-block-5" class="form__block js-form-block">
                                                    <div class="row">
                                                        <div class="col-sm-12 col-md-6 col-lg-4">
                                                            <div class="row">
                                                                <div class="form-group ${hasError}">
                                                                    <label for="in-14" class="control-label mb-10 text-left">Mật Khẩu Hiện Tại</label>
                                                                    <input id="in-14" type="password" name="txtOldPass" data-placeholder="---" value="" class="form-control">
                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${display}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group" id="txtNewPass">
                                                                    <label for="in-15"  class="control-label mb-10 text-left">Mật Khẩu Mới</label>
                                                                    <input id="in-15" type="password" required name="txtNewPass" data-placeholder="---" value="" class="form-control">
                                                                    <div id="errPass" class="parsley-required"></div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="in-16" class="control-label mb-10 text-left">Nhập Lại Mật Khẩu Mới</label>
                                                                    <input id="in-16" type="password" required name="txtConfirm" data-placeholder="---" value="" class="form-control">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-12 col-md-6 col-lg-8">
                                                            <h5>HINT</h5>
                                                            <p>
                                                                Gợi ý mật khẩu. Một lời nhắc nhở cho bạn về cách bạn tạo mật khẩu của bạn. Một số hệ thống cho phép bạn nhập một gợi ý mật khẩu để nếu bạn quên mật khẩu, gợi ý sẽ được hiển thị để giúp chạy bộ nhớ của bạn. Ví dụ: nếu mật khẩu của bạn là ngày sinh nhật của con bạn, bạn có thể sử dụng "Alfred" hoặc "Nicole" làm lời nhắc.
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <button type="button" value="Save password" class="form__submit" >Lưu</button>
                                                </div>
                                            </form>
                                            <!-- end form -->
                                        </div>
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
        <!--
            name : min 5 ky tu, max 20
            address: min 20, max 100
            about me: min 100, max 250
        -->
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


        <script type="text/javascript">
                                                var TB_SPACE = "Vui lòng nhập vào kí tự";
                                                var TB_KITU = "Vui lòng nhập số kí tự trong khoảng";
                                                var TB_SO = "Vui lòng kiểm tra số điện thoại";
                                                var TB_Email = "Vui lòng kiểm tra lại email";
                                                function KiemTraSoKiTu(idTextBox, idThongBao, minLength,
                                                        maxLength, thongBao) {
                                                    //alert('OK2'); 
                                                    // var giaTri = $(idTextBox).val();
                                                    var giaTri = document.getElementById(idTextBox).value;
                                                    var tag = document.getElementById(idThongBao);
                                                    if (giaTri.length < minLength || giaTri.length > maxLength) {
                                                        tag.style.display = "block";
                                                        tag.innerHTML = thongBao + " " + minLength + "> " + maxLength;
                                                        return false;
                                                    } else {
                                                        tag.style.display = "none";
                                                        return true;
                                                    }
                                                }
                                                function KiemTraSoDienThoai(idTextBox, idThongBao, thongBao) {
                                                    var giaTri = document.getElementById(idTextBox).value;
                                                    var tag = document.getElementById(idThongBao);
                                                    var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
                                                    if (vnf_regex.test(giaTri)) {
                                                        tag.style.display = "none";
                                                        return true;
                                                    } else {
                                                        tag.style.display = "block";
                                                        tag.innerHTML = thongBao;
                                                        return false;
                                                    }
                                                }
                                                function KiemTraEmail(idTextBox, idThongBao, thongBao) {
                                                    var patt =/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                                                    var giaTri = $('#' + idTextBox).val();
                                                    console.log(giaTri);
                                                    var tag = document.getElementById(idThongBao);
                                                    if (patt.test(giaTri)) {
                                                        tag.style.display = "none";
                                                        return true;
                                                    } else {
                                                        tag.style.display = "block";                                      
                                                        tag.innerHTML = thongBao;
                                                        return false;
                                                    }
                                                }
                                                function KiemTraBatBuoc() {
                                                    if (KiemTraSoKiTu('in-2', 'tb-hoten', 5, 20, TB_KITU) 
                                                            && KiemTraSoKiTu('in-4', 'tb-diachi', 20, 100, TB_KITU) 
                                                            && KiemTraSoDienThoai('in-11', 'tb-dienthoai', TB_SO)
                                                            && KiemTraEmail('in-12','tb-email',TB_Email)) {
                                                        return true;
                                                    } else {
                                                        return false;
                                                    }
                                                }
//            $('#btnLuu').click(function(){{
//                 KiemTraSoKiTu('in-2', 'tb-hoten', 5, 15, TB_SPACE);
//                 alert('OK');
//            })
                                                //document.getElementById("btnLuu").addEventListener("click",function(){
                                                //alert('OK');
                                                //KiemTraSoKiTu('in-2', 'tb-hoten', 5, 15, TB_SPACE);

                                                //});
        </script>
    </body>

</html>


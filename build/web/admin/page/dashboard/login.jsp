<%-- 
    Document   : login
    Created on : Mar 30, 2019, 4:41:11 PM
    Author     : kiems
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <title>Login</title>
        <meta name="description" content="Doodle is a Dashboard & Admin Site Responsive Template by hencework." />
        <meta name="keywords" content="admin, admin dashboard, admin template, cms, crm, Doodle Admin, Doodleadmin, premium admin templates, responsive admin, sass, panel, software, ui, visualization, web app, application" />
        <meta name="author" content="hencework"/>

        <!-- Favicon -->
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <!-- vector map CSS -->
        <link href="<%=request.getContextPath()%>/admin/vendors/bower_components/jasny-bootstrap/dist/css/jasny-bootstrap.min.css" rel="stylesheet" type="text/css"/>



        <!-- Custom CSS -->
        <link href="<%=request.getContextPath()%>/admin/dist/css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--Preloader-->
        <div class="preloader-it">
            <div class="la-anim-1"></div>
        </div>
        <!--/Preloader-->

        <div class="wrapper pa-0">
            <header class="sp-header">
                <div class="sp-logo-wrap pull-left">
                    <a href="index.html">
                        <img class="brand-img mr-10" src="<%=request.getContextPath()%>/admin/dist/img/logo.png" alt="brand"/>
                        <span class="brand-text">doodle</span>
                    </a>
                </div>
                <div class="clearfix"></div>
            </header>

            <!-- Main Content -->
            <div class="page-wrapper pa-0 ma-0 auth-page">
                <div class="container-fluid">
                    <!-- Row -->
                    <div class="table-struct full-width full-height">
                        <div class="table-cell vertical-align-middle auth-form-wrap">
                            <div class="auth-form  ml-auto mr-auto no-float">
                                <div class="row">
                                    <div class="col-sm-12 col-xs-12">
                                        <div class="mb-30">
                                            <h3 class="text-center txt-dark mb-10">SGEstate24h</h3>
                                            <h6 class="text-center nonecase-font txt-grey">Đăng nhập</h6>
                                        </div>	
                                        <div class="form-wrap">
                                            <form id="loginForm" method="POST">
                                                <div id="usernameForm" class="form-group">
                                                    <label class="control-label mb-10" for="exampleInputEmail_2">Tên đăng nhập</label>
                                                    <input type="text" name="username" class="form-control" id="username" placeholder="Nhập tên đăng nhập">
                                                    <div id="usernameMessage" class="help-block with-errors"></div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="pull-left control-label mb-10" for="exampleInputpwd_2">Mật khẩu</label>
                                                    <a class="capitalize-font txt-primary block mb-10 pull-right font-12" href="forgot-password.html">quên mật khẩu ?</a>
                                                    <div class="clearfix"></div>
                                                    <input type="password" name="password" id="password" class="form-control" required="" placeholder="Nhập mật khẩu">
                                                    <div id="passwordMessage" class="help-block with-errors"></div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="checkbox checkbox-primary pr-10 pull-left">
                                                        <input id="checkbox_2" type="checkbox">
                                                        <label for="checkbox_2"> Ghi nhớ đăng nhập</label>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="form-group text-center">
                                                    <button type="submit" id="login" class="btn btn-info btn-rounded">đăng nhập</button>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- sample modal content -->
                                        <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="display: none;">
                                            <div class="modal-dialog modal-sm">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h5 class="modal-title" id="mySmallModalLabel">Đăng nhập thất bại</h5>
                                                    </div>
                                                    <div class="modal-body"> Bạn đã sai mật khẩu hoặc password </div>
                                                </div>
                                                <!-- /.modal-content -->
                                            </div>
                                            <!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.modal -->
                                    </div>	
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Row -->	
                </div>

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

        <!-- Slimscroll JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/dist/js/jquery.slimscroll.js"></script>

        <!-- Init JavaScript -->
        <script src="<%=request.getContextPath()%>/admin/dist/js/init.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $(window).on('load', function () {
                    $('.bs-example-modal-sm').modal('${modal}');
                });
            });

        </script>

    </body>
</html>


<%-- 
    Document   : project_list
    Created on : Apr 23, 2019, 11:16:28 AM
    Author     : Cuong
--%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/vendor.css">
        <!-- endbuild-->
        <!-- Font-awesome lib-->
        <!-- build:cssfontawesome-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/font-awesome.css">
        <!-- endbuild-->
        <!-- Theme styles, please replace "default" with other color scheme from the list available in template/css-->
        <!-- build:csstheme-default-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/theme-default.css">
        <!-- endbuild-->
        <!-- Your styles should go in this file-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/custom.css">
        <!-- Fixes for IE-->
        <!--[if lt IE 11]>
        <link rel="stylesheet" href="assets/css/ie-fix.css"><![endif]-->
        <link rel="icon" href="<%=request.getContextPath()%>/assets/img/favicon.ico" type="image/x-icon">
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
                <p id="wellcomepage" style="display: none">Đây là trang "Danh sách bất động sản"</p>
                <div class="container-fluid pt-25">
                    <!-- Title -->
                    <div class="row heading-bg">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h3 class="txt-dark">DỰ ÁN</h3>
                        </div>
                        <!-- Breadcrumb -->
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <ol class="breadcrumb">
                                <li><a href="<%=request.getContextPath()%>/Employee">Quản Lý</a></li>
                                <li><a href="<%=request.getContextPath()%>/EstateList?user=employee">Dự Án</a></li>
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
                                        Chi Tiết Dự Án 
                                    </h3>
                                    <div class="input-group">
                                        <!-- BEGIN LISTING-->
                        <div class="site site--dashboard">
                            <div class="site__main">
                                <div class="widget js-widget widget--dashboard">
                                    <div class="widget__header">
                                        <h2 class="widget__title">Căn Hộ Mỗi Tầng</h2>
                                    </div>
                                    <div class="widget__content">
                                        <section class="form-property form-property--dashboard">
                                            <!-- Nav tabs-->
                                            <ul role="tablist" class="nav form-property__tabs">
                                                <c:forEach begin="1" end="${floorNumber}" var="item">
                                                    <li role="presentation" <c:if test="${item == '1'}">class="active"</c:if> >
                                                        <a href="#Floor${item}" aria-controls="Floor${item}" role="tab" data-toggle="tab">
                                                            Tầng ${item}
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                            <form action="<%=request.getContextPath()%>/EstateAutoCreate" class="form form--flex form--property form--basic js-form-property-1">
                                                <div class="tab-content form-property__content" style="display: ${getEstate}">
                                                    <c:forEach begin="1" end="${floorNumber}" var="item">
                                                        <div id="Floor${item}" role="tabpanel" class="tab-pane <c:if test="${item == '1'}">active</c:if>" >
                                                                <div>
                                                                    <h2>Tầng ${item}</h2>
                                                            </div>
                                                            <input type="hidden" name="block" value="${block}">
                                                            <input type="hidden" name="estateNumber" value="${estateNumber}">
                                                            <input type="hidden" name="estateNumber" value="${estateNumber}">
                                                            <input type="hidden" name="estateNumbers" value="${estateNumbers}">
                                                            <input type="hidden" name="projectID" value="${projectID}">
                                                            <div class="row">
                                                                <div class="form-group form-group ${hasError}">
                                                                    <label for="in-1" class="control-label">Số Căn Hộ Loại 1</label>
                                                                    <input onchange="changetypeNumberFloorF${item}Type1()" id="typeNumberFloorF${item}Type1" required type="number" name="typeNumberFloorF${item}Type1" value="${estateNumbers}" class="form-control">
                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group ${hasError}">
                                                                    <label for="in-1" class="control-label">Số Căn Hộ Loại 2</label>
                                                                    <input onchange="changetypeNumberFloorF${item}Type2()" id="typeNumberFloorF${item}Type2" required type="number" name="typeNumberFloorF${item}Type2" value="0"  class="form-control">
                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group ${hasError}">
                                                                    <label for="in-1" class="control-label">Số Căn Hộ Loại 3</label>
                                                                    <input onchange="changetypeNumberFloorF${item}Type3()" id="typeNumberFloorF${item}Type3" required type="number" name="typeNumberFloorF${item}Type3" value="0"  class="form-control">
                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group form-group ${hasError}">
                                                                    <label for="in-1" class="control-label">Giá Tầng ${item}A</label>

                                                                    <input id="priceB${blocks}F${item}Type1" onchange="changepriceB${blocks}F${item}Type1()" type="number" name="priceB${blocks}F${item}Type1" data-placeholder="---"  class="form-control">

                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group ${hasError}">
                                                                    <label for="in-1" class="control-label">Giá Tầng ${item}B</label>
                                                                    <input id="priceB${blocks}F${item}Type2" onchange="priceB${blocks}F${item}Type2()" required type="number" name="priceB${blocks}F${item}Type2" data-placeholder="---"  class="form-control">
                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group ${hasError}">
                                                                    <label for="in-1" class="control-label">Giá Tầng ${item}C</label>
                                                                    <input id="priceB${blocks}F${item}Type3" onchange="priceB${blocks}F${item}Type3()" required type="number" name="priceB${blocks}F${item}Type3" data-placeholder="---"  class="form-control">
                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group form-group ${hasError}">
                                                                    <label for="in-1" class="control-label">Phòng Ngủ Tầng ${item}A</label>

                                                                    <input onchange="changebedRoomB${blocks}F${item}Type1()" id="bedRoomB${blocks}F${item}Type1" required type="number" name="bedRoomB${blocks}F${item}Type1" data-placeholder="---"  class="form-control">

                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group ${hasError}">
                                                                    <label for="in-1" class="control-label">Phòng Ngủ Tầng ${item}B</label>
                                                                    <input id="bedRoomB${blocks}F${item}Type2" required type="number" name="bedRoomB${blocks}F${item}Type2" data-placeholder="---"  class="form-control">
                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group ${hasError}">
                                                                    <label for="in-1" class="control-label">Phòng Ngủ Tầng ${item}C</label>
                                                                    <input id="bedRoomB${blocks}F${item}Type3" required type="number" name="bedRoomB${blocks}F${item}Type3" data-placeholder="---"  class="form-control">
                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group form-group ${hasError}">
                                                                    <label for="in-1" class="control-label">Phòng Vệ Sinh ${item}A</label>

                                                                    <input onchange="changebathRoomB${blocks}F${item}Type1()" id="bathRoomB${blocks}F${item}Type1" required type="number" name="bathRoomB${blocks}F${item}Type1" data-placeholder="---"  class="form-control">

                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group ${hasError}">
                                                                    <label for="in-1" class="control-label">Phòng Vệ Sinh ${item}B</label>
                                                                    <input id="bathRoomB${blocks}F${item}Type2" required type="number" name="bathRoomB${blocks}F${item}Type2" data-placeholder="---"  class="form-control">
                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group ${hasError}">
                                                                    <label for="in-1" class="control-label">Phòng Vệ Sinh ${item}C</label>
                                                                    <input id="bathRoomB${blocks}F${item}Type3" required type="number" name="bathRoomB${blocks}F${item}Type3" data-placeholder="---"  class="form-control">
                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group form-group ${hasError}">
                                                                    <label for="in-1" class="control-label">Diện Tích Tầng ${item}A</label>

                                                                    <input onchange="changeareasB${blocks}F${item}Type1()" id="areasB${blocks}F${item}Type1" required type="number" name="areasB${blocks}F${item}Type1" data-placeholder="---"  class="form-control">

                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group ${hasError}">
                                                                    <label for="in-1" class="control-label">Diện Tích Tầng ${item}B</label>
                                                                    <input id="areasB${blocks}F${item}Type2" required type="number" name="areasB${blocks}F${item}Type2" data-placeholder="---"  class="form-control">
                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group ${hasError}">
                                                                    <label for="in-1" class="control-label">Diện Tích Tầng ${item}C</label>
                                                                    <input id="areasB${blocks}F${item}Type3" required type="number" name="areasB${blocks}F${item}Type3" data-placeholder="---"  class="form-control">
                                                                    <div class="help-block filled" id="parsley-id-11" style="display: ${hasError}">
                                                                        <div class="parsley-required">${message}</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <input type="hidden" id="employeeB${blocks}F${item}ID" name="employeeB${blocks}F${item}" value="">
                                                                <label id="employeeB${blocks}F${item}Name"></label>
                                                                <img id="employeeB${blocks}F${item}Image" src="123" alt="photoe" class="photo">
                                                                <button type="button" class="button__default" data-toggle="modal" data-target="#myModal${item}">Nhân Viên</button>
                                                                <div class="modal fade" id="myModal${item}" role="dialog">
                                                                    <div class="modal-dialog">

                                                                        <!-- Modal content-->
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <div class="listing listing--grid">
                                                                                    <c:forEach items="${employeeList}" var="employee">
                                                                                        <div class="listing__item">
                                                                                            <div data-sr="enter bottom move 80px, scale(0), over 0.3s" data-animate-end="animate-end" class="worker js-unhide-block vcard worker--grid">
                                                                                                <div class="worker__photo">
                                                                                                    <a onclick="getEmployeeID${item}(${employee.id}, '${employee.employeeName}', '${employee.employeeImg}')" data-dismiss="modal" class="item-photo item-photo--static">
                                                                                                        <img src="${employee.employeeImg}" alt="Lisa Wemert" class="photo"/>
                                                                                                        <figure class="item-photo__hover">
                                                                                                            <span class="item-photo__more">Chọn</span>
                                                                                                        </figure>
                                                                                                    </a>
                                                                                                </div>
                                                                                                <div class="worker__intro">
                                                                                                    <h3 class="worker__name fn">${employee.employeeName}</h3>
                                                                                                    <div class="worker__post">Email: ${employee.employeeMail}</div>
                                                                                                    <div class="worker__post">SĐT ${employee.employeePhone}</div>
                                                                                                    <button type="button" class="worker__show js-unhide">Contact agent</button>
                                                                                                    <!-- end of block .worker__listings-->
                                                                                                </div>
                                                                                                <div class="worker__descr">
                                                                                                    <p>${employee.employeeAddress}.</p>
                                                                                                </div>
                                                                                                <!-- end of block .worker__descr-->
                                                                                                <a href="agent_profile.html" class="worker__more">more details</a>
                                                                                            </div>
                                                                                            <!-- end of block .worker-->
                                                                                        </div>
                                                                                    </c:forEach>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">

                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <a href="#Floor${item-1}" aria-controls="Floor${item-1}" class="form__submit" role="tab" data-toggle="tab">Trở Về</a>
                                                                <c:if test="${floorNumber == item}">
                                                                    <button type="submit" name="getEstate" value="getEstate" class="form__submit">Xác Nhận</button>
                                                                </c:if>
                                                                <c:if test="${floorNumber != item}">
                                                                    <a href="#Floor${item+1}" aria-controls="Floor${item+1}" class="form__submit" role="tab" data-toggle="tab">Tiếp Tục</a>
                                                                </c:if>
                                                            </div>

                                                        </div>
                                                        <script>
                                                            function getEmployeeID${item}(employeeID, employeeName, employeeImg) {
                                                                console.log(employeeID);
                                                                console.log(employeeName);
                                                                console.log(employeeImg);
                                                                document.getElementById("employeeB${blocks}F${item}ID").value = employeeID;
                                                                document.getElementById("employeeB${blocks}F${item}Name").innerHTML = employeeName;
                                                                document.getElementById("employeeB${blocks}F${item}Image").src = employeeImg;
                                                                console.log(document.getElementById("employeeBAF1ID").value);
                                                            };
                                                            
                                                            function changetypeNumberFloorF${item}Type1(){
                                                                var typeNumberFloorF${item}Type1 = parseInt(document.getElementById("typeNumberFloorF${item}Type1").value);
                                                                document.getElementById("typeNumberFloorF${item}Type2").value = parseInt(${estateNumbers}) - typeNumberFloorF${item}Type1;
                                                            };
                                                            function changetypeNumberFloorF${item}Type2(){
                                                                var typeNumberFloorF${item}Type1 = parseInt(document.getElementById("typeNumberFloorF${item}Type1").value);
                                                                var typeNumberFloorF${item}Type2 = parseInt(document.getElementById("typeNumberFloorF${item}Type2").value);
                                                                document.getElementById("typeNumberFloorF${item}Type3").value = parseInt(${estateNumbers}) - typeNumberFloorF${item}Type1 - typeNumberFloorF${item}Type2;

                                                            };
                                                            
                                                            function changepriceB${blocks}F${item}Type1(){
                                                                var priceB${blocks}F${item}Type1 = document.getElementById("priceB${blocks}F${item}Type1").value;
                                                                document.getElementById("priceB${blocks}F${item}Type2").value = priceB${blocks}F${item}Type1;
                                                                document.getElementById("priceB${blocks}F${item}Type3").value = priceB${blocks}F${item}Type1;
                                                            };
                                                            
                                                            function changebedRoomB${blocks}F${item}Type1(){
                                                                var bedRoomB${blocks}F${item}Type1 = document.getElementById("bedRoomB${blocks}F${item}Type1").value;
                                                                document.getElementById("bedRoomB${blocks}F${item}Type2").value = bedRoomB${blocks}F${item}Type1;
                                                                document.getElementById("bedRoomB${blocks}F${item}Type3").value = bedRoomB${blocks}F${item}Type1;
                                                            };
                                                            function changebathRoomB${blocks}F${item}Type1(){
                                                                var bathRoomB${blocks}F${item}Type1 = document.getElementById("bathRoomB${blocks}F${item}Type1").value;
                                                                document.getElementById("bathRoomB${blocks}F${item}Type2").value = bathRoomB${blocks}F${item}Type1;
                                                                document.getElementById("bathRoomB${blocks}F${item}Type3").value = bathRoomB${blocks}F${item}Type1;
                                                            };
                                                            
                                                            function changeareasB${blocks}F${item}Type1(){
                                                                var areasB${blocks}F${item}Type1 = document.getElementById("areasB${blocks}F${item}Type1").value;
                                                                document.getElementById("areasB${blocks}F${item}Type2").value = areasB${blocks}F${item}Type1;
                                                                document.getElementById("areasB${blocks}F${item}Type2").value = areasB${blocks}F${item}Type1;

                                                            }
                                                        </script>
                                                    </c:forEach>
                                                </div>
                                            </form>
                                        </section>
                                        <!--
                                        <div class="widget__footer"><a class="widget__more">Show more properties</a></div>
                                        -->
                                    </div>
                                </div>
                            </div>
                        </div>
                                    </div>

                                </div>
                                <div class="clearfix"></div>
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



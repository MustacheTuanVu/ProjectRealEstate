<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head lang="en">
        <meta charset="UTF-8">
        <title>Realty Space - Real Estate Responsive HTML Theme</title><!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1"><![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0, shrink-to-fit=no">
        <meta name="format-detection" content="telephone=no">
        <!-- Loading Source Sans Pro font that is used in this theme-->
        <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700%7cSource+Sans+Pro:200,400,600,700,900,400italic,700italic&amp;subset=latin,latin-ext" rel="stylesheet" type="text/css">
        <!-- Boostrap and other lib styles-->
        <!-- build:cssvendor-->
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
    <body class="dashboard_property_new menu-default hover-default sidebar-left">
        <!--
        SVG icons from sprite-inline.svg
        They are inlined in order to make them work,
        when the template is opened directly, without
        web-server
        
        If you are loading theme files using a webserver,
        you can remove this code and set loadSvgWithAjax: true
        at the beginning of the file.
        
        Or you can use sprite.svg directly.
        All you need to do is to add "img/sprite.svg" before the icon name
        and connect svg4everybody (https://github.com/jonathantneal/svg4everybody) plugin for IE support
        
        For example:
        <use xlink:href="#icon-area"></use>
        becomes
        <use xlink:href="img/sprite.svg#icon-area"></use>
        
        --><!-- inject:svg -->
    <svg width="0" height="0" style="position:absolute"><symbol viewBox="0 0 264 88" id="default-skin"><g fill="none" fill-rule="evenodd"><path d="M67.002 59.5v3.768c-6.307.84-9.184 5.75-10.002 9.732 2.22-2.83 5.564-5.098 10.002-5.098V71.5L73 65.585 67.002 59.5zM13 29v-5h2v3h3v2h-5zm0-14h5v2h-3v3h-2v-5zm18 0v5h-2v-3h-3v-2h5zm0 14h-5v-2h3v-3h2v5zm31-5v5h-2v-3h-3v-2h5zm0-4h-5v-2h3v-3h2v5zm8 0v-5h2v3h3v2h-5zm0 4h5v2h-3v3h-2v-5zM20.586 66l-5.656-5.656 1.414-1.414L22 64.586l5.656-5.656 1.414 1.414L23.414 66l5.656 5.656-1.414 1.414L22 67.414l-5.656 5.656-1.414-1.414L20.586 66zm91.199-.97L110 63.5l3-3.5h-10v-2h10l-3-3.5 1.785-1.468L117 59l-5.215 6.03zm40.43 0L154 63.5l-3-3.5h10v-2h-10l3-3.5-1.785-1.468L147 59l5.215 6.03zm8.742-36.487l-3.25-3.25-1.413 1.414 3.25 3.25z" fill="#fff"/><path d="M152.5 27a5.5 5.5 0 1 0 0-11 5.5 5.5 0 1 0 0 11z" stroke="#fff" stroke-width="1.5"/><path fill="#fff" d="M150 21h5v1h-5zM116.957 28.543l-1.414 1.414-3.25-3.25 1.414-1.414 3.25 3.25z"/><path d="M108.5 27a5.5 5.5 0 1 0 0-11 5.5 5.5 0 1 0 0 11z" stroke="#fff" stroke-width="1.5"/><path fill="#fff" d="M106 21h5v1h-5z"/><path fill="#fff" d="M109.043 19.008l-.085 5-1-.017.085-5z"/></g></symbol><symbol viewBox="0 0 22 22" id="icon-add--favorites"><path d="M15.7 9.2l.5-.5-4.2-.6-1.9-3.8-1.8 3.8-4.2.6 3 3-.7 4.2 3.8-2 1.7.9c.6.8 1.6 1.3 2.7 1.3 1.9 0 3.5-1.6 3.5-3.5C18 11 17 9.7 15.7 9.2zM11 12.5c0 .2 0 .5.1.7l-.9-.5L7.7 14l.5-2.7-2-1.9L8.9 9l1.2-2.5L11.3 9l1.8.3c-1.2.5-2.1 1.7-2.1 3.2zm3.5 2.5c-1.4 0-2.5-1.1-2.5-2.5s1.1-2.5 2.5-2.5 2.5 1.1 2.5 2.5-1.2 2.5-2.5 2.5zm.5-4h-1v1h-1v1h1v1h1v-1h1v-1h-1v-1z"/></symbol><symbol viewBox="0 0 22 22" id="icon-add--gallery"><path d="M17.5 8c-.5 0-1.5.1-1.5.3V5H2v11h14v-1.3c0 .2 1 .3 1.5.3 1.9 0 3.5-1.6 3.5-3.5S19.4 8 17.5 8zM3 6h12v3c-1 .6-1 1.5-1 2.5 0 .5.2 1 .4 1.5h-.1L12 10.2l-1.9 2-3.1-4-4 4.5V6zm12 9H3v-1h.2l3.7-4.2 3 4.1 2-2.1 1.9 2.2H15v1zm2.5-1c-1.4 0-2.5-1.1-2.5-2.5S16.1 9 17.5 9s2.5 1.1 2.5 2.5-1.1 2.5-2.5 2.5zm.5-4h-1v1h-1v1h1v1h1v-1h1v-1h-1v-1z"/></symbol><symbol viewBox="0 0 22 22" id="icon-add--post"><path d="M12 8H5v1h7V8zm0 2H5v1h7v-1zm-7 3h4v-1H5v1zm10.5-3c-.5 0-1 .1-1.5.3V4H3v14h11v-1.3c.4.2.9.3 1.5.3 1.9 0 3.5-1.6 3.5-3.5S17.4 10 15.5 10zM13 17H4V5h9v6c-.6.6-1 1.5-1 2.5s.4 1.9 1 2.5v1zm2.5-1c-1.4 0-2.5-1.1-2.5-2.5s1.1-2.5 2.5-2.5 2.5 1.1 2.5 2.5-1.2 2.5-2.5 2.5zm.5-4h-1v1h-1v1h1v1h1v-1h1v-1h-1v-1z"/></symbol><symbol viewBox="0 0 22 22" id="icon-add--property"><path d="M17.5 5c-2 0-3.5 1.6-3.5 3.5s1.6 3.5 3.5 3.5S21 10.4 21 8.5 19.4 5 17.5 5zm0 6C16.1 11 15 9.9 15 8.5S16.1 6 17.5 6 20 7.1 20 8.5 18.8 11 17.5 11zm.5-4h-1v1h-1v1h1v1h1V9h1V8h-1V7zM.7 13.6l.5.8L4 12.7V18h10v-5.3l2.7 1.7.5-.8L9 8.4.7 13.6zM13 12.1V17H5v-4.9l4-2.5 4 2.5z"/></symbol><symbol viewBox="0 0 30 30" id="icon-add-listing"><path d="M18.2 1.2C14.8 1.2 12 4 12 7.4s2.8 6.2 6.2 6.2 6.2-2.8 6.2-6.2-2.8-6.2-6.2-6.2zm0 11.3c-2.8 0-5.2-2.3-5.2-5.2 0-2.8 2.3-5.2 5.2-5.2 2.8 0 5.2 2.3 5.2 5.2-.1 2.9-2.4 5.2-5.2 5.2zM5.7 28.8h12v-12l-12-5v17zm7-10h3v3h-3v-3zm0 5h3v3h-3v-3zm-5-5h3v3h-3v-3zm0 5h3v3h-3v-3zm11-19h-1v2h-2v1h2v2h1v-2h2v-1h-2v-2z"/></symbol><symbol viewBox="0 0 40 40" id="icon-agency"><path d="M21 9h-2v4h2V9zm4 0h-2v4h2V9zm-4 6h-2v4h2v-4zm4 0h-2v4h2v-4zm-4 6h-2v4h2v-4zm4 0h-2v4h2v-4zm-4 6h-2v4h2v-4zm9-11V4H14v15.2L0 22.8V36h40V16H30zM14 34H2v-9.6l12-3.1V34zm14 0H16V6h12v28zm10 0h-8V18h8v16zm-3-13h-2v4h2v-4zm0 6h-2v4h2v-4zm-10 0h-2v4h2v-4zM7 27H5v4h2v-4zm4 0H9v4h2v-4z"/></symbol><symbol viewBox="0 0 26 27" id="icon-area"><path d="M24 2v20h-8v-3H6v6H2V9h4v4h15V2h3m2-2h-7v11H8V7H0v20h8v-6h6v3h12V0z"/></symbol><symbol viewBox="0 0 20 20" id="icon-arrow-end"><path clip-rule="evenodd" fill="none" d="M.4 5.9l15.8-4.5 1.6 1.2 1.1 17"/></symbol><symbol preserveAspectRatio="xMidYMid" viewBox="0 0 21 40" id="icon-arrow-left"><path d="M20-.001L0 19.998l20 20.001"/></symbol><symbol preserveAspectRatio="xMidYMid" viewBox="0 0 21 40" id="icon-arrow-right"><path d="M1-.001l20 19.999L1 39.999"/></symbol><symbol viewBox="0 0 186 186" id="icon-avatar"><path d="M161.1 140.4c-26.5-6.1-51.2-11.5-39.3-34.1C158.2 37.6 131.4.8 93 .8 53.8.8 27.7 39 64.2 106.3c12.3 22.7-13.3 28.1-39.3 34.1C-1.6 146.6.4 160.6.4 186h185.1c.1-25.4 2.1-39.4-24.4-45.6z"/></symbol><symbol viewBox="0 0 26.8 20" id="icon-bathrooms"><path d="M5 10V2h5v2H9v3h4V4h-1V0H3v10H0v10h20.6l6.3-10H5zm14.4 8H2v-6h21.2l-3.8 6z"/></symbol><symbol viewBox="0 0 26 17" id="icon-bedrooms"><path d="M26 7h-3V0H3v7H0v8h2v2h2v-2h18v2h2v-2h2V7zM5 2h16v5h-2V5h-5v2h-2V5H7v2H5V2zm19 11H2V9h22v4z"/></symbol><symbol viewBox="0 0 30 30" id="icon-blog-edit"><path d="M8 10h7v2H8zm0 4h7v2H8zm0 4h4v2H8zm11 3h-4v-4l7.94-8.07 4.21 4.12zm-2-2h1.18l6.11-6L23 11.75l-6 6.07V19z"/><path d="M18.59 20H18v2H6V7h12v8.38l2-2.04V5H4v19h16v-5.38L18.59 20z"/></symbol><symbol viewBox="0 0 18 18" id="icon-captions-off"><path d="M1 2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h16a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H1zm1 12V4h14v10H2z"/></symbol><symbol viewBox="0 0 18 18" id="icon-captions-on"><path d="M1 2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h16a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H1zm1 12V4h14v10H2z"/><path d="M3 11h3v2H3zm9 0h3v2h-3zm-5 0h4v2H7z"/></symbol><symbol viewBox="0 0 22 22" id="icon-change--property"><path d="M5.7 13.6l.5.9L8 13.4V17h6v-3.6l1.7 1 .5-.9-5.2-3.1-5.3 3.2zm7.3-.8V16H9v-3.3l2-1.2 2 1.3zM18 8h-4v1h4c1.1 0 2 .9 2 2v3c0 1.1-.9 2-2 2h-1v1h1c1.7 0 3-1.3 3-3v-3c0-1.7-1.3-3-3-3zM6.4 11.3l2.3-2.8-2.3-2.8-.8.6L7 8H4c-1.7 0-3 1.3-3 3v3c0 1.7 1.3 3 3 3h1v-1H4c-1.1 0-2-.9-2-2v-3c0-1.1.9-2 2-2h3l-1.4 1.6.8.7z"/></symbol><symbol viewBox="0 0 30 30" id="icon-chat"><path d="M23 23.08L16.65 18H7v-7h9.65L23 5.84v17.24zM9 16h8.35L21 18.92V10l-3.65 3H9v3z"/><circle cx="23" cy="14.47" r="2"/><path d="M12 17h3v7h-3z"/></symbol><symbol viewBox="0 0 30 30" id="icon-clock"><path d="M14.83 23.83a9 9 0 1 1 9-9 9 9 0 0 1-9 9zm0-16a7 7 0 1 0 7 7 7 7 0 0 0-7-7z"/><path d="M13.95 9.83h2v5.13h-2z"/><path d="M13.94 13.95h3.96v2h-3.96z"/></symbol><symbol viewBox="-618.5 373.5 55 55" id="icon-comfort"><path d="M-591 388.5c-6.6 0-12 5.4-12 12s5.4 12 12 12 12-5.4 12-12-5.4-12-12-12zm0 22c-5.5 0-10-4.5-10-10s4.5-10 10-10 10 4.5 10 10-4.5 10-10 10zm11.7-20.2c.3 0 .5-.1.7-.3l4.6-4.6c.4-.4.4-1 0-1.4s-1-.4-1.4 0l-4.6 4.6c-.4.4-.4 1 0 1.4.2.2.4.3.7.3zm11.3 9.7h-6.5c-.6 0-1 .4-1 1s.4 1 1 1h6.5c.6 0 1-.4 1-1s-.4-1-1-1zm-10.6 12c-.4-.4-1-.4-1.4 0s-.4 1 0 1.4l4.6 4.6c.2.2.5.3.7.3s.5-.1.7-.3c.4-.4.4-1 0-1.4l-4.6-4.6zm-12.4 4.5c-.6 0-1 .4-1 1v6.5c0 .6.4 1 1 1s1-.4 1-1v-6.5c0-.5-.4-1-1-1zm-12.4-4.5l-4.6 4.6c-.4.4-.4 1 0 1.4.2.2.5.3.7.3s.5-.1.7-.3l4.6-4.6c.4-.4.4-1 0-1.4s-1-.4-1.4 0zm-3.1-11c0-.6-.4-1-1-1h-6.5c-.6 0-1 .4-1 1s.4 1 1 1h6.5c.5 0 1-.4 1-1zm3.1-11c.2.2.5.3.7.3s.5-.1.7-.3c.4-.4.4-1 0-1.4l-4.6-4.6c-.3-.4-1-.4-1.4 0s-.4 1 0 1.4l4.6 4.6zm12.4-4.5c.6 0 1-.4 1-1V378c0-.6-.4-1-1-1s-1 .4-1 1v6.5c0 .5.4 1 1 1z"/></symbol><symbol viewBox="0 0 40 40" id="icon-customers"><path d="M32.7 24l-.1.8s-.3 1.7-3.2 1.7c-2.8 0-3.2-1.5-3.2-1.7l-.3-.8H23v-5h-6.3l-.2.7c0 .1-.8 2.7-4.4 2.7s-4.3-2.6-4.3-2.7l-.1-.7H2v20h36V24h-5.3zM21 37H4V21h2.2c.7 1 2.5 3.4 6 3.4s5.3-2.4 6-3.4H21v16zm15 0H23V26h1.4c.6 1 2 2.5 4.9 2.5 2.9 0 4.3-1.5 4.9-2.5H36v11zm-6.7-14.8c3.3 0 6-2.7 6-6s-2.7-6-6-6-6 2.7-6 6 2.7 6 6 6zm0-10c2.2 0 4 1.8 4 4s-1.8 4-4 4-4-1.8-4-4 1.8-4 4-4zM12.2 17c4.4 0 8-3.6 8-8s-3.6-8-8-8-8 3.6-8 8 3.6 8 8 8zm0-14c3.3 0 6 2.7 6 6s-2.7 6-6 6-6-2.7-6-6 2.7-6 6-6z"/></symbol><symbol viewBox="0 0 30 30" id="icon-dashboard"><path d="M15.8 7.8c-5.5 0-10 4.4-10 9.9 0 1.2.2 2.3.6 3.4l.2.6 9.4.1 8.9-.1.2-.6c.4-1.1.6-2.2.6-3.4.1-5.4-4.4-9.9-9.9-9.9zm7.8 12h-7.5l-7.9-.1c-.2-.7-.3-1.4-.3-2.1 0-4.3 3.6-7.9 8-7.9s8 3.5 8 7.9c-.1.8-.2 1.5-.3 2.2zm-7.1-9.1h-1v1.7h1v-1.7zm-6.4 2.6l1.2 1.2.7-.7-1.2-1.2-.7.7zm10-.6l-.3-.3-3.2 3.2c-.2-.1-.4-.1-.6-.1-.8 0-1.5.7-1.5 1.5s.7 1.5 1.5 1.5 1.5-.7 1.5-1.5c0-.2-.1-.5-.2-.7l2.2-2.2.3.3 1.2-1.2-.7-.7-.2.2zM9.2 18h1.7v-1H9.2v1zm12 0h1.7v-1h-1.7v1z"/></symbol><symbol viewBox="0 0 28 35" id="icon-doc"><path d="M7 25h14v-2H7v2zm0-5h14v-2H7v2zm0-5h14v-2H7v2zm21-5.8v-.9L19.9 0H2.5C1.1 0 0 1.2 0 2.6v29.8C0 33.8 1.1 35 2.5 35h22.9c1.4 0 2.5-1.2 2.5-2.6V9.2h.1zm-2 23.2c0 .3-.2.6-.5.6h-23c-.3 0-.5-.3-.5-.6V2.6c0-.3.2-.6.5-.6H19v7.2h7v23.2z"/></symbol><symbol viewBox="0 0 14 14" id="icon-earth"><path d="M12.5 7c0-3-2.5-5.5-5.5-5.5-2.8 0-5.1 2.1-5.4 4.7v1c.1 2.9 2.4 5.2 5.3 5.3h.6c2.8-.2 5-2.6 5-5.5zM7.1 2.7C7.7 3.1 8.6 4 8.8 6H5.4c.3-2 1.2-2.9 1.7-3.3zM8.9 7c0 3-1.1 3.9-1.7 4.4v-.1C6.5 10.8 5.4 10 5.4 7h3.5zm-.1 3.9C9.4 10 9.9 9 9.9 7h1.6c-.1 2-1.2 3.2-2.7 3.9zM11.4 6H9.8C9.6 5 9 3.2 8.4 2.5c1.5.5 2.7 2.5 3 3.5zM6 2.4C5.3 3.1 4.6 4 4.4 6H2.6C2.9 4 4.2 2.8 6 2.4zM2.5 7h1.9c0 2 .5 3.1 1.1 4-1.7-.6-2.9-2-3-4z"/></symbol><symbol viewBox="-632.3 373.3 55 55" id="icon-easy"><path d="M-602 402.9c-1.5 1.7-3.7 2.7-6 2.7-.6 0-1 .4-1 1s.4 1 1 1c2.9 0 5.6-1.2 7.5-3.4.4-.4.3-1-.1-1.4-.4-.3-1.1-.3-1.4.1zm14.1 13.4l-9.6-9.6c2.1-2.5 3.4-5.7 3.4-9.2 0-7.7-6.3-14-14-14s-13.9 6.4-13.9 14.1c0 7.7 6.3 14 14 14 3.5 0 6.7-1.3 9.2-3.4l9.6 9.6c.2.2.5.3.7.3s.5-.1.7-.3c.3-.4.3-1.1-.1-1.5zm-20.1-6.7c-6.6 0-12-5.4-12-12s5.4-12 12-12 12 5.4 12 12-5.4 12-12 12z"/></symbol><symbol viewBox="0 0 22 22" id="icon-edit--favorites"><path d="M17.7 6.2l-5 5-1 3.1 3.1-1 5-5-2.1-2.1zm-3.4 6.3l-1 .3.3-1 4.2-4.2.7.7-4.2 4.2zm-1.1-3.8L9 8.1 7.1 4.3 5.3 8.1l-4.2.6 3 3-.7 4.2 3.8-2 3.8 2-.7-4.2 2.9-3zm-6.1 4L4.7 14l.5-2.7-2-1.9L5.9 9l1.2-2.5L8.3 9l2.7.4-2 1.9.6 2.7-2.5-1.3z"/></symbol><symbol viewBox="0 0 22 22" id="icon-edit--gallery"><path d="M21 9.3l-2.2-2.1L16 9.9V5H2v11h14v-1.8l5-4.9zm-1.3 0l-4.2 4.2-1 .3.3-1L19 8.6l.7.7zM3 6h12v4.9l-1.2 1.3v.1l-1.7-2.1-1.9 2-3.1-4L3 12.7V6zm0 8h.4l3.7-4.2 3 4.1 2-2.1 1.4 1.7L13 15H3v-1zm11.1 1l1.1-.4v.4h-1.1z"/></symbol><symbol viewBox="0 0 22 22" id="icon-edit--post"><path d="M13 8H6v1h7V8zm0 2H6v1h7v-1zm-7 3h4v-1H6v1zm10.8-4.8L15 9.9V4H4v14h11v-3.8l3.9-3.9-2.1-2.1zM14 17H5V5h9v5.9l-2.2 2.3-1 3.1 3.1-1 .1-.2V17zm-.6-2.5l-1 .3.3-1 4.2-4.2.7.7-4.2 4.2z"/></symbol><symbol viewBox="0 0 22 22" id="icon-edit--property"><path d="M19.9 7.3l-2.1-2.1-3.3 3.3L11 6.4l-8.2 5.2.5.8L6 10.7V16h10v-4.8l.3-.3 2.4 1.5.5-.8-2.2-1.4 2.9-2.9zm-1.5 0l-4.2 4.2-1 .3.3-1 4.2-4.2.7.7zM15 15H7v-4.9l4-2.5 2.7 1.7-1 1-1 3.1 3.1-1 .2-.2V15z"/></symbol><symbol viewBox="0 0 18 18" id="icon-enter-fullscreen"><path d="M6.425 10.165l-2.57 2.569.018-1.846c-.003-.552-.45-1-1.002-1.002a.985.985 0 0 0-.992.992l-.023 4.22a1 1 0 0 0 .295.707l.025.023c.008.007.015.017.023.025.188.188.443.294.707.295l4.22-.023a.986.986 0 0 0 .992-.992c-.003-.55-.45-1-1.002-1.002l-1.847.016 2.57-2.569a.99.99 0 0 0 0-1.4l-.013-.013a.99.99 0 0 0-1.4 0h-.001zm7.729-4.899l-.017 1.846c.003.552.45 1 1.002 1.002a.985.985 0 0 0 .992-.992l.024-4.22a1.007 1.007 0 0 0-.296-.707l-.025-.023c-.008-.007-.015-.017-.023-.025a1.009 1.009 0 0 0-.707-.295l-4.22.023a.986.986 0 0 0-.991.992c.002.55.45 1 1.002 1.002l1.846-.016-2.569 2.569a.99.99 0 0 0 0 1.4c.4.4 1.026.4 1.413.013l2.57-2.569z"/></symbol><symbol viewBox="0 0 40 40" id="icon-error"><path d="M27.3 22.9L25 25.1c.3-3.1-.6-6.2-2.6-8.7-2.4-3.1-6-5-9.8-5-.6 0-1 .4-1 1s.4 1 1 1c3.1 0 6.2 1.6 8.2 4.2 1.7 2.2 2.4 4.9 2.1 7.5l-2.3-2.3c-.4-.4-1-.4-1.4 0-.4.4-.4 1 0 1.4l4 3.9c.2.2.4.3.7.3s.5-.1.7-.3l4-3.9c.4-.4.4-1 0-1.4-.3-.3-.9-.3-1.3.1zM40 20C40 9 31 0 20 0 8.9 0 0 9 0 20s8.9 20 20 20c4 0 7.7-1.2 10.8-3.1 3.7 1 8.2 2.1 8.2 2.1s-1-4-2.1-8.3C38.8 27.6 40 24 40 20zm-8.7 14.9c-.2 0-.4-.1-.5-.1-.4 0-.8.1-1.1.3C26.8 37 23.4 38 20 38c-9.9 0-18-8.1-18-18S10.1 2 20 2s18 8.1 18 18c0 3.4-1 6.8-2.8 9.7-.3.5-.4 1.1-.2 1.6.5 1.8.9 3.5 1.3 5-1.6-.4-3.4-.9-5-1.4z"/></symbol><symbol viewBox="0 0 18 18" id="icon-exit-fullscreen"><path d="M14.425 2.165l-2.57 2.569.018-1.846c-.003-.552-.45-1-1.002-1.002a.985.985 0 0 0-.992.992l-.023 4.22a1.007 1.007 0 0 0 .32.73c.008.007.015.017.023.025.188.188.443.294.707.295l4.22-.023a.986.986 0 0 0 .992-.992c-.003-.55-.45-1-1.002-1.002l-1.847.016 2.57-2.569a.99.99 0 0 0 0-1.4l-.013-.013a.99.99 0 0 0-1.4 0h-.001zM6.154 13.266l-.017 1.846c.003.552.45 1 1.002 1.002a.985.985 0 0 0 .992-.992l.024-4.22a1.007 1.007 0 0 0-.32-.73c-.009-.007-.016-.017-.024-.025a1.009 1.009 0 0 0-.707-.295l-4.22.023a.986.986 0 0 0-.991.992c.002.55.45 1 1.002 1.002l1.846-.016-2.569 2.569a.99.99 0 0 0 0 1.4c.4.4 1.026.4 1.413.013l2.57-2.569z"/></symbol><symbol viewBox="0 0 18 18" id="icon-fast-forward"><path d="M17.569 8.246L7 2a1 1 0 0 0-1 1v1.954L1 2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1l5-2.955V15a1 1 0 0 0 1 1l10.569-6.246a.876.876 0 0 0 0-1.508zM6 10.722l-4 2.364V4.914l4 2.364v3.444zm2 2.364V4.914L14.915 9 8 13.086z"/></symbol><symbol viewBox="0 0 30 30" id="icon-favorite-agents"><path d="M3.94 29.25v-.88a12.22 12.22 0 0 1 .13-1.43A4.24 4.24 0 0 1 5 24.57a5 5 0 0 1 2.25-1 11.12 11.12 0 0 0 1.12-.34 1.61 1.61 0 0 0 .54-.23v-.06a1.55 1.55 0 0 0-.49-1.28 7.65 7.65 0 0 1-.68-1.19 6.12 6.12 0 0 1-.26-4.29A3.82 3.82 0 0 1 9.22 14a5.3 5.3 0 0 1 2.78-.75 5.3 5.3 0 0 1 2.78.72 3.82 3.82 0 0 1 1.66 2.13 6.12 6.12 0 0 1-.26 4.29 7.66 7.66 0 0 1-.68 1.19 1.55 1.55 0 0 0-.5 1.28v.06a1.61 1.61 0 0 0 .5.28 11.11 11.11 0 0 0 1.12.34 5 5 0 0 1 2.25 1 4.24 4.24 0 0 1 .94 2.37 12.22 12.22 0 0 1 .19 1.46v.88H3.94zm2.28-3.43a3.27 3.27 0 0 0-.43 1.41v.3h12.46v-.33a2.89 2.89 0 0 0-.45-1.42 4.35 4.35 0 0 0-1.47-.54c-1.12-.3-2.39-.64-2.82-1.68a3 3 0 0 1 .62-2.93 6.14 6.14 0 0 0 .53-.92 4.37 4.37 0 0 0 .2-3.1A2.71 2.71 0 0 0 12 15a2.71 2.71 0 0 0-2.81 1.64 4.37 4.37 0 0 0 .2 3.1 6.14 6.14 0 0 0 .53.92 3 3 0 0 1 .62 2.93c-.44 1-1.7 1.38-2.82 1.68a4.33 4.33 0 0 0-1.47.54zm16.75-8.13l-5.72-3 .93-1.77 2.13 1.11-.49-2.88 2.09-2.05-2.89-.42-1.3-2.63-1.3 2.63-2.9.42 1.72 1.68-1.39 1.43-4.62-4.5 5.86-.86 2.63-5.32 2.62 5.32 5.87.86-4.25 4.14 1.01 5.84z"/></symbol><symbol viewBox="0 0 30 30" id="icon-favorite-listings"><path d="M23.97 17.69l-5.72-3 .93-1.77 2.13 1.11-.49-2.88 2.09-2.05-2.89-.42-1.3-2.63-1.3 2.63-2.9.42 1.73 1.68-1.4 1.43-4.62-4.5 5.86-.86 2.63-5.32 2.62 5.32 5.87.86-4.25 4.14 1.01 5.84zM4 10v17h12V15zm5 15H6v-3h3v3zm0-5H6v-3h3v3zm5 5h-3v-3h3v3zm0-5h-3v-3h3v3z"/></symbol><symbol viewBox="0 0 30 30" id="icon-favorite-search"><path d="M23.97 17.69l-5.72-3 .93-1.77 2.13 1.11-.49-2.88 2.09-2.05-2.89-.42-1.3-2.63-1.3 2.63-2.9.42 1.73 1.68-1.4 1.43-4.62-4.5 5.86-.86 2.63-5.32 2.62 5.32 5.87.86-4.25 4.14 1.01 5.84zm-11.14 7.14a6 6 0 1 1 6-6 6 6 0 0 1-6 6zm0-10a4 4 0 1 0 4 4 4 4 0 0 0-4-4zm-8.49 14a1 1 0 0 1-.71-1.71l2.55-2.55A1 1 0 0 1 7.6 26L5 28.53a1 1 0 0 1-.66.3z"/></symbol><symbol viewBox="0 0 30 30" id="icon-financials"><path d="M4.14 16.28A8.5 8.5 0 0 1 6 7a8.55 8.55 0 0 1 2.68-1.86A9.08 9.08 0 0 1 12 4.47v2A6.11 6.11 0 0 0 9.46 7a6.49 6.49 0 0 0-4 6A6.45 6.45 0 0 0 6 15.5zM17 25.47v-2a6 6 0 0 0 2.51-.47A6.51 6.51 0 0 0 23 14.44l1.84-.78a8.53 8.53 0 0 1-4.55 11.14 8.93 8.93 0 0 1-3.29.67z"/><path d="M21.89 17.47l-1.46-1.36 3.97-4.26 4.21 3.93-1.37 1.46-2.74-2.56-2.61 2.79zm-16.43.82L.63 15l1.12-1.65 3.19 2.16 1.98-2.91 1.65 1.13-3.11 4.56zm10.71-5.7a3.93 3.93 0 0 0-.88-.59 2.13 2.13 0 0 0-1-.21 1.47 1.47 0 0 0-.93.26 1 1 0 0 0-.32.83.87.87 0 0 0 .33.69 4.25 4.25 0 0 0 .83.53l1.08.52a5.78 5.78 0 0 1 1.08.66 3.4 3.4 0 0 1 .83.94 2.61 2.61 0 0 1 .33 1.36 3.34 3.34 0 0 1-.61 2.09A2.82 2.82 0 0 1 15 20.8V23h-2v-2.13c0-.06-.89-.19-1.44-.41a4.31 4.31 0 0 1-1.35-.87l1.12-1.68a5.83 5.83 0 0 0 1.25.74 3.09 3.09 0 0 0 1.2.25 1.58 1.58 0 0 0 1-.29 1.11 1.11 0 0 0 .33-.88 1 1 0 0 0-.29-.73 4.39 4.39 0 0 0-.82-.62c-.33-.19-.69-.37-1.08-.56a6 6 0 0 1-1.08-.67 3.57 3.57 0 0 1-.84-.91 2.38 2.38 0 0 1-.33-1.29 3.07 3.07 0 0 1 .56-2.08A2.39 2.39 0 0 1 13 9.81V8h2v1.78c0 .08 1 .24 1.38.49a5.19 5.19 0 0 1 1.08.9z"/></symbol><symbol viewBox="0 0 25 20.7" id="icon-garage"><path d="M12.5 0L0 7.5v13.2h25V7.5L12.5 0zm0 2.3l8.9 5.3H3.6l8.9-5.3zM12 18.7H2v-10h10v10zm11 0H13v-10h10v10zm-12-5.5h-1v2h1v-2zm4 0h-1v2h1v-2z"/></symbol><symbol viewBox="19.5 264.5 27 33" id="icon-geolocation"><path d="M33 264.5c-7.5 0-13.5 6-13.5 13.5 0 7.6 6.6 12.6 13.5 19.5 6.9-6.9 13.5-11.9 13.5-19.5 0-7.5-6-13.5-13.5-13.5zm1.6 22.9v-4.6h-3.2v4.6c-4.2-.7-7.5-4-8.2-8.2h4.6V276h-4.6c.7-4.2 4-7.5 8.2-8.2v4.6h3.2v-4.6c4.2.7 7.5 4 8.2 8.2h-4.6v3.2h4.6c-.7 4.2-4 7.5-8.2 8.2z"/></symbol><symbol viewBox="0 0 22 22" id="icon-get--review"><path d="M11 9H4v1h7V9zm-3 2H4v1h4v-1zm10.5-5.7l-2.9 2.2.6.8L18 7v6h1V7l1.7 1.3.6-.8-2.8-2.2zM1 15h5.8l4.2 2.4V15h3V6H1v9zm1-8h11v7h-3v1.6L7.1 14H2V7z"/></symbol><symbol viewBox="0 0 22 22" id="icon-get--stars"><path d="M9 9.1L7.1 5.3 5.3 9.1l-4.2.6 3 3-.7 4.2 3.8-2 3.8 2-.7-4.2 3-3L9 9.1zm.6 5.9l-2.4-1.3L4.7 15l.5-2.7-2-1.9 2.7-.4 1.2-2.5L8.3 10l2.7.4-2 1.9.6 2.7zm7.9-9.7l-2.9 2.2.6.8L17 7v6h1V7l1.7 1.3.6-.8-2.8-2.2z"/></symbol><symbol viewBox="-632.5 373.5 55 55" id="icon-good-sales"><path d="M-598 397v6h-8v5h-8v5h-8v10h34v-26h-10zm-16 24h-6v-6h6v6zm8 0h-6v-11h6v11zm8 0h-6v-16h6v16zm8 0h-6v-22h6v22zm-19.9-29.7l4.9 5.1 14-14v2.6h2l-.1-6h-5.8v2h2.4l-12.5 12.5-4.9-5.1-10.8 10.9 1.4 1.4 9.4-9.4z"/></symbol><symbol viewBox="0 0 50 50" id="icon-info"><path d="M25 32.3c-2.4 0-4.3 1.9-4.3 4.3s1.9 4.3 4.3 4.3 4.3-1.9 4.3-4.3-1.9-4.3-4.3-4.3zm21.6-21.1l-7.8-7.8c-2-1.9-5.5-3.4-8.3-3.4H19.4c-2.7 0-6.3 1.5-8.2 3.4l-7.8 7.8c-2 2-3.4 5.5-3.4 8.2v11.1c0 2.7 1.5 6.3 3.4 8.2l7.8 7.8c1.9 1.9 5.5 3.4 8.2 3.4h11.1c2.7 0 6.3-1.5 8.2-3.4l7.8-7.8c1.9-1.9 3.4-5.5 3.4-8.2V19.4c.1-2.7-1.4-6.2-3.3-8.2zM46 30.5c0 1.7-1.1 4.2-2.2 5.4L36 43.7c-1.2 1.2-3.7 2.2-5.4 2.2H19.4c-1.7 0-4.2-1.1-5.4-2.2l-7.8-7.8C5 34.8 4 32.2 4 30.5V19.4c0-1.7 1.1-4.2 2.2-5.4L14 6.2C15.2 5 17.8 4 19.4 4h11.1c1.7 0 4.2 1.1 5.4 2.2l7.8 7.8c1.2 1.2 2.2 3.7 2.2 5.4v11.1zm-23.7-.9h5.3l2-18.9h-9.3l2 18.9z"/></symbol><symbol viewBox="-632.3 373.3 55 55" id="icon-lens"><path d="M-602 402.9c-1.5 1.7-3.7 2.7-6 2.7-.6 0-1 .4-1 1s.4 1 1 1c2.9 0 5.6-1.2 7.5-3.4.4-.4.3-1-.1-1.4-.4-.3-1.1-.3-1.4.1zm14.1 13.4l-9.6-9.6c2.1-2.5 3.4-5.7 3.4-9.2 0-7.7-6.3-14-14-14s-13.9 6.4-13.9 14.1c0 7.7 6.3 14 14 14 3.5 0 6.7-1.3 9.2-3.4l9.6 9.6c.2.2.5.3.7.3s.5-.1.7-.3c.3-.4.3-1.1-.1-1.5zm-20.1-6.7c-6.6 0-12-5.4-12-12s5.4-12 12-12 12 5.4 12 12-5.4 12-12 12z"/></symbol><symbol viewBox="-7 377 16 16" id="icon-login"><path d="M-7 393v-.9s0-.7.1-1.4c.2-1.1.5-1.9.9-2.4.5-.5 1.4-.8 2.2-1 .4-.1.8-.2 1.1-.3.3-.1.4-.2.5-.3v-.1c.1-.3 0-.6-.5-1.3-.2-.3-.5-.7-.7-1.2-.6-1.4-.7-2.9-.3-4.3.3-.9.9-1.6 1.7-2.1 1-.4 1.9-.7 3-.7s2 .2 2.8.7c.8.5 1.4 1.2 1.7 2.1.4 1.4.3 2.9-.3 4.3-.2.5-.4.8-.7 1.2-.4.7-.6 1-.5 1.3v.1c.1.1.2.2.5.3.3.1.7.2 1.1.3.8.2 1.7.5 2.2 1 .5.5.8 1.2.9 2.4.1.8.1 1.4.1 1.4v.9H-7zm2.3-3.5c-.1.1-.3.5-.4 1.4v.2l.3-.1h12v-.2c-.2-1.1-.4-1.3-.4-1.3-.2-.2-.7-.3-1.5-.5-1.1-.3-2.4-.6-2.8-1.7-.5-1.2.1-2.2.6-2.9.2-.3.4-.6.5-.9.4-1.1.5-2.1.2-3.1-.4-1.4-1.9-1.6-2.8-1.6s-2.3.2-2.8 1.6c-.3 1-.2 2 .2 3.1.1.3.3.6.5.9.5.8 1.1 1.7.6 2.9-.4 1-1.7 1.4-2.8 1.7-.7.2-1.2.3-1.4.5z"/></symbol><symbol viewBox="0 0 213.3 54.9" id="icon-logo"><path class="bust0" d="M199.7 23.5c1 0 2 .3 2.8.8l.9-2.4c-1-.5-2.4-.8-3.7-.8-3.7 0-6.1 2.3-6.1 5.9 0 3.8 2.4 5.9 6 5.9 1.3 0 2.8-.3 3.7-.8l-.6-2.5c-.8.6-1.9.9-3 .9-2 0-3.2-1.4-3.2-3.5 0-2.2 1.2-3.5 3.2-3.5zm-90.8 1.4c0-2.2-1.6-3.6-4.6-3.6h-4.5v11.3h2.9v-3.7l1.3-.1 2.3 3.8h3.2l-2.9-4.4c1.5-.6 2.3-1.8 2.3-3.3zm-4.8 1.9h-1.4v-3.2h1.2c1.4 0 2.1.5 2.1 1.5 0 1.1-.7 1.6-1.9 1.7zm81.6-5.5l-4 11.3h2.8l.8-2.4h4.2l.8 2.4h2.8l-3.9-11.3h-3.5zm.3 6.7l1.5-4.4 1.4 4.4H186zm-9-6.7h-4.2v11.3h2.9v-3.3h1.1c3.2 0 5-1.4 5-4.1 0-2.3-1.6-3.9-4.8-3.9zm-.2 5.8h-1.2v-3.5h1.2c1.4 0 2.2.6 2.2 1.7 0 1.2-.7 1.8-2.2 1.8zm36.5-3.5v-2.3h-8.2v11.3h8.2v-2.3h-5.4v-2.2h4.4v-2.3h-4.4v-2.2h5.4zm-102.3 9h8.2v-2.3h-5.4v-2.2h4.4v-2.3h-4.4v-2.2h5.4v-2.3H111v11.3zm56.4-6.8c-1.4-.4-2.4-.7-2.4-1.4 0-.6.5-1 1.5-1 1.1 0 2.5.4 3.6 1l.6-2.4c-1.1-.6-2.4-1-4.2-1-2.8 0-4.3 1.4-4.3 3.5 0 2.3 2 3 3.6 3.5 1.5.4 2.3.7 2.3 1.4s-.7 1.1-1.7 1.1c-1.4 0-2.7-.4-3.9-1l-.5 2.4c1 .6 2.7 1 4.3 1 3 0 4.6-1.5 4.6-3.7 0-2.1-1.8-2.9-3.5-3.4zm-11.1 0l-2.3-4.4h-3l3.9 7v4.3h2.8v-4.3l3.9-7h-3l-2.3 4.4zm-32-4.5l-4 11.3h2.8l.8-2.4h4.2l.8 2.4h2.8l-3.9-11.3h-3.5zm.2 6.7l1.5-4.4 1.4 4.4h-2.9zm15.5-4.3h3.6v8.9h2.9v-8.9h3.6v-2.4h-10v2.4zm-4.1-2.4H133v11.3h7.6v-2.4h-4.7v-8.9zM0 27.4l42.4 27.4 42.4-27.4L42.4 0 0 27.4zm42.4 21.9L8.6 27.4 42.4 5.6l33.8 21.9-33.8 21.8zm.8-13.8c-1.2-.3-2.1-.6-2.1-1.2 0-.5.4-.8 1.3-.8 1 0 2.2.4 3.2.9l.5-2.1c-1-.5-2.2-.9-3.7-.9-2.5 0-3.8 1.2-3.8 3.1 0 2 1.8 2.7 3.2 3.1 1.3.4 2 .6 2 1.3 0 .6-.6.9-1.5.9-1.2 0-2.4-.4-3.4-.9l-.5 2.1c.9.5 2.4.9 3.9.9 2.6 0 4.1-1.3 4.1-3.2s-1.7-2.8-3.2-3.2zm-4.7-13.2H41V19l1.2-.1 2 3.4h2.9l-2.6-4c1.3-.5 2-1.5 2-2.9 0-1.9-1.4-3.2-4-3.2h-4v10.1zm2.5-7.9h1.1c1.3 0 1.9.4 1.9 1.3 0 1-.6 1.4-1.7 1.5H41v-2.8zm-13.5 14h29.9v-2H27.5v2z"/></symbol><symbol viewBox="0 0 84.9 54.9" id="icon-logo--mob"><path d="M42.4 0L0 27.4l42.4 27.4 42.4-27.4L42.4 0zM8.6 27.4L42.4 5.6l33.8 21.9-33.8 21.8L8.6 27.4zm32.5-8.3l1.2-.1 2 3.4h2.9l-2.6-4c1.3-.5 2-1.5 2-2.9 0-1.9-1.4-3.2-4-3.2h-4v10h2.5v-3.2zm-.1-4.7h1.1c1.3 0 1.9.4 1.9 1.3 0 1-.6 1.4-1.7 1.5H41v-2.8zm2.2 21.1c-1.2-.3-2.1-.6-2.1-1.2 0-.5.4-.8 1.3-.8 1 0 2.2.4 3.2.9l.5-2.1c-1-.5-2.2-.9-3.7-.9-2.5 0-3.8 1.2-3.8 3.1 0 2 1.8 2.7 3.2 3.1 1.3.4 2 .6 2 1.3 0 .6-.6.9-1.5.9-1.2 0-2.4-.4-3.4-.9l-.5 2.1c.9.5 2.4.9 3.9.9 2.6 0 4.1-1.3 4.1-3.2s-1.7-2.8-3.2-3.2zm-15.7-9.1v2h29.9v-2H27.5z"/></symbol><symbol viewBox="0 0 22 16" id="icon-mail"><path d="M0 0v16h22V0H0zm11 8.7L3.6 2h14.8L11 8.7zM6.8 7.5l-4.8 5V3.2l4.8 4.3zm1.5 1.4l2.7 2.5 2.7-2.5 4.9 5.1H3.3l5-5.1zm6.9-1.4L20 3.2v9.3l-4.8-5z"/></symbol><symbol viewBox="0 0 34 47" id="icon-marker"><path fill="#0BA" d="M17 0C7.6 0 0 7.6 0 17s12.1 25.1 17 30c4.5-4.5 17-20.6 17-30 0-9.4-7.6-17-17-17zm0 23c-3 0-5.5-2.5-5.5-5.5S14 12 17 12s5.5 2.5 5.5 5.5S20 23 17 23z"/><linearGradient id="bxa" gradientUnits="userSpaceOnUse" x1="8.5" x2="8.5" y2="47"><stop offset="0" stop-color="#00d9c8"/><stop offset="1" stop-color="#00937d"/></linearGradient><path fill="url(#bxa)" d="M11.5 17.5c0-3 2.5-5.5 5.5-5.5V0C7.6 0 0 7.6 0 17s12.1 25.1 17 30V23c-3 0-5.5-2.5-5.5-5.5z"/><linearGradient id="bxb" gradientUnits="userSpaceOnUse" x1="17" y1="28" x2="17" y2="7"><stop offset="0" stop-color="#00d9c8"/><stop offset="1" stop-color="#00937d"/></linearGradient><path fill="url(#bxb)" d="M17 7C11.2 7 6.5 11.7 6.5 17.5S11.2 28 17 28s10.5-4.7 10.5-10.5S22.8 7 17 7zm0 16c-3 0-5.5-2.5-5.5-5.5S14 12 17 12s5.5 2.5 5.5 5.5S20 23 17 23z"/></symbol><symbol viewBox="0 0 34 47" id="icon-marker-white"><path fill="#f6f6f6" d="M17 0C7.6 0 0 7.6 0 17s12.1 25.1 17 30c4.5-4.5 17-20.6 17-30 0-9.4-7.6-17-17-17zm0 23c-3 0-5.5-2.5-5.5-5.5S14 12 17 12s5.5 2.5 5.5 5.5S20 23 17 23z"/><linearGradient id="bya" gradientUnits="userSpaceOnUse" x1="8.5" x2="8.5" y2="47"><stop offset="0" stop-color="#f6f6f6"/><stop offset="1" stop-color="#d0d0d0"/></linearGradient><path fill="url(#bya)" d="M11.5 17.5c0-3 2.5-5.5 5.5-5.5V0C7.6 0 0 7.6 0 17s12.1 25.1 17 30V23c-3 0-5.5-2.5-5.5-5.5z"/><linearGradient id="byb" gradientUnits="userSpaceOnUse" x1="17" y1="28" x2="17" y2="7"><stop offset="0" stop-color="#f6f6f6"/><stop offset="1" stop-color="#d0d0d0"/></linearGradient><path fill="url(#byb)" d="M17 7C11.2 7 6.5 11.7 6.5 17.5S11.2 28 17 28s10.5-4.7 10.5-10.5S22.8 7 17 7zm0 16c-3 0-5.5-2.5-5.5-5.5S14 12 17 12s5.5 2.5 5.5 5.5S20 23 17 23z"/></symbol><symbol preserveAspectRatio="xMidYMid" viewBox="0 0 30 30" id="icon-menu"><path class="bzcls-1" d="M1 21h28v3H1zm0-7h28v3H1zm0-7h28v3H1z"/></symbol><symbol preserveAspectRatio="xMidYMid" viewBox="0 0 30 30" id="icon-menu-close"><path d="M6.162 4.539l19.799 19.799-2.121 2.121L4.041 6.66l2.121-2.121z" class="cacls-1"/><path d="M4.039 24.338L23.838 4.539l2.122 2.122L6.161 26.46l-2.122-2.122z" class="cacls-1"/></symbol><symbol viewBox="0 0 14 14" id="icon-money"><path d="M12.3 5.5c.1-.3.2-.6.2-1 0-2-2.4-3.5-5.5-3.5S1.5 2.6 1.5 4.5c0 .4.1.7.2 1-.1.3-.2.7-.2 1 0 .4.1.7.2 1-.1.3-.2.7-.2 1 0 2 2.4 3.5 5.5 3.5s5.5-1.5 5.5-3.5c0-.3-.1-.7-.2-1 .1-.3.2-.6.2-1 0-.3-.1-.6-.2-1zM7 8c1.9 0 3.5-.6 4.5-1.5C11.5 7.9 9.4 9 7 9S2.5 7.9 2.5 6.6C3.5 7.5 5.1 8 7 8zm0-6c2.4 0 4.5 1.1 4.5 2.5S9.4 7 7 7 2.5 5.9 2.5 4.5 4.6 2 7 2zm0 9c-2.4 0-4.5-1.1-4.5-2.5 1 1 2.6 1.5 4.5 1.5s3.5-.6 4.5-1.5C11.5 9.9 9.4 11 7 11z"/></symbol><symbol viewBox="-612.3 373.5 55 55" id="icon-money-save"><path d="M-574.5 384c-4.6 0-8.8 1.9-11.9 4.9-1.8-.3-3.7-.4-5.6-.4-6.3-.1-12.9 1.5-13.1 4.4-.1.2-.1.8 0 3.2-3.7.7-6.6 2-6.7 3.9-.1.3-.1.9 0 3.6v.4c0 2 2.9 3.3 6.7 4 0 .5 0 1.3.1 2.6v.4c0 3 6.8 4.6 13.1 4.6 2.6 0 5.3-.3 7.6-.8-.1 0-.1-.1-.2-.1 2.8 2.1 6.3 3.4 10.1 3.4 9.4 0 17-7.6 17-17s-7.8-17.1-17.1-17.1zm-17.5 5.4c1.7 0 3.4.1 4.8.3l.1-.1c-1.8 2-3.1 4.4-3.8 7v-.1h-1.1c-7.1 0-12.1-1.9-12.1-3.6 0-1.6 4.9-3.5 12.1-3.5zm0 8.2h.9c-.2.9-.3 1.9-.3 2.9h-.5c-7.1 0-12.1-1.9-12.1-3.6v-2.1c1.9 1.8 7 2.8 12 2.8zm-13.1-.6c.2 2.9 6.8 4.4 13.1 4.4h.5c0 .5 0 .9.1 1.4-2 .5-4.5.8-7.4.8-7.1 0-12.1-1.9-12.1-3.6 0-1.1 2.2-2.3 5.8-3zm-5.8 6.9v-2.1c2.1 1.8 7.2 2.8 12.2 2.8 2.6 0 5.3-.3 7.6-.8.2 1 .4 1.9.7 2.8v-.1c-2.1.6-4.9 1-8.2 1-7.4 0-12.3-1.9-12.3-3.6zm20.7 3.5c.4 1.1 1 2.1 1.7 3.1-1.1.1-2.3.2-3.4.2-5.6 0-9.8-1.1-11.4-2.5 1.5.2 3.1.3 4.6.3 2.9 0 6-.4 8.5-1.1zm-1.8 7.2c-7.1 0-12.1-1.9-12.1-3.6v-2.1c2.1 1.8 7.2 2.8 12.2 2.8 1.4 0 2.8-.1 4.1-.2.7.9 1.5 1.8 2.4 2.5-1.9.3-4.2.6-6.6.6zm17.5 1.4c-8.3 0-15-6.7-15-15s6.7-15 15-15 15 6.7 15 15-6.8 15-15 15zm2.2-15c-.4-.3-.9-.6-1.3-.8-.5-.2-.9-.4-1.3-.7-.4-.2-.7-.5-1-.8-.3-.3-.4-.7-.4-1.2 0-.6.2-1 .5-1.4.4-.3.8-.5 1.4-.5.5 0 1 .1 1.3.3.3.2.7.5 1.1.8l.9-1c-.4-.4-.8-.7-1.2-1-.4-.3-1-.4-1.6-.5v-2h-1.2v2c-.9.1-1.6.5-2.1 1.1-.5.6-.8 1.3-.8 2.2 0 .6.1 1.2.4 1.6.3.4.6.8 1 1.1.4.3.9.5 1.3.8.5.2.9.5 1.3.7.4.2.7.6 1 .9.3.3.4.8.4 1.3 0 .6-.2 1.1-.5 1.5-.4.4-.9.6-1.6.6-.6 0-1.2-.1-1.7-.4-.5-.3-1-.6-1.4-.9l-.7 1.1c.4.4.9.7 1.5 1 .6.3 1.2.5 1.8.5v2h1.2v-2c.9-.1 1.7-.5 2.2-1.1.5-.6.8-1.4.8-2.3 0-.7-.1-1.3-.4-1.7-.3-.4-.4-.9-.9-1.2z"/></symbol><symbol viewBox="0 0 18 18" id="icon-muted"><path d="M9.214 2a.62.62 0 0 0-.334.101l-4.048 2.81A.494.494 0 0 1 4.549 5H.996A.998.998 0 0 0 0 6v6c0 .552.446 1 .996 1h3.553c.102 0 .2.031.283.089l4.048 2.81a.62.62 0 0 0 .334.101c.392 0 .747-.4.747-.949V2.95c0-.55-.355-.949-.747-.949V2zM7.969 12.834l-2.387-1.657a.996.996 0 0 0-.566-.178H2.491a.5.5 0 0 1-.498-.5v-3a.5.5 0 0 1 .498-.5h2.525c.202 0 .4-.062.566-.178l2.387-1.657v7.67zm6.965-4.035c-.086-1.748-1.514-2.991-2.507-3.649-.47-.312-1.094-.122-1.325.408l-.038.086a.973.973 0 0 0 .336 1.194c.706.473 1.586 1.247 1.624 2.065.032.676-.553 1.468-1.663 2.27a.987.987 0 0 0-.285 1.275l.042.075c.266.475.866.624 1.3.312 1.74-1.251 2.586-2.606 2.516-4.037v.001z"/><path d="M13.957 9.2c.086 1.747 1.514 2.99 2.507 3.648.47.312 1.094.122 1.325-.408l.038-.086a.973.973 0 0 0-.336-1.194c-.706-.473-1.586-1.247-1.624-2.065-.032-.676.553-1.468 1.663-2.27a.987.987 0 0 0 .285-1.275l-.042-.075c-.266-.475-.866-.624-1.3-.312-1.74 1.251-2.586 2.606-2.516 4.037z"/></symbol><symbol viewBox="0 0 30 30" id="icon-news"><path d="M24 23H5V7h19v16zM7 21h15V9H7v12z"/><path d="M8 10h6v5H8zm8 0h5v2h-5zm0 5h5v1h-5zm-8 2h13v1H8zm0 2h13v1H8z"/></symbol><symbol viewBox="0 0 42 33" id="icon-noitems"><path d="M38.5 0h-35C1.6 0 0 1.6 0 3.5v26C0 31.4 1.6 33 3.5 33h35c1.9 0 3.5-1.6 3.5-3.5v-26C42 1.6 40.4 0 38.5 0zm.5 29.5c0 .3-.2.5-.5.5h-35c-.3 0-.5-.2-.5-.5v-26c0-.3.2-.5.5-.5h35c.3 0 .5.2.5.5v26zM7 10h27V7H7v3zm0 6h27v-3H7v3zm0 6h18v-3H7v3z"/></symbol><symbol viewBox="0 0 18 18" id="icon-pause"><path d="M2 4v10c0 2 2 2 2 2h2s2 0 2-2V4c0-2-2-2-2-2H4S2 2 2 4zm2 0h2v10H4V4zm6 0v10c0 2 2 2 2 2h2s2 0 2-2V4c0-2-2-2-2-2h-2s-2 0-2 2zm2 0h2v10h-2V4z"/></symbol><symbol viewBox="0 0 14 14" id="icon-phone"><path d="M10.922 14.004a3.503 3.503 0 0 1-1.03-.151 7.814 7.814 0 0 1-.474-.145c-.108-.038-.304-.111-.586-.216a18.755 18.755 0 0 0-.546-.2 9.275 9.275 0 0 1-1.759-.835c-.877-.541-1.798-1.293-2.74-2.235-.942-.941-1.693-1.863-2.233-2.737a9.23 9.23 0 0 1-.84-1.774 38.255 38.255 0 0 0-.196-.533 43.438 43.438 0 0 1-.217-.587 8.621 8.621 0 0 1-.145-.474 4.185 4.185 0 0 1-.118-.542 3.715 3.715 0 0 1-.032-.488c0-.562.161-1.144.48-1.731C.941.534 1.242.34 1.349.294c.156-.068.369-.133.645-.196.321-.074.512-.092.618-.093.053.071.152.225.31.54.093.163.198.352.331.597.137.253.263.482.379.688.117.208.231.405.341.588l.015.025.016.022c.021.027.079.111.177.252.108.157.161.252.186.305a.282.282 0 0 1 .014.035 1.056 1.056 0 0 1-.146.183 4.747 4.747 0 0 1-.595.528c-.26.194-.503.402-.723.617-.203.2-.472.509-.472.891 0 .133.029.275.088.435.045.121.084.213.115.275.029.059.087.16.175.302.06.097.097.158.109.18.567 1.022 1.227 1.912 1.962 2.647.734.735 1.625 1.395 2.646 1.961.027.015.086.051.181.11.142.088.243.146.301.175.063.032.155.071.277.115.159.06.301.089.434.089.383 0 .692-.27.891-.473.218-.222.426-.465.618-.723a4.74 4.74 0 0 1 .527-.594c.092-.087.152-.129.184-.147.009.002.02.007.034.014.052.025.148.078.306.187.141.097.224.155.251.175l.023.018.024.014c.184.111.38.224.589.341.205.115.435.242.687.38.246.132.434.237.567.314.338.17.498.273.57.326a3.021 3.021 0 0 1-.093.619 3.764 3.764 0 0 1-.192.635c-.049.116-.244.417-1.07.875-.583.316-1.165.478-1.727.478z" class="chcls-1"/></symbol><symbol viewBox="0 0 18 18" id="icon-play"><path d="M5 4.914L11.915 9 5 13.086V4.914zM4 2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1l10.569-6.246a.876.876 0 0 0 0-1.508L4 2z"/></symbol><symbol viewBox="0 0 30 30" id="icon-property-edit"><path d="M3 9v17h12V14zm5 15H5v-3h3v3zm0-5H5v-3h3v3zm5 5h-3v-3h3v3zm0-5h-3v-3h3v3zm15-7v-2h-1.75a4.44 4.44 0 0 0-.5-1.34l1.2-1.2-1.41-1.41-1.12 1.11A4.47 4.47 0 0 0 23 6.51V5h-2v1.42a4.46 4.46 0 0 0-1.55.58l-1-1-1.4 1.46 1 1a4.46 4.46 0 0 0-.63 1.54H16v2h1.51a4.47 4.47 0 0 0 .66 1.42l-1.11 1.11 1.41 1.41 1.2-1.2a4.44 4.44 0 0 0 1.34.5V17h2v-1.84a4.47 4.47 0 0 0 1.22-.53l1.32 1.32 1.41-1.41-1.32-1.32a4.47 4.47 0 0 0 .52-1.22H28zm-6.17 1.33a2.5 2.5 0 1 1 2.5-2.5 2.5 2.5 0 0 1-2.5 2.5z"/></symbol><symbol viewBox="0 0 22 22" id="icon-remove--favorites"><path d="M15.7 9.2l.5-.5-4.2-.6-1.9-3.8-1.8 3.8-4.2.6 3 3-.7 4.2 3.8-2 1.7.9c.6.8 1.6 1.3 2.7 1.3 1.9 0 3.5-1.6 3.5-3.5C18 11 17 9.7 15.7 9.2zM11 12.5c0 .2 0 .5.1.7l-.9-.5L7.7 14l.5-2.7-2-1.9L8.9 9l1.2-2.5L11.3 9l1.8.3c-1.2.5-2.1 1.7-2.1 3.2zm3.5 2.5c-1.4 0-2.5-1.1-2.5-2.5s1.1-2.5 2.5-2.5 2.5 1.1 2.5 2.5-1.2 2.5-2.5 2.5zM13 13h3v-1h-3v1z"/></symbol><symbol viewBox="0 0 22 22" id="icon-remove--gallery"><path d="M17.5 8c-.5 0-1 .1-1.5.3V5H2v11h14v-1.3c.4.2.9.3 1.5.3 1.9 0 3.5-1.6 3.5-3.5S19.4 8 17.5 8zM3 6h12v3c-.6.6-1 1.5-1 2.5 0 .5.1 1 .4 1.5h-.1L12 10.2l-1.9 2-3.1-4-4 4.5V6zm12 9H3v-1h.2l3.7-4.2 3 4.1 2-2.1 1.9 2.2H15v1zm2.5-1c-1.4 0-2.5-1.1-2.5-2.5S16.1 9 17.5 9s2.5 1.1 2.5 2.5-1.2 2.5-2.5 2.5zM16 12h3v-1h-3v1z"/></symbol><symbol viewBox="0 0 22 22" id="icon-remove--post"><path d="M12 8H5v1h7V8zm0 2H5v1h7v-1zm-7 3h4v-1H5v1zm10.5-3c-.5 0-1.5.1-1.5.3V4H3v14h11v-1.3c0 .2 1 .3 1.5.3 1.9 0 3.5-1.6 3.5-3.5S17.4 10 15.5 10zM13 17H4V5h9v6c-1 .6-1 1.5-1 2.5s0 1.9 1 2.5v1zm2.5-1c-1.4 0-2.5-1.1-2.5-2.5s1.1-2.5 2.5-2.5 2.5 1.1 2.5 2.5-1.1 2.5-2.5 2.5zM14 14h3v-1h-3v1z"/></symbol><symbol viewBox="0 0 22 22" id="icon-remove--property"><path d="M17.5 3c-2 0-3.5 1.6-3.5 3.5s1.6 3.5 3.5 3.5S21 8.4 21 6.5 19.4 3 17.5 3zm0 6C16.1 9 15 7.9 15 6.5S16.1 4 17.5 4 20 5.1 20 6.5 18.8 9 17.5 9zM16 7h3V6h-3v1zM.7 11.6l.5.8L4 10.7V16h10v-5.3l2.7 1.7.5-.8L9 6.4.7 11.6zM13 10.1V15H5v-4.9l4-2.5 4 2.5z"/></symbol><symbol viewBox="0 0 18 18" id="icon-restart"><path d="M1 2a1 1 0 0 1 1 1v4.318L11 2a1 1 0 0 1 1 1v1.954L17 2a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1l-5-2.955V15a1 1 0 0 1-1 1l-9-5.318V15a1 1 0 0 1-2 0V3a1 1 0 0 1 1-1zm11 8.722l4 2.364V4.914l-4 2.364v3.444zm-2 2.364V4.914L3.085 9 10 13.086z"/></symbol><symbol viewBox="0 0 18 21" id="icon-rewind"><path d="M.431 10.754L11 17a1 1 0 0 0 1-1v-1.954L17 17a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1l-5 2.955V4a1 1 0 0 0-1-1L.431 9.246a.876.876 0 0 0 0 1.508zM12 8.278l4-2.364v8.172l-4-2.364V8.278zm-2-2.364v8.172L3.085 10 10 5.914z"/></symbol><symbol viewBox="0 0 40 40" id="icon-sales"><path d="M22.2 24.9c-.4-.3-.9-.6-1.3-.8-.5-.2-.9-.4-1.3-.7-.4-.2-.7-.5-1-.8-.3-.3-.4-.7-.4-1.2 0-.6.2-1 .5-1.4.4-.3.8-.5 1.4-.5.5 0 1 .1 1.3.3s.7.5 1.1.8l.9-1c-.4-.4-.5-.7-1-1-.4-.3-1.4-.4-1.4-.5V16h-2v2.2c0 .1-1.4.5-1.9 1.1-.5.6-.7 1.3-.7 2.2 0 .6.2 1.2.5 1.6.3.4.6.8 1 1.1.4.3.9.5 1.3.8.5.2.9.5 1.3.7s.7.6 1 .9c.3.3.4.8.4 1.3 0 .6-.2 1.1-.5 1.5-.4.4-.9.6-1.6.6-.6 0-1.2-.1-1.7-.4-.5-.3-1-.6-1.4-.9l-.7 1c.4.4.7.7 1.3 1s1.6.5 1.6.5V33h2v-1.8c1-.1 1.5-.5 2-1.1.5-.6.7-1.4.7-2.3 0-.7-.2-1.3-.5-1.7-.1-.6-.5-.9-.9-1.2zm8.6-8.5l-9.7-6.8L28.4 1H11.6l7.3 8.6-9.7 6.8-4.3 14.2L8.7 39h22.6l3.8-8.4-4.3-14.2zM15.9 3h8.2L20 7.8 15.9 3zM30 37H10l-2.9-6.5L11 17.6l9.1-6.4 9.1 6.4 3.9 12.9L30 37z"/></symbol><symbol viewBox="0 0 30 30" id="icon-statistics"><path d="M25 23H4V8h1v14h20v1z"/><path d="M7 20h4v2H7zm6-4h4v6h-4zm6-4h4v10h-4z"/></symbol><symbol viewBox="0 0 40 40" id="icon-transactions"><path d="M28 10V3H12v7H1v27h38V10H28zM14 5h12v5H14V5zm23 7v7H3v-7h34zm-19 9h4v4h-4v-4zM3 35V21h13v6h8v-6h13v14H3z"/></symbol><symbol viewBox="-7 377 16 16" id="icon-user"><path d="M-7 393v-.9s0-.7.1-1.4c.2-1.1.5-1.9.9-2.4.5-.5 1.4-.8 2.2-1 .4-.1.8-.2 1.1-.3.3-.1.4-.2.5-.3v-.1c.1-.3 0-.6-.5-1.3-.2-.3-.5-.7-.7-1.2-.6-1.4-.7-2.9-.3-4.3.3-.9.9-1.6 1.7-2.1 1-.4 1.9-.7 3-.7s2 .2 2.8.7c.8.5 1.4 1.2 1.7 2.1.4 1.4.3 2.9-.3 4.3-.2.5-.4.8-.7 1.2-.4.7-.6 1-.5 1.3v.1c.1.1.2.2.5.3.3.1.7.2 1.1.3.8.2 1.7.5 2.2 1 .5.5.8 1.2.9 2.4.1.8.1 1.4.1 1.4v.9H-7zm2.3-3.5c-.1.1-.3.5-.4 1.4v.2l.3-.1h12v-.2c-.2-1.1-.4-1.3-.4-1.3-.2-.2-.7-.3-1.5-.5-1.1-.3-2.4-.6-2.8-1.7-.5-1.2.1-2.2.6-2.9.2-.3.4-.6.5-.9.4-1.1.5-2.1.2-3.1-.4-1.4-1.9-1.6-2.8-1.6s-2.3.2-2.8 1.6c-.3 1-.2 2 .2 3.1.1.3.3.6.5.9.5.8 1.1 1.7.6 2.9-.4 1-1.7 1.4-2.8 1.7-.7.2-1.2.3-1.4.5z"/></symbol><symbol viewBox="0 0 30 30" id="icon-user-admin"><path d="M6.94 23.25v-.88a12.22 12.22 0 0 1 .13-1.43A4.24 4.24 0 0 1 8 18.57a5 5 0 0 1 2.25-1 11.12 11.12 0 0 0 1.12-.34 1.61 1.61 0 0 0 .5-.28v-.06a1.55 1.55 0 0 0-.49-1.28 7.65 7.65 0 0 1-.68-1.19 6.12 6.12 0 0 1-.26-4.29A3.82 3.82 0 0 1 12.22 8 5.3 5.3 0 0 1 15 7.25a5.3 5.3 0 0 1 2.78.75 3.82 3.82 0 0 1 1.66 2.13 6.12 6.12 0 0 1-.26 4.29 7.66 7.66 0 0 1-.68 1.19 1.55 1.55 0 0 0-.5 1.25v.06a1.61 1.61 0 0 0 .5.28 11.11 11.11 0 0 0 1.12.34 5 5 0 0 1 2.25 1 4.24 4.24 0 0 1 .94 2.37 12.22 12.22 0 0 1 .19 1.46v.88H6.94zm2.28-3.43a3.27 3.27 0 0 0-.43 1.41v.3h12.46v-.33a2.89 2.89 0 0 0-.45-1.42 4.35 4.35 0 0 0-1.47-.54c-1.12-.3-2.39-.64-2.82-1.68a3 3 0 0 1 .62-2.93 6.14 6.14 0 0 0 .53-.92 4.37 4.37 0 0 0 .2-3.1A2.71 2.71 0 0 0 15 9a2.71 2.71 0 0 0-2.81 1.64 4.37 4.37 0 0 0 .2 3.1 6.14 6.14 0 0 0 .53.92 3 3 0 0 1 .62 2.93c-.44 1-1.7 1.38-2.82 1.68a4.33 4.33 0 0 0-1.47.54z"/></symbol><symbol viewBox="0 0 40 40" id="icon-valid"><path d="M24.7 10.3c-.4-.4-1-.4-1.4 0l-4 4c-.4.4-.4 1 0 1.4.4.4 1 .4 1.4 0l2.3-2.3c.3 2.8-.5 5.7-2.3 8-2 2.6-5 4.1-8 4.1-.6 0-1 .4-1 1s.4 1 1 1c3.6 0 7.2-1.8 9.6-4.9 2.1-2.7 3-5.9 2.7-9.2l2.3 2.3c.2.2.5.3.7.3.3 0 .5-.1.7-.3.4-.4.4-1 0-1.4l-4-4zM40 20C40 9 31 0 20 0S0 9 0 20s8.9 20 20 20c4 0 7.7-1.2 10.8-3.1 3.7 1 8.2 2.1 8.2 2.1s-1-4-2.1-8.3C38.8 27.6 40 24 40 20zm-8.7 14.9c-.2 0-.4-.1-.5-.1-.4 0-.8.1-1.1.3C26.8 37 23.4 38 20 38c-9.9 0-18-8.1-18-18S10.1 2 20 2s18 8.1 18 18c0 3.4-1 6.8-2.8 9.7-.3.5-.4 1.1-.2 1.6.5 1.8.9 3.5 1.3 5-1.6-.4-3.4-.9-5-1.4z"/></symbol><symbol viewBox="0 0 18 18" id="icon-volume"><path d="M10.214 2a.62.62 0 0 0-.334.101l-4.048 2.81A.494.494 0 0 1 5.549 5H1.996A.998.998 0 0 0 1 6v6c0 .552.446 1 .996 1h3.553c.102 0 .2.031.283.089l4.048 2.81a.62.62 0 0 0 .334.101c.392 0 .747-.4.747-.949V2.95c0-.55-.355-.949-.747-.949zM8.969 12.834l-2.387-1.657a.996.996 0 0 0-.566-.178H3.491a.5.5 0 0 1-.498-.5v-3a.5.5 0 0 1 .498-.5h2.525c.202 0 .4-.062.566-.178l2.387-1.657v7.669zm7.965-4.035c-.086-1.748-1.514-2.991-2.507-3.649-.47-.312-1.094-.122-1.325.408l-.038.086a.973.973 0 0 0 .336 1.194c.706.473 1.586 1.247 1.624 2.065.032.676-.553 1.468-1.663 2.27a.987.987 0 0 0-.285 1.275l.042.075c.266.475.866.624 1.3.312 1.74-1.251 2.586-2.606 2.516-4.037z"/></symbol><symbol viewBox="0 0 17 22" id="icon-window"><path d="M0 0v22h17V0H0zm15 2v2H2V2h13zM2 10V8h13v2H2zm0-3V5h13v2H2zm0 13v-8h6v2H7v3h3v-3H9v-2h6v8H2z"/></symbol><symbol viewBox="0 0 17 31" id="slider-handle"><linearGradient id="cya" gradientUnits="userSpaceOnUse" x1="8.5" y1="31" x2="8.5" y2="8"><stop offset="0" stop-color="#e4e4e4" stop-opacity="0"/><stop offset="1" stop-color="#e4e4e4"/></linearGradient><path fill="url(#cya)" d="M0 8h17v23H0z"/><linearGradient id="cyb" gradientUnits="userSpaceOnUse" x1="8.5" y1=".5" x2="8.5" y2="16.5"><stop offset="0" stop-color="#fff"/><stop offset="1" stop-color="#ececec"/></linearGradient><path fill="url(#cyb)" d="M8.5 16.5c-4.4 0-8-3.6-8-8s3.6-8 8-8 8 3.6 8 8-3.6 8-8 8z"/><path fill="#CACACA" d="M8.5 1C12.6 1 16 4.4 16 8.5S12.6 16 8.5 16 1 12.6 1 8.5 4.4 1 8.5 1m0-1C3.8 0 0 3.8 0 8.5S3.8 17 8.5 17 17 13.2 17 8.5 13.2 0 8.5 0z"/><path fill="#CBCBCB" d="M6 6h1v5H6zm2 0h1v5H8zm2 0h1v5h-1z"/></symbol><symbol viewBox="0 0 17 17" id="slider-handle-2"><linearGradient id="cza" gradientUnits="userSpaceOnUse" x1="8.5" y1=".5" x2="8.5" y2="16.5"><stop offset="0" stop-color="#fff"/><stop offset="1" stop-color="#ececec"/></linearGradient><path fill="url(#cza)" d="M8.5 16.5c-4.4 0-8-3.6-8-8s3.6-8 8-8 8 3.6 8 8-3.6 8-8 8z"/><path fill="#CACACA" d="M8.5 1C12.6 1 16 4.4 16 8.5S12.6 16 8.5 16 1 12.6 1 8.5 4.4 1 8.5 1m0-1C3.8 0 0 3.8 0 8.5S3.8 17 8.5 17 17 13.2 17 8.5 13.2 0 8.5 0z"/><path fill="#CBCBCB" d="M6 6h1v5H6zm2 0h1v5H8zm2 0h1v5h-1z"/></symbol></svg>
    <!-- endinject -->
    <div class="box js-box">
        <!-- BEGIN HEADER-->
        <header class="header header--brand">
            <%@ include file="/template/header.jsp" %>
        </header>
        <!-- END HEADER-->

        <!-- BEGIN NAVBAR-->
        <div id="header-nav-offset"></div>
        <nav id="header-nav" class="navbar navbar--header">
            <%@ include file="/template/navbar.jsp" %>
        </nav>
        <!-- END NAVBAR-->
        <div class="site-wrap js-site-wrap">
            <!-- BEGIN CENTER SECTION-->
            <div class="center">
                <div class="container">
                    <div class="row">
                        <header class="site__header">
                            <h1 class="site__title site__title--center">Dashboard</h1>
                        </header>
                        <!-- BEGIN LISTING-->
                        <div class="site site--dashboard">
                            <div class="site__main">
                                <div class="widget js-widget widget--dashboard">
                                    <div class="widget__header">
                                        <h2 class="widget__title">Add new property</h2>
                                    </div>
                                    <div class="widget__content">
                                        <!-- BEGIN Favorites-->
                                        <section class="form-property form-property--dashboard">
                                            <!-- Nav tabs-->
                                            <ul role="tablist" class="nav form-property__tabs">
                                                <li role="presentation" class="active"><a>Basic</a></li>
                                                <li role="presentation"><a>Photo</a></li>
                                                <!--
                                                <li role="presentation"><a href="#Status" aria-controls="Status" role="tab" data-toggle="tab">Extra</a></li>
                                                -->
                                            </ul>
                                            <!-- Tab panes-->
                                            <form action="<%=request.getContextPath()%>/EstateCreate" class="form form--flex form--property form--basic js-form-property-1">
                                                <div class="tab-content form-property__content">
                                                    <div id="basic" role="tabpanel" class="tab-pane active">
                                                        <div class="row">
                                                            <div class="form-group form-group--description">
                                                                <label for="in-1" class="control-label">Estate Name</label>
                                                                <input id="in-1" required type="text" name="estateName" data-placeholder="---" value="Text" class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="in-15" class="control-label">Estate Type</label>
                                                                <select id="in-15" required name="estateTypeId" data-placeholder="---" class="form-control">
                                                                    <option label=" "></option>
                                                                    <c:forEach items="${estateTypeList}" var="estateTypeList">
                                                                        <option value="${estateTypeList.id}">${estateTypeList.typeName}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="in-10" class="control-label">Bed room</label>
                                                                <input id="in-10" type="number" name="bedRoom" placeholder="" required class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="in-10" class="control-label">Bath room</label>
                                                                <input id="in-10" type="number" name="bathRoom" placeholder="" required class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="in-10" class="control-label">Garages</label>
                                                                <input id="in-10" type="number" name="garages" placeholder="" required class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="in-10" class="control-label">Price</label>
                                                                <input id="in-10" type="number" name="price" placeholder="" required class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="in-10" class="control-label">Areas</label>
                                                                <input id="in-10" type="number" name="areas" placeholder="" required class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="in-5" class="control-label">Direction</label>
                                                                <select id="in-5" name="direction" data-placeholder="Choose a Direction..." required class="form-control js-in-select">
                                                                    <option label=" "></option>
                                                                    <option value="East">East</option>
                                                                    <option value="West">West</option>
                                                                    <option value="South">South</option>
                                                                    <option value="North">North</option>
                                                                    <option value="South">South-East</option>
                                                                    <option value="South">South-West</option>
                                                                    <option value="North-West">North-West</option>
                                                                    <option value="North-West">North-East</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="in-2" class="control-label">Estate Status</label>
                                                                <select id="in-2" required name="estateStatusId" data-placeholder="---" class="form-control">
                                                                    <option label=" "></option>
                                                                    <c:forEach items="${estateStatusList}" var="estateStatusList">
                                                                        <option value="${estateStatusList.id}">${estateStatusList.estateStatusName}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="in-9" class="control-label">Built Up</label>
                                                                <input name="yearBuild" type="text" id="in-datetime" value="01/01/2019" data-time-picker="false" data-single-picker="true" class="js-datetimerange form-control">
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="in-6" class="control-label">Address 1</label>
                                                                <input id="in-6" type="text" name="address1" required class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="in-6" class="control-label">Address 2</label>
                                                                <input id="in-6" type="text" name="address2" required class="form-control">
                                                            </div>
                                                            <div class="form-group form-group--description">
                                                                <label for="in-6" class="control-label">Content</label>
                                                                <textarea id="in-6" name="estateDescription" rows="4" cols="50" class="form-control"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <a href="#Photo" aria-controls="Photo" class="form__submit" role="tab" data-toggle="tab">Next</a>
                                                        </div>
                                                    </div>
                                                    <div id="Photo" role="tabpanel" class="tab-pane">
                                                        <div class="listing--items listing--grid listing--photos">
                                                            <div class="listing__actions">
                                                                <div class="listing__actions-border"></div>
                                                                <h4 id="countimage" class="form__title js-form-title active">Estate have 0/5 photo</h4>
                                                                <input type="button" class="btn--action js-listing-add-photo" value="Add Photo" onclick="BrowseServer();" />
                                                            </div>
                                                            <div class="listing__list js-photos-list">
                                                                <div class="listing__item js-listing-item">
                                                                    <div class="listing__item-header">
                                                                        <div></div>
                                                                        <div class="listing__tools">
                                                                            <input onclick="BrowseServer1();" type="button" class="listing__tools-link js-photos-edit" value="Edit" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="listing__thumb">
                                                                        <a class="item-photo item-photo--static js-gallery-item">
                                                                            <input id="image1st" name="image1st" type="hidden"/>
                                                                            <img width="240" height="160" id="imageup1st" name="imageup1st" src="http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg" alt="">
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <!-- end of block .listing__item 11111-->
                                                                <div class="listing__item js-listing-item">
                                                                    <div class="listing__item-header">
                                                                        <div></div>
                                                                        <div class="listing__tools">
                                                                            <input onclick="BrowseServer2();" type="button" class="listing__tools-link js-photos-edit" value="Edit" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="listing__thumb">
                                                                        <a class="item-photo item-photo--static js-gallery-item">
                                                                            <input id="image2st" name="image2st" type="hidden"/>
                                                                            <img width="240" height="160" id="imageup2st" name="imageup2st" src="http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg" alt="">
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <!-- end of block .listing__item 2222222-->
                                                                <div class="listing__item js-listing-item">
                                                                    <div class="listing__item-header">
                                                                        <div></div>
                                                                        <div class="listing__tools">
                                                                            <input onclick="BrowseServer3();" type="button" class="listing__tools-link js-photos-edit" value="Edit" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="listing__thumb">
                                                                        <a class="item-photo item-photo--static js-gallery-item">
                                                                            <input id="image3st" name="image3st" type="hidden"/>
                                                                            <img width="240" height="160" id="imageup3st" name="imageup3st" src="http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg" alt="">
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <!-- end of block .listing__item 3333333-->
                                                                <div class="listing__item js-listing-item">
                                                                    <div class="listing__item-header">
                                                                        <div></div>
                                                                        <div class="listing__tools">
                                                                            <input onclick="BrowseServer4();" type="button" class="listing__tools-link js-photos-edit" value="Edit" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="listing__thumb">
                                                                        <a class="item-photo item-photo--static js-gallery-item">
                                                                            <input id="image4st" name="image4st" type="hidden"/>
                                                                            <img width="240" height="160" id="imageup4st" name="imageup4st" src="http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg" alt="">
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <!-- end of block .listing__item 44444-->
                                                                <div class="listing__item js-listing-item">
                                                                    <div class="listing__item-header">
                                                                        <div></div>
                                                                        <div class="listing__tools">
                                                                            <input onclick="BrowseServer5();" type="button" class="listing__tools-link js-photos-edit" value="Edit" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="listing__thumb">
                                                                        <a class="item-photo item-photo--static js-gallery-item">
                                                                            <input id="image5st" name="image5st" type="hidden"/>
                                                                            <img width="240" height="160" id="imageup5st" name="imageup5st" src="http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/01.jpg" alt="">
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <!-- end of block .listing__item 55555-->
                                                            </div>
                                                        </div>
                                                        <!-- END Photos-->
                                                        <!--<form class="form form--flex form--property form--photo js-form-property">-->
                                                        <div class="row">
                                                            <input type="submit" name="submit" value="submit" class="form__submit"/>
                                                        </div>
                                                        <!--</form>-->
                                                    </div>
                                                    <div id="Status" role="tabpanel" class="tab-pane">
                                                        <!--<form class="form form--flex form--property form--extra js-form-property">-->
                                                        <div class="row">
                                                            <div class="form-group form-group--col-12 form-group--inline">
                                                                <label class="control-label">Market Status</label>
                                                                <ul class="form__check">
                                                                    <li>
                                                                        <input type="radio" name="market_status" id="in-radio-market-status-0" class="in-radio">
                                                                        <label for="in-radio-market-status-0" class="in-label">Draft</label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" name="market_status" id="in-radio-market-status-1" class="in-radio">
                                                                        <label for="in-radio-market-status-1" class="in-label">Published</label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" name="market_status" id="in-radio-market-status-2" class="in-radio">
                                                                        <label for="in-radio-market-status-2" class="in-label">Unpublished</label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" name="market_status" id="in-radio-market-status-3" class="in-radio">
                                                                        <label for="in-radio-market-status-3" class="in-label">Expired</label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" name="market_status" id="in-radio-market-status-4" class="in-radio">
                                                                        <label for="in-radio-market-status-4" class="in-label">Transacting</label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" name="market_status" id="in-radio-market-status-5" class="in-radio">
                                                                        <label for="in-radio-market-status-5" class="in-label">Transacted</label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" name="market_status" id="in-radio-market-status-6" class="in-radio">
                                                                        <label for="in-radio-market-status-6" class="in-label">Withdraw</label>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div class="form-group form-group--col-12 form-group--inline">
                                                                <label class="control-label">Sale status</label>
                                                                <ul class="form__check">
                                                                    <li>
                                                                        <input type="checkbox" name="sale_status" id="in-check-sale-status-0" class="in-checkbox">
                                                                        <label for="in-check-sale-status-0" class="in-label">Urgent Sale</label>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <button class="form__submit">Next</button>
                                                        </div>
                                                        <!--</form>-->
                                                    </div>

                                                </div>

                                            </form>
                                        </section>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END LISTING-->
                        <!-- BEGIN SIDEBAR-->
                        <div class="sidebar sidebar--dashboard">
                            <%@ include file="/template/dashboard/sidebar.jsp" %>
                        </div>
                        <!-- END SIDEBAR-->
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <div id="myModal" tabindex="-1" role="dialog" class="modal fade">
                <div role="document" class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2 class="site__title">Add Success</h2>
                        </div>
                        <div class="modal-body">
                            <h3>Are you want continue create estate ?</h3>
                            <button type="button" data-dismiss="modal" aria-label="Close" class="form__submit">Yes</button>
                            <a href="<%=request.getContextPath()%>/EstateList?user=admin" class="form__submit">No</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END CENTER SECTION-->
            <!-- BEGIN AFTER CENTER SECTION-->
            <!-- END AFTER CENTER SECTION-->
            <!-- BEGIN FOOTER-->
            <footer class="footer">
                <%@ include file="/template/footer.jsp" %>
            </footer>
            <!-- end of block .footer-->
            <!-- END FOOTER-->
        </div>
    </div>
    <button type="button" class="scrollup js-scrollup"></button>
    <!-- end of block .scrollup-->
    <!-- BEGIN SCRIPTS and INCLUDES-->
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?libraries=places,drawing,geometry"></script>
    <script type="text/javascript" src="http://cdn.ckeditor.com/4.5.6/standard/ckeditor.js"></script>
    <!--
    Contains vendor libraries (Bootstrap3, Jquery, Chosen, etc) already compiled into a single file, with
    versions that are verified to work with our theme. Normally, you should not edit that file.
    -->
    <!-- build:jsvendor-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/vendor.js"></script>
    <!-- endbuild-->
    <!--
    This file is used for demonstration purposes and contains example property items, that are mostly used to
    render markers on the map. You can safely delete this file, after you've adapted the demo.js code
    to use your own data.
    -->
    <!-- build:jsdemodata-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/demodata.js"></script>
    <!-- endbuild-->
    <!--
    The library code that Realtyspace theme relies on, in order to function properly.
    Normally, you should not edit this file or add your own code there.
    -->
    <!-- build:jsapp-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/app.js"></script>
    <!-- endbuild-->
    <!--
    the main file, that you should modify. It contains lots of examples of
    plugin usage, with detailed comments about specific sections of the code.
    -->
    <!-- build:jsdemo-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/demo.js"></script>
    <!-- endbuild--><!-- inject:ga  -->
    <!-- endinject -->

    <script type="text/javascript">
        $(window).on('load', function () {
            $('#myModal').modal('${modal}');
        });
    </script>

    <!-- END SCRIPTS and INCLUDES-->
</body>
</html>
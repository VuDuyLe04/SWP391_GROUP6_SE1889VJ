<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="fixed">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <meta name="keywords" content="HTML5 Admin Template"/>
    <meta name="description" content="Porto Admin - Responsive HTML5 Template">
    <meta name="author" content="okler.net">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Đăng ký - RiceChicken</title>
    <!-- Web Fonts  -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light"
          rel="stylesheet" type="text/css">

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="/client/auth/assets/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="/client/auth/assets/vendor/font-awesome/css/font-awesome.css"/>
    <link rel="stylesheet" href="/client/auth/assets/vendor/magnific-popup/magnific-popup.css"/>
    <link rel="stylesheet" href="/client/auth/assets/vendor/bootstrap-datepicker/css/datepicker3.css"/>

    <!-- Theme CSS -->
    <link rel="stylesheet" href="/client/auth/assets/stylesheets/theme.css"/>

    <!-- Skin CSS -->
    <link rel="stylesheet" href="/client/auth/assets/stylesheets/skins/default.css"/>

    <!-- Theme Custom CSS -->
    <link rel="stylesheet" href="/client/auth/assets/stylesheets/theme-custom.css">

    <!-- Head Libs -->
    <script src="/client/auth/assets/vendor/modernizr/modernizr.js"></script>

</head>
<body>
<!-- start: page -->
<section class="body-sign">
    <div class="center-sign">
        <a href="/" class="logo pull-left">
            <img src="/client/auth/assets/images/logo.png" height="54" alt="Porto Admin"/>
        </a>

        <div class="panel panel-sign">
            <div class="panel-title-sign mt-xl text-right">
                <h2 class="title text-uppercase text-bold m-none"><i class="fa fa-user mr-xs"></i> ĐĂNG KÝ</h2>
            </div>
            <div class="panel-body">
                <form:form modelAttribute="registerUser" action="/register" method="post">

                <c:set var="errorPassword">
                    <form:errors path="confirmPassword"
                                 cssClass="invalid-feedback" cssStyle="color: red"/>
                </c:set>
                <c:set var="errorPhone">
                    <form:errors path="phone" cssClass="invalid-feedback" cssStyle="color: red"/>
                </c:set>
                <c:set var="errorName">
                    <form:errors path="name" cssClass="invalid-feedback" cssStyle="color: red"/>
                </c:set>
                <div class="form-group mb-lg">
                    <label>Tên</label>
                    <form:input path="name" type="text"
                                class="form-control input-lg ${not empty errorName ? 'is-invalid' : ''}"/>
                        ${errorName}
                </div>

                <div class="form-group mb-lg">
                    <label>Số địện thoại</label>
                    <form:input path="phone" type="text"
                                class="form-control input-lg ${not empty errorPhone ? 'is-invalid' : ''}"/>
                        ${errorPhone}
                </div>

                <div class="form-group mb-none">
                    <div class="row">
                        <div class="col-sm-6 mb-lg">
                            <label>Mật khẩu</label>
                            <form:input path="password" type="password"
                                        class="form-control input-lg ${not empty errorPassword ? 'is-invalid' : ''}"/>
                                ${errorPassword}
                        </div>
                        <div class="col-sm-6 mb-lg">
                            <label>Nhập lại mật khẩu</label>
                            <form:input path="confirmPassword" type="password" class="form-control input-lg"/>

                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="col-sm-12 text-center">
                        <button type="submit" class="btn btn-primary hidden-xs">ĐĂNG KÝ</button>
                        <button type="submit" class="btn btn-primary btn-block btn-lg visible-xs mt-lg">ĐĂNG KÝ
                        </button>
                    </div>
                </div>

                <p class="text-center">Bạn đã có tài khoản? <a href="/login">Đăng nhập!</a>
                    </form:form>
            </div>
        </div>

        <p class="text-center text-muted mt-md mb-md">&copy; Copyright 2025. All rights reserved. Template by <a
                href="">Vu Duy Le</a>.</p>
    </div>
</section>
<!-- end: page -->

<!-- Vendor -->
<script src="/client/auth/assets/vendor/jquery/jquery.js"></script>
<script src="/client/auth/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>
<script src="/client/auth/assets/vendor/nanoscroller/nanoscroller.js"></script>
<script src="/client/auth/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="/client/auth/assets/vendor/magnific-popup/magnific-popup.js"></script>
<script src="/client/auth/assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

<!-- Theme Base, Components and Settings -->
<script src="/client/auth/assets/javascripts/theme.js"></script>

<!-- Theme Custom -->
<script src="/client/auth/assets/javascripts/theme.custom.js"></script>

<!-- Theme Initialization Files -->
<script src="/client/auth/assets/javascripts/theme.init.js"></script>

</body>
</html>
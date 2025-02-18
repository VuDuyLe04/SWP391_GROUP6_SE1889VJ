<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="fixed">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>Thông tin cá nhân</title>
    <meta name="keywords" content="HTML5 Admin Template" />
    <meta name="description" content="Porto Admin - Responsive HTML5 Template">
    <meta name="author" content="okler.net">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <!-- Web Fonts  -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="/client/auth/assets/vendor/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="/client/auth/assets/vendor/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" href="/client/auth/assets/vendor/magnific-popup/magnific-popup.css" />
    <link rel="stylesheet" href="/client/auth/assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

    <!-- Theme CSS -->
    <link rel="stylesheet" href="/client/auth/assets/stylesheets/theme.css" />

    <!-- Skin CSS -->
    <link rel="stylesheet" href="/client/auth/assets/stylesheets/skins/default.css" />

    <!-- Theme Custom CSS -->
    <link rel="stylesheet" href="/client/auth/assets/stylesheets/theme-custom.css">

    <!-- Head Libs -->
    <script src="/client/auth/assets/vendor/modernizr/modernizr.js"></script>

</head>
<body>
<section class="body">

    <!-- start: header -->
    <jsp:include page="../layout/header.jsp" />
    <!-- end: header -->

    <div class="inner-wrapper">
        <!-- start: sidebar -->
        <jsp:include page="../layout/sidebar.jsp" />
        <!-- end: sidebar -->

        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Thông tin cá nhân</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Thông tin cá nhân</span></li>

                    </ol>

                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <!-- start: page -->

            <div class="row">
                <div class="col-md-4 col-lg-3">

                    <section class="panel">
                        <div class="panel-body">
                            <div class="thumb-info mb-md">
                                <img src="/client/auth/assets/images/vuduyle.jpg" class="rounded img-responsive" alt="John Doe">
                                <div class="thumb-info-title">
                                    <span class="thumb-info-inner">${sessionScope.user.name}</span>
                                    <span class="thumb-info-type">${sessionScope.user.role.name}</span>
                                </div>
                            </div>
                        </div>
                    </section>


                </div>
                <div class="col-md-8 col-lg-6">

                    <div class="tabs">
                        <ul class="nav nav-tabs tabs-primary">

                            <li class="active">
                                <a href="#edit" data-toggle="tab">Tổng quan</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="edit" class="tab-pane active">

                                <div class="form-horizontal" method="get">
                                    <h4 class="mb-xlg">Thông tin cá nhân</h4>
                                    <form:form modelAttribute="user" method="post" action="/profile/update">
                                        <c:set var="errorName">
                                            <form:errors path="name"
                                                         cssClass="invalid-feedback" cssStyle="color: red"/>
                                        </c:set>
                                        <fieldset>
                                            <form:hidden path="id" />
                                            <form:hidden path="password" />
                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="profileFirstName">Số điện thoại</label>
                                                <div class="col-md-8">
                                                    <form:input path="phone" class="form-control" id="profileFirstName" readonly="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="profileLastName">Tên</label>
                                                <div class="col-md-8">
                                                    <form:input path="name" class="form-control ${not empty errorName ? 'is-invalid' : ''}" id="profileLastName"/>
                                                    ${errorName}
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="profileCompany">Số dư</label>
                                                <div class="col-md-8">
                                                    <form:input path="balance" class="form-control" id="profileCompany" readonly="true"/>
                                                </div>
                                            </div>

                                        </fieldset>
                                        <div class="panel-footer">
                                            <div class="row">
                                                <div class="col-md-9 col-md-offset-3">
                                                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>

                                    <hr class="dotted tall">
                                    <h4 class="mb-xlg">Đổi mật khẩu</h4>
                                    <form method="post" action="/changepassword">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <fieldset class="mb-xl">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="profileNewPassword">Mật khẩu cũ</label>
                                                <div class="col-md-8">
                                                    <input type="password" name="oldPassword" value="${oldPassword}" class="form-control ${not empty errorOld ? 'is-invalid' : ''}" id="profileOldPassword" required>
                                                    <span class="text-danger">${errorOld}</span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="profileNewPassword">Mật khẩu mới</label>
                                                <div class="col-md-8">
                                                    <input type="password" name="newPassword" value="${newPassword}" class="form-control ${not empty errorNew ? 'is-invalid' : ''}" id="profileNewPassword" required>
                                                    <span class="text-danger">${errorNew}</span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="profileNewPasswordRepeat">Nhập lại mật khẩu mới</label>
                                                <div class="col-md-8">
                                                    <input type="password" name="repeatNewPassword" value="${repeatNewPassword}" class="form-control ${not empty errorReNew ? 'is-invalid' : ''}" id="profileNewPasswordRepeat" required>
                                                    <span class="text-danger">${errorReNew}</span>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <div class="panel-footer">
                                            <div class="row">
                                                <div class="col-md-9 col-md-offset-3">
                                                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                                                    <button type="reset" class="btn btn-default">Reset</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>


                                </div>

                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <!-- end: page -->
        </section>
    </div>

</section>
<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
<div id="alertMessage" class="alert alert-success text-center" style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999; width: 50%;" role="alert">
    <%= message %>
</div>
<script>

    setTimeout(function () {
        document.getElementById("alertMessage").style.display = 'none';
    }, 2000);
</script>
<%
        session.removeAttribute("message");
    }
%>
<!-- Vendor -->
<script src="/client/auth/assets/vendor/jquery/jquery.js"></script>
<script src="/client/auth/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>
<script src="/client/auth/assets/vendor/nanoscroller/nanoscroller.js"></script>
<script src="/client/auth/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="/client/auth/assets/vendor/magnific-popup/magnific-popup.js"></script>
<script src="/client/auth/assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

<!-- Specific Page Vendor -->
<script src="/client/auth/assets/vendor/jquery-autosize/jquery.autosize.js"></script>

<!-- Theme Base, Components and Settings -->
<script src="/client/auth/assets/javascripts/theme.js"></script>

<!-- Theme Custom -->
<script src="/client/auth/assets/javascripts/theme.custom.js"></script>

<!-- Theme Initialization Files -->
<script src="/client/auth/assets/javascripts/theme.init.js"></script>

</body>
</html>
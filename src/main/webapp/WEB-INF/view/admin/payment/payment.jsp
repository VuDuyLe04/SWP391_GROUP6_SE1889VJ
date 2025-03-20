<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="fixed">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>Nạp tiền</title>
    <meta name="keywords" content="HTML5 Admin Template"/>
    <meta name="description" content="Porto Admin - Responsive HTML5 Template">
    <meta name="author" content="okler.net">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

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
<section class="body">

    <!-- start: header -->
    <jsp:include page="../layout/header.jsp"/>
    <!-- end: header -->

    <div class="inner-wrapper">
        <!-- start: sidebar -->
        <jsp:include page="../layout/sidebar.jsp"/>
        <!-- end: sidebar -->

        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Nạp tiền</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Nạp tiền</span></li>

                    </ol>

                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <!-- start: page -->
            <div class="row">
                <div class="col-xs-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="#" class="fa fa-caret-down"></a>
                                <a href="#" class="fa fa-times"></a>
                            </div>

                            <h2 class="panel-title">Chọn phương thức nạp</h2>
                        </header>
                        <div class="panel-body">
                            <form:form modelAttribute="paymentDTO" class="form-horizontal form-bordered" method="post"
                                       action="/payment">

                                <c:set var="errorGate">
                                    <form:errors path="gate"
                                                 cssClass="invalid-feedback" cssStyle="color: red"/>
                                </c:set>

                                <c:set var="errorAmount">
                                    <form:errors path="amount"
                                                 cssClass="invalid-feedback" cssStyle="color: red"/>
                                </c:set>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Cổng nạp</label>
                                    <div class="col-md-6">
                                        <form:select path="gate" class="form-control populate ${not empty errorGate ? 'is-invalid' : ''}">
                                            <!-- Ngân hàng -->
                                            <optgroup label="Ngân hàng">
                                                <form:option value="MBBANK">MBBANK</form:option>
                                                <form:option value="TPBANK">TPBANK</form:option>
                                            </optgroup>
                                            <optgroup label="Ví điện tử">

                                            </optgroup>
                                        </form:select>
                                            ${errorGate}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputHelpText">Số tiền</label>
                                    <div class="col-md-6">
                                        <form:input path="amount" type="number" step="5000" class="form-control ${not empty errorAmount ? 'is-invalid' : ''}"
                                                    id="inputHelpText" />
                                            ${errorAmount}
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <button type="submit" class="btn btn-primary">Xác nhận</button>
                                    </div>
                                </div>

                            </form:form>
                        </div>
                    </section>
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
<div id="alertMessage" class="alert alert-success text-center"
     style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999; width: 50%;"
     role="alert">
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
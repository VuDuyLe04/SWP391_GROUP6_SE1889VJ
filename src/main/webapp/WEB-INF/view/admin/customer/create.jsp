<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="fixed">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>Dashboard | JSOFT Themes | JSOFT-Admin</title>
    <meta name="keywords" content="HTML5 Admin Template" />
    <meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
    <meta name="author" content="JSOFT.net">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <!-- Web Fonts  -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="/client/auth/assets/vendor/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="/client/auth/assets/vendor/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" href="/client/auth/assets/vendor/magnific-popup/magnific-popup.css" />
    <link rel="stylesheet" href="/client/auth/assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

    <!-- Specific Page Vendor CSS -->
    <link rel="stylesheet" href="/client/auth/assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
    <link rel="stylesheet" href="/client/auth/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css" />
    <link rel="stylesheet" href="/client/auth/assets/vendor/morris/morris.css" />

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
                <h2>Tạo mới khách hàng</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Tạo mới khách hàng</span></li>
                    </ol>

                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>



            <!-- start: page -->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="panel-actions">

                            </div>

                            <h2 class="panel-title">Tạo mới khách hàng</h2>
                        </header>
                        <div class="panel-body">
                            <form:form modelAttribute="customer" class="form-horizontal form-bordered" method="post" action="/customer/create">

                                <c:set var="errorName">
                                    <form:errors path="name"
                                                 cssClass="invalid-feedback" cssStyle="color: red"/>
                                </c:set>

                                <c:set var="errorPhone">
                                    <form:errors path="phone"
                                                 cssClass="invalid-feedback" cssStyle="color: red"/>
                                </c:set>

<%--                                <c:set var="errorBalance">--%>
<%--                                    <form:errors path="balance"--%>
<%--                                                 cssClass="invalid-feedback" cssStyle="color: red"/>--%>
<%--                                </c:set>--%>

                                <div class="form-group">
                                    <label class="col-md-3 control-label" >Tên</label>
                                    <div class="col-md-6">
                                        <form:input path="name" class="form-control ${not empty errorName ? 'is-invalid' : ''}" />
                                            ${errorName}
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label" >Số điện thoại</label>
                                    <div class="col-md-6">
                                        <form:input path="phone" class="form-control ${not empty errorPhone ? 'is-invalid' : ''}"  />
                                            ${errorPhone}
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputReadOnly">Địa chỉ</label>
                                    <div class="col-md-6">
                                        <form:input path="address" class="form-control" id="inputReadOnly" />
                                    </div>
                                </div>

<%--                                <div class="form-group">--%>
<%--                                    <label class="col-md-3 control-label" for="inputHelpText">Tiền nợ</label>--%>
<%--                                    <div class="col-md-6">--%>
<%--                                        <form:input path="balance" class="form-control ${not empty errorBalance ? 'is-invalid' : ''}" id="inputHelpText" readonly="true"/>--%>
<%--                                        ${errorBalance}--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <c:if test="${sessionScope.user.role.name == 'STAFF'}">--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label class="col-md-3 control-label" for="inputHelpText">Cửa hàng</label>--%>
<%--                                        <div class="col-md-6">--%>
<%--                                            <input value="${sessionScope.store.name}"--%>
<%--                                                   class="form-control" id="inputHelpText" readonly="true"/>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </c:if>--%>

<%--                                <c:if test="${sessionScope.user.role.name == 'OWNER'}">--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label class="col-md-3 control-label" for="inputHelpText">Cửa hàng</label>--%>
<%--                                        <div class="col-md-6">--%>
<%--                                            <select name="storeId">--%>
<%--                                                <c:forEach items="${listStore}" var="store">--%>
<%--                                                    <option value="${store.id}">${store.name}</option>--%>
<%--                                                </c:forEach>--%>
<%--                                            </select>--%>

<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </c:if>--%>



                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <button type="submit" class="btn btn-primary">Tạo</button>
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

<!-- Vendor -->
<script src="/client/auth/assets/vendor/jquery/jquery.js"></script>
<script src="/client/auth/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>
<script src="/client/auth/assets/vendor/nanoscroller/nanoscroller.js"></script>
<script src="/client/auth/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="/client/auth/assets/vendor/magnific-popup/magnific-popup.js"></script>
<script src="/client/auth/assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

<!-- Specific Page Vendor -->
<script src="/client/auth/assets/vendor/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
<script src="/client/auth/assets/vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.js"></script>
<script src="/client/auth/assets/vendor/jquery-appear/jquery.appear.js"></script>
<script src="/client/auth/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.js"></script>
<script src="/client/auth/assets/vendor/jquery-easypiechart/jquery.easypiechart.js"></script>
<script src="/client/auth/assets/vendor/flot/jquery.flot.js"></script>
<script src="/client/auth/assets/vendor/flot-tooltip/jquery.flot.tooltip.js"></script>
<script src="/client/auth/assets/vendor/flot/jquery.flot.pie.js"></script>
<script src="/client/auth/assets/vendor/flot/jquery.flot.categories.js"></script>
<script src="/client/auth/assets/vendor/flot/jquery.flot.resize.js"></script>
<script src="/client/auth/assets/vendor/jquery-sparkline/jquery.sparkline.js"></script>
<script src="/client/auth/assets/vendor/raphael/raphael.js"></script>
<script src="/client/auth/assets/vendor/morris/morris.js"></script>
<script src="/client/auth/assets/vendor/gauge/gauge.js"></script>
<script src="/client/auth/assets/vendor/snap-svg/snap.svg.js"></script>
<script src="/client/auth/assets/vendor/liquid-meter/liquid.meter.js"></script>
<script src="/client/auth/assets/vendor/jqvmap/jquery.vmap.js"></script>
<script src="/client/auth/assets/vendor/jqvmap/data/jquery.vmap.sampledata.js"></script>
<script src="/client/auth/assets/vendor/jqvmap/maps/jquery.vmap.world.js"></script>
<script src="/client/auth/assets/vendor/jqvmap/maps/continents/jquery.vmap.africa.js"></script>
<script src="/client/auth/assets/vendor/jqvmap/maps/continents/jquery.vmap.asia.js"></script>
<script src="/client/auth/assets/vendor/jqvmap/maps/continents/jquery.vmap.australia.js"></script>
<script src="/client/auth/assets/vendor/jqvmap/maps/continents/jquery.vmap.europe.js"></script>
<script src="/client/auth/assets/vendor/jqvmap/maps/continents/jquery.vmap.north-america.js"></script>
<script src="/client/auth/assets/vendor/jqvmap/maps/continents/jquery.vmap.south-america.js"></script>

<!-- Theme Base, Components and Settings -->
<script src="/client/auth/assets/javascripts/theme.js"></script>

<!-- Theme Custom -->
<script src="/client/auth/assets/javascripts/theme.custom.js"></script>

<!-- Theme Initialization Files -->
<script src="/client/auth/assets/javascripts/theme.init.js"></script>


<!-- Examples -->
<script src="/client/auth/assets/javascripts/dashboard/examples.dashboard.js"></script>
</body>
</html>
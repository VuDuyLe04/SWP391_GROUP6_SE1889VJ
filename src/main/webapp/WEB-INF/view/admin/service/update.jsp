<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="fixed">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>Cập nhật dịch vụ</title>
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

    <script src="https://cdn.tiny.cloud/1/lvgs67xu2g25m7j6ktwusssxob0p0q7tyxczpuz4oc9m764u/tinymce/5/tinymce.min.js"></script>

    <script>
        tinymce.init({
            selector: '#address', // ID của textarea
            plugins: 'advlist autolink lists link image charmap print preview anchor',
            toolbar: 'undo redo | formatselect | bold italic | alignleft aligncenter alignright | bullist numlist | link image'
        });
    </script>

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
                <h2>Cập nhật dịch vụ</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Cập nhật dịch vụ</span></li>
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

                            <h2 class="panel-title">Cập nhật dịch vụ</h2>
                        </header>
                        <div class="panel-body " >
                            <form:form modelAttribute="service" class="form-horizontal form-bordered" method="post" action="/service/update">

                                <c:set var="errorName">
                                    <form:errors path="name"
                                                 cssClass="invalid-feedback" cssStyle="color: red"/>
                                </c:set>

                                <c:set var="errorDurationMonths">
                                    <form:errors path="durationMonths"
                                                 cssClass="invalid-feedback" cssStyle="color: red"/>
                                </c:set>

                                <c:set var="errorDescription">
                                    <form:errors path="description"
                                                 cssClass="invalid-feedback" cssStyle="color: red"/>
                                </c:set>

                                <c:set var="errorPrice">
                                    <form:errors path="price"
                                                 cssClass="invalid-feedback" cssStyle="color: red"/>
                                </c:set>
                                <form:hidden path="id"/>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" >Tên</label>
                                    <div class="col-md-6">
                                        <form:input path="name" class="form-control ${not empty errorName ? 'is-invalid' : ''}" />
                                            ${errorName}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputHelpText">Thời gian gói dịch vụ</label>
                                    <div class="col-md-1">
                                        <form:input path="durationMonths" type="number"  class="form-control ${not empty errorDurationMonths ? 'is-invalid' : ''}" id="inputHelpText" />
                                            ${errorDurationMonths}
                                    </div>
                                    <label class="col-md-2 control-label" for="inputReadOnly">Giá dịch vụ</label>
                                    <div class="col-md-3">
                                        <form:input path="price" type="number" class="form-control ${not empty errorPrice ? 'is-invalid' : ''}" id="inputReadOnly" />
                                            ${errorPrice}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" >Mô tả chi tiết</label>
                                    <div class="col-md-6">
                                        <form:textarea path="description" class="form-control ${not empty errorDescription ? 'is-invalid' : ''}" id="address" />
                                            ${errorDescription}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" >Trạng thái</label>
                                    <div class="col-md-2">
                                        <form:select path="active" class="form-control">
                                            <form:option value="true"  >Active</form:option>
                                            <form:option value="false">Banned</form:option>
                                        </form:select>
                                    </div>
                                </div>



                                <input type="hidden" value="${oldName}" name="oldName"/>


                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">

                                        <button type="submit" class="btn btn-primary ${not empty errorName ? 'is-invalid' : ''}">Cập nhật</button>
                                        <div style="color: green">
                                                ${message}
                                        </div>


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
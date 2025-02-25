<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="fixed">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>Danh sách người dùng</title>
    <meta name="keywords" content="HTML5 Admin Template"/>
    <meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
    <meta name="author" content="JSOFT.net">

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

    <!-- Specific Page Vendor CSS -->
    <link rel="stylesheet" href="/client/auth/assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css"/>
    <link rel="stylesheet" href="/client/auth/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css"/>
    <link rel="stylesheet" href="/client/auth/assets/vendor/morris/morris.css"/>

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
                <h2>Danh sách khách hàng</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Danh sách khách hàng</span></li>
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
                                <a href="/customer/create" class="btn btn-success" style="display: inline-flex;
        justify-content: center;
        align-items: center;
        width: 120px;
        height: 40px;
        font-size: 14px;
        font-weight: bold;
        color: #ffffff;
        background: linear-gradient(90deg, #0093DD, #007ACC);
        border: none;
        border-radius: 5px;
        text-decoration: none;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;">Tạo khách hàng mới</a>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-3">
                                    <form method="GET" action="/customer/search" class="form-inline"
                                          style="margin-bottom: 20px;">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="name"
                                                   placeholder="Tìm kiếm bằng tên" value="${param.name}"/>
                                            <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit">Tìm</button>
                    </span>
                                        </div>

                                    </form>
                                </div>
                                <div class="col-md-3">
                                    <!-- Form tìm kiếm theo số điện thoại -->
                                    <form method="GET" action="/customer/search" class="form-inline">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="phone"
                                                   placeholder="Tìm kiếm bằng số điện thoại" value="${param.phone}"/>
                                            <span class="input-group-btn">
                    <button class="btn btn-primary" type="submit">Tìm</button>
                </span>
                                        </div>

                                    </form>
                                </div>
                            </div>

                        </header>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-condensed mb-none">
                                    <thead>
                                    <tr>
                                        <th>Số thứ tự</th>
                                        <th>Tên</th>
                                        <th class="text-right">Số điện thoại</th>

                                        <th class="text-center">Tiền nợ</th>
                                        <th class="text-right">Cửa hàng</th>
                                        <th class="text-right">Hoạt động</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listCustomer}" var="customer" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${customer.name}</td>
                                            <td class="text-right">${customer.phone}</td>

                                            <td class="text-center">${customer.balance}</td>
                                            <td class="text-right">${customer.store.name}</td>
                                            <td class="text-right">
                                                <a href="/customer/detail/${customer.id}" class="btn btn-primary">Xem
                                                    chi tiết</a>
                                                <a href="/customer/update/${customer.id}" class="btn btn-primary">Cập
                                                    nhật</a>
                                                <a href="#" class="btn btn-primary">Nợ</a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>

                                </table>
                                <div class="pagination-container text-center mt-3">
                                    <ul class="pagination justify-content-center">
                                        <!-- Xây dựng query giữ lại thông tin tìm kiếm -->
                                        <c:set var="searchQuery" value="" />
                                        <c:if test="${not empty param.name}">
                                            <c:set var="searchQuery" value="${searchQuery}&name=${param.name}" />
                                        </c:if>
                                        <c:if test="${not empty param.phone}">
                                            <c:set var="searchQuery" value="${searchQuery}&phone=${param.phone}" />
                                        </c:if>

                                        <!-- Nút "Previous" -->
                                        <c:if test="${currentPage > 0}">
                                            <li class="page-item">
                                                <a class="page-link" href="/customer/search?page=${currentPage - 1}${searchQuery}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo; Trước</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <!-- Hiển thị danh sách trang -->
                                        <c:if test="${totalPages > 0}">
                                            <c:forEach begin="0" end="${totalPages - 1}" var="i">
                                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                    <a class="page-link" href="/customer/search?page=${i}${searchQuery}">${i + 1}</a>
                                                </li>
                                            </c:forEach>
                                        </c:if>

                                        <!-- Nút "Next" -->
                                        <c:if test="${currentPage < totalPages - 1}">
                                            <li class="page-item">
                                                <a class="page-link" href="/customer/search?page=${currentPage + 1}${searchQuery}" aria-label="Next">
                                                    <span aria-hidden="true">Sau &raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>

                            </div>
                        </div>


                    </section>


                </div>
            </div>
            <!-- end: page -->
        </section>
    </div>


</section>

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
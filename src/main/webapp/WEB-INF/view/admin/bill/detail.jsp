<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
                                                                   uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
                                                                                                                         uri="http://www.springframework.org/tags/form" %> <%@ taglib prefix="fmt"
                                                                                                                                                                                      uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib
        uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%--<%@ taglib
prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<!DOCTYPE html>
<html class="fixed" style="overflow: hidden">
<head>
    <!-- Basic -->
    <meta charset="UTF-8" />

    <title>Chi tiết hóa đơn</title>
    <meta name="keywords" content="HTML5 Admin Template" />
    <meta
            name="description"
            content="JSOFT Admin - Responsive HTML5 Template"
    />
    <meta name="author" content="JSOFT.net" />

    <!-- Mobile Metas -->
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
    />

    <!-- Web Fonts  -->
    <link
            href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light"
            rel="stylesheet"
            type="text/css"
    />

    <!-- Vendor CSS -->
    <link
            rel="stylesheet"
            href="/client/auth/assets/vendor/bootstrap/css/bootstrap.css"
    />
    <link
            rel="stylesheet"
            href="/client/auth/assets/vendor/font-awesome/css/font-awesome.css"
    />
    <link
            rel="stylesheet"
            href="/client/auth/assets/vendor/magnific-popup/magnific-popup.css"
    />
    <link
            rel="stylesheet"
            href="/client/auth/assets/vendor/bootstrap-datepicker/css/datepicker3.css"
    />

    <!-- Specific Page Vendor CSS -->
    <link
            rel="stylesheet"
            href="/client/auth/assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css"
    />
    <link
            rel="stylesheet"
            href="/client/auth/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css"
    />
    <link
            rel="stylesheet"
            href="/client/auth/assets/vendor/morris/morris.css"
    />

    <!-- Theme CSS -->
    <link rel="stylesheet" href="/client/auth/assets/stylesheets/theme.css" />

    <!-- Skin CSS -->
    <link
            rel="stylesheet"
            href="/client/auth/assets/stylesheets/skins/default.css"
    />

    <!-- Theme Custom CSS -->
    <link
            rel="stylesheet"
            href="/client/auth/assets/stylesheets/theme-custom.css"
    />

    <!-- Head Libs -->
    <script src="/client/auth/assets/vendor/modernizr/modernizr.js"></script>
    <style>
        /* Modern Dashboard Styles */
        body {
            background: #f4f7fa;
            font-family: "Open Sans", sans-serif;
        }

        /* Panel Styling */
        .panel-featured-primary {
            border: none;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.08);
            border-radius: 12px;
            margin-bottom: 30px;
        }

        /* Header Styling */
        .panel-heading {
            background: linear-gradient(135deg, #0088cc, #1e4f78) !important;
            padding: 20px !important;
            border-radius: 12px 12px 0 0 !important;
        }

        .panel-title {
            color: #fff;
            font-size: 18px;
            font-weight: 600;
        }

        /* Search Box Styling */
        .input-search {
            position: relative;
            max-width: 400px;
            margin-left: auto;
        }

        .input-search input {
            height: 45px;
            border: 2px solid #e0e6ed;
            border-radius: 8px;
            padding: 0 45px 0 20px;
            font-size: 14px;
            width: 100%;
            transition: all 0.3s;
        }

        .input-search .btn {
            position: absolute;
            right: 0;
            top: 0;
            height: 45px;
            width: 45px;
            border-radius: 0 8px 8px 0;
            background: #0088cc;
        }

        /* Filter Form Styling */
        .filter-section {
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            color: #344767;
            font-weight: 600;
            font-size: 14px;
            margin-bottom: 8px;
            display: block;
        }

        .form-control {
            height: 45px;
            border: 2px solid #e0e6ed;
            border-radius: 8px;
            padding: 8px 15px;
            font-size: 14px;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: #0088cc;
            box-shadow: 0 0 0 3px rgba(0, 136, 204, 0.15);
        }

        /* Table Styling */
        .table-container {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-top: 25px;
        }

        .table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        .table th {
            background: #f8fafc;
            color: #344767;
            font-weight: bold;
            padding: 15px;
            font-size: 13px;
            text-transform: uppercase;
            border-bottom: 2px solid #0088cc;
        }

        .table td {
            padding: 15px;
            vertical-align: middle;
            border-bottom: 1px solid #e0e6ed;
            color: #506690;
            font-size: 14px;
        }

        .table tr:hover {
            background-color: #f8fafc;
        }

        /* Status Badge Styling - Điều chỉnh kích thước cố định */
        .status-badge {
            padding: 4px 8px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
            text-align: center;
            display: inline-block;
            min-width: 100px; /* Thêm chiều rộng cố định tối thiểu */
            width: 100px; /* Thêm chiều rộng cố định */
        }

        .status-completed {
            background: #dcf5e7;
            color: #0d6832;
        }

        .status-pending {
            background: #fff4de;
            color: #946300;
        }

        .status-failure {
            background: #ffe4e4;
            color: #d12946;
        }

        /* Amount Styling */
        .amount {
            font-weight: 600;
            color: #2ecc71;
        }

        /* Transaction ID Styling */
        .transaction-id {
            font-weight: 600;
            color: #0088cc;
        }

        /* Pagination Styling */
        .pagination {
            margin: 25px 0 10px;
            display: flex;
            justify-content: center;
            gap: 5px;
        }

        .page-link {
            padding: 8px 16px;
            border-radius: 8px;
            border: 1px solid #e0e6ed;
            color: #506690;
            font-weight: 500;
            transition: all 0.3s;
        }

        .page-item.active .page-link {
            background: #0088cc;
            border-color: #0088cc;
            color: #fff;
        }

        .page-link:hover:not(.active) {
            background: #f8fafc;
            border-color: #0088cc;
            color: #0088cc;
        }

        /* Button Styling */
        .btn-primary {
            background: #0088cc;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s;
        }

        .btn-primary:hover {
            background: #006699;
            transform: translateY(-1px);
            box-shadow: 0 4px 10px rgba(0, 136, 204, 0.2);
        }

        /* User Info Styling */
        .user-info {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .user-name {
            font-weight: 600;
            color: #344767;
        }

        .user-phone {
            color: #666;
            font-size: 12px;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .panel-body {
                padding: 15px;
            }

            .filter-section {
                padding: 15px;
            }

            .table-container {
                padding: 10px;
                overflow-x: auto;
            }

            .input-search {
                margin: 15px 0;
                width: 100%;
            }
        }

        /* Content Body - Bỏ scroll */
        .content-body {
            padding: 25px;
            background: #f4f7fa;
            overflow: visible;
            height: 100%;
            min-height: 100vh;
        }

        /* Card Layout */
        .dashboard-card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.08);
            margin-bottom: 25px;
        }

        /* Header Section */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding: 0;
        }

        .page-header h2 {
            /*color: #344767;*/
            font-size: 2rem;
            margin: 0;
        }

        .breadcrumbs {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 0;
            padding: 0;
            list-style: none;
        }

        /* Search and Filter Layout */
        .controls-section {
            display: grid;
            grid-template-columns: 3fr 1fr;
            gap: 25px;
            margin-bottom: 20px;
        }

        /* Search Box */
        .search-box {
            background: #fff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.08);
        }

        .search-form {
            position: relative;
        }

        .search-input {
            width: 100%;
            height: 40px;
            padding: 0 50px 0 15px;
            border: 1px solid #e0e6ed;
            border-radius: 8px;
            font-size: 13px;
            transition: all 0.3s;
        }

        .search-input:focus {
            border-color: #0088cc;
            box-shadow: 0 0 0 3px rgba(0, 136, 204, 0.15);
        }

        .search-button {
            position: absolute;
            right: 3px;
            top: 3px;
            height: 34px;
            width: 34px;
            border-radius: 8px;
            background: #0088cc;
            color: #fff;
            border: none;
            transition: all 0.3s;
        }

        /* Filter Form */
        .filter-form {
            background: #fff;
            padding: 15px;
            border-radius: 15px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.08);
        }

        .filter-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .form-group {
            margin-bottom: 0;
        }

        .form-group label {
            color: #344767;
            font-weight: 600;
            font-size: 13px;
            margin-bottom: 5px;
            display: block;
        }

        .form-control {
            height: 36px;
            border: 2px solid #e0e6ed;
            border-radius: 8px;
            padding: 6px 12px;
            font-size: 13px;
            transition: all 0.3s;
        }

        /* Table Section - Điều chỉnh margin */
        .table-section {
            background: #fff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.08);
            margin-bottom: 25px; /* Giảm margin bottom */
            position: relative; /* Thêm position relative */
        }

        .table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        .table th {
            background: #f8fafc;
            color: #344767;
            font-weight: 600;
            padding: 12px;
            font-size: 12px;
            text-transform: uppercase;
            border-bottom: 2px solid #0088cc;
        }

        .table td {
            padding: 12px;
            vertical-align: middle;
            border-bottom: 1px solid #e0e6ed;
        }

        /* Status Badges */
        .status-badge {
            padding: 4px 8px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
            text-align: center;
            display: inline-block;
        }

        .status-completed {
            background: #dcf5e7;
            color: #0d6832;
        }

        .status-pending {
            background: #fff4de;
            color: #946300;
        }

        .status-failure {
            background: #ffe4e4;
            color: #d12946;
        }

        /* Pagination Section - Điều chỉnh vị trí */
        .pagination-section {
            position: relative; /* Thay đổi từ absolute sang relative */
            background: #fff;
            padding: 15px 0;
            margin-top: -30px;
            z-index: 1;
            border-radius: 0 0 15px 15px;
        }

        .pagination {
            margin: 0;
        }

        .page-link {
            padding: 5px 10px;
            font-size: 12px;
            height: 30px;
            min-width: 30px;
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .controls-section {
                grid-template-columns: 1fr;
            }

            .filter-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .filter-grid {
                grid-template-columns: 1fr;
            }

            .table-section {
                padding: 15px;
            }

            .table {
                display: block;
                overflow-x: auto;
            }
        }

        /* Table Responsive */
        .table-responsive {
            overflow-x: auto;
            margin-bottom: 15px; /* Thêm margin bottom */
        }

        /* Fixed Body và HTML */
        html.fixed {
            overflow: auto !important;
        }

        body {
            overflow: auto !important;
        }
    </style>
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
                <h2><i class="fa fa-users mr-xs"></i> Chi tiết hóa đơn</h2>
                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Chi tiết hóa đơn </span></li>
                    </ol>
                    <a class="sidebar-right-toggle" data-open="sidebar-right"
                    ><i class="fa fa-chevron-left"></i
                    ></a>
                </div>
            </header>
            <section class="panel">
                <div class="panel-body">

                    <div class="invoice">
                        <header class="clearfix">
                            <div class="row">
                                <div class="col-sm-12 mt-md">
                                    <div
                                            style="display: flex; align-items: center; gap: 15px"
                                    >
                                        <a
                                                href="/bill/table"
                                                class="btn btn-primary"
                                                style="padding: 6px 12px"
                                        >
                                            <i class="fa fa-arrow-left mr-xs"></i>
                                        </a>
                                        <div>
                                            <h4 class="text-dark text-bold mb-xs">HÓA ĐƠN </h4>
                                            <p class="m-none text-dark">
                                                #<c:out value="${billDetails[0].bill.id}" />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </header>

                        <div class="bill-info">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="bill-to">
<%--                                        <p class="h5 mb-xs text-dark text-semibold">--%>
<%--                                            Người tạo hóa đơn:--%>
<%--                                        </p>--%>
<%--                                        <p><c:out value="${billDetails[0].createdBy}" /></p>--%>
                                    </div>
                                </div>
                                <div class="col-md-6 text-right">
                                    <p class="mb-none">
                                        <span class="text-dark">Ngày lập hóa đơn:</span>
                                        <span class="value"
                                        ><c:out value="${billDetails[0].createdAt}"
                                        /></span>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table invoice-items">
                                <thead>
                                <tr
                                        class="h4 text-dark"
                                        style="color: #171717 !important; font-weight: 600"
                                >
                                    <th class="text-center" style="width: 50px">No</th>
                                    <th class="text-center"  style="font-weight: bold">Sản phẩm</th>
                                    <th class="text-center"  style="font-weight: bold">Số lượng</th>
                                    <th class="text-center"  style="font-weight: bold">Quy cách đóng gói</th>
                                    <c:if test="${bill.billType == 'EXPORT'}">
                                        <th class="text-center"  style="font-weight: bold">Giá niêm yết</th>
                                    </c:if>

                                    <c:if test="${bill.billType == 'IMPORT'}">
                                        <th class="text-center"  style="font-weight: bold">Giá nhập hàng</th>
                                    </c:if>
                                    <c:if test="${bill.billType == 'EXPORT'}">
                                        <th class="text-center"  style="font-weight: bold">Giá bán thực tế</th>
                                    </c:if>



                                    <th class="text-center"  style="font-weight: bold">Tổng tiền</th>

<%--                                    <th class="text-center"  style="font-weight: bold"  >Giá bốc vác</th>--%>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="totalPrice" value="0" />
                                <c:set var="shippingFee" value="0" />
                                <fmt:setLocale value="vi_VN" />
                                <c:forEach
                                        var="billDetail"
                                        items="${billDetails}"
                                        varStatus="loop"
                                >
                                    <c:set
                                            var="totalPrice"
                                            value="${totalPrice + billDetail.totalProductPrice}"
                                    />

                                        <c:set
                                                var="shippingFee"
                                                value="${shippingFee + billDetail.liftPrice}"
                                        />

                                    <tr>
                                        <td class="text-center">${loop.index + 1}</td>
                                        <td class="text-semibold text-center">
                                                ${billDetail.nameProduct}
                                        </td>
                                        <td class="text-center">${billDetail.quantity}</td>
                                        <td class="text-center">
                                            <c:if test="${not empty billDetail.packagingName}">
                                                ${billDetail.packagingName} (SL:
                                                ${billDetail.quantityPerPackage} kg)
                                            </c:if>
                                            <c:if test="${empty billDetail.packagingName}">
                                                kg
                                            </c:if>
                                        </td>
                                        <c:if test="${bill.billType == 'EXPORT'}">
                                            <td class="text-center">
                                                <fmt:formatNumber
                                                        value="${billDetail.listedPrice}"
                                                        type="number"
                                                        groupingUsed="true"
                                                />₫
                                            </td>
                                        </c:if>


                                        <td class="text-center">
                                            <fmt:formatNumber
                                                    value="${billDetail.actualSellPrice}"
                                                    type="number"
                                                    groupingUsed="true"
                                            />₫
                                        </td>

                                        <td class="text-center">
                                            <fmt:formatNumber
                                                    value="${billDetail.totalProductPrice}"
                                                    type="number"
                                                    groupingUsed="true"
                                            />₫
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="invoice-summary">
                            <div class="row">
                                <div class="col-sm-4 col-sm-offset-8">
                                    <table class="table h5 text-dark">
                                        <tbody>
                                        <tr class="b-top-none">
                                            <td colspan="2" style="font-weight: bold">Tạm tính</td>
                                            <td class="text-left">
                                                <fmt:formatNumber
                                                        value="${totalPrice}"
                                                        type="number"
                                                        groupingUsed="true"
                                                />₫
                                            </td>
                                        </tr>
                                        <tr class="h4">
                                            <td colspan="2"  style="font-weight: bold">Tổng cộng</td>
                                            <td class="text-left">
                                                <fmt:formatNumber
                                                        value="${totalPrice}"
                                                        type="number"
                                                        groupingUsed="true"
                                                />₫
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"  style="font-weight: bold">Phí bốc vác (Cửa hàng chịu)</td>
                                            <td class="text-left">
                                                <fmt:formatNumber
                                                        value="${bill.totalLiftPrice}"
                                                        type="number"
                                                        groupingUsed="true"
                                                />₫
                                            </td>
                                        </tr>


                                        <!-- Định dạng số tiền đã thanh toán -->
                                        <%--
                                        <tr>
                                          --%> <%--
                            <td colspan="2">Đã thanh toán</td>
                            --%> <%--
                            <td>
                              --%> <%--
                              <c:choose
                                >--%> <%--
                                <c:when test="${bill.paid % 1 == 0}"
                                  >--%> <%--
                                  <fmt:formatNumber
                                    value="${bill.paid}"
                                    type="number"
                                    groupingUsed="true"
                                  />₫--%> <%-- </c:when
                                >--%> <%--
                                <c:otherwise
                                  >--%> <%--
                                  <fmt:formatNumber
                                    value="${bill.paid}"
                                    type="number"
                                    groupingUsed="true"
                                    minFractionDigits="1"
                                  />₫--%> <%-- </c:otherwise
                                >--%> <%-- </c:choose
                              >--%> <%--
                            </td>
                            --%> <%--
                          </tr>
                          --%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </section>
    </div>
</section>

<!-- Đoạn mã JavaScript của bạn -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/client/auth/assets/vendor/jquery/jquery.js"></script>
<script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>

<script src="/client/auth/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>

<script src="/client/auth/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="/client/auth/assets/vendor/magnific-popup/magnific-popup.js"></script>
<script src="/client/auth/assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

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

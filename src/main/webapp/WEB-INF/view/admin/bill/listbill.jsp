



<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<!doctype html>
<html class="fixed" style="overflow: hidden">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>Danh sách hóa đơn</title>
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
    <style>
        /* Modern Dashboard Styles */
        body {
            background: #f4f7fa;
            font-family: 'Open Sans', sans-serif;
        }

        /* Panel Styling */
        .panel-featured-primary {
            border: none;
            box-shadow: 0 2px 15px rgba(0,0,0,0.08);
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
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
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
            box-shadow: 0 0 0 3px rgba(0,136,204,0.15);
        }

        /* Table Styling */
        .table-container {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
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
            font-weight: 600;
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
            box-shadow: 0 4px 10px rgba(0,136,204,0.2);
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
            box-shadow: 0 2px 15px rgba(0,0,0,0.08);
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
            box-shadow: 0 2px 15px rgba(0,0,0,0.08);
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
            box-shadow: 0 0 0 3px rgba(0,136,204,0.15);
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
            box-shadow: 0 2px 15px rgba(0,0,0,0.08);
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
            box-shadow: 0 2px 15px rgba(0,0,0,0.08);
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
                <h2><i class="fa fa-users mr-xs"></i> Danh sách hóa đơn  </h2>
                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Danh sách hóa đơn </span></li>
                    </ol>
                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <div class="controls-section">


                <div class="filter-form">
                    <form id="dateForm" action="/bill/table" method="get">
                        <div class="filter-grid">
                            <div class="form-group">
                                <label for="storeId">Cửa hàng </label>
                                <select id="storeId" name="storeId" class="form-control">
                                    <option ${storeId == "0" ? "selected" : ""} value="0">Tất cả</option>
                                    <c:forEach items="${stores}" var="s">
                                        <option ${storeId == s.id ? "selected" : ""} value="${s.id}">${s.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="startDate">Từ ngày</label>
                                <input type="date" id="startDate" name="startDate"
                                       class="form-control" value="${startDate}">
                            </div>
                            <div class="form-group">
                                <label for="endDate">Đến ngày</label>
                                <input type="date" id="endDate" name="endDate"
                                       class="form-control" value="${endDate}">
                            </div>


                            <div class="form-group">
                                <label for="minAmount">Tổng tiền tối thiểu</label>
                                <input type="number" id="minAmount" name="minAmount"
                                       class="form-control" value="${minAmount}">
                            </div>
                            <div class="form-group">
                                <label for="maxAmount">Tổng tiền tối đa</label>
                                <input type="number" id="maxAmount" name="maxAmount"
                                       class="form-control" value="${maxAmount}">
                            </div>
                            <div class="form-group">
                                <label for="type">Loại hóa đơn  </label>
                                <select id="type" name="type" class="form-control">
                                    <option ${type == "ALL" ? "selected" : ""} value="ALL">Tất cả</option>
                                    <option ${type == "EXPORT" ? "selected" : ""} value="EXPORT">Xuất hàng</option>
                                    <option ${type == "IMPORT" ? "selected" : ""} value="IMPORT">Nhập hàng</option>
                                </select>
                            </div>

                            <div class="form-group" style="display: flex; align-items: flex-end;">
                                <button type="submit" class="btn btn-primary w-100">
                                    <i class="fa fa-filter mr-xs"></i> Lọc
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="search-box">
                    <form id="search-form" action="/bill/table" method="get" class="search-form">
                        <input type="text" class="search-input" name="input"
                               placeholder="Tìm theo số điện thoại khách hàng"
                               value="${input}">
                        <button type="submit" class="search-button">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                </div>
            </div>

            <div class="table-section">
                <c:if test="${emptyList != null}">
                    <div class="alert alert-info">
                        <i class="fa fa-info-circle mr-xs"></i> ${emptyList}
                    </div>
                </c:if>

                <c:if test="${emptyList == null}">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th>Mã hóa đơn</th>
                                <th>Cửa hàng</th>
                                <th>Thông tin người dùng</th>
                                <th>Loại hóa đơn</th>
                                <th>Tổng tiền</th>
                                <th>Tiền đã trả</th>
                                <th>Tiền nợ</th>
                                <th>Bốc vác</th>
                                <th>Ngày tạo</th>





                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="bill" items="${bills.content}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>  <!-- STT --><!-- Bill ID -->
                                    <td class="text-center">${bill.id}</td>
                                    <td >${bill.store.name}</td>  <!-- Store Name -->
                                    <td>
                                        <c:choose>
                                            <c:when test="${bill.customer != null}">
                                                ${bill.customer.name} (${bill.customer.phone})
                                            </c:when>
                                            <c:otherwise>
                                                <span style="color: red;">Không có khách hàng</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td >
                                            ${bill.billType}
                                    </td>
                                    <td >   <fmt:setLocale value="vi_VN"/>
                                        <c:choose>
                                            <c:when test="${bill.totalBillPrice % 1 == 0}">
                                                <fmt:formatNumber value="${bill.totalBillPrice}" type="number" groupingUsed="true"/>₫
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber value="${bill.totalBillPrice}" type="number" groupingUsed="true" minFractionDigits="1"/>₫
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td >   <fmt:setLocale value="vi_VN"/>
                                        <c:choose>
                                            <c:when test="${bill.paid % 1 == 0}">
                                                <fmt:formatNumber value="${bill.paid}" type="number" groupingUsed="true"/>₫
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber value="${bill.paid}" type="number" groupingUsed="true" minFractionDigits="1"/>₫
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td >   <fmt:setLocale value="vi_VN"/>
                                        <c:choose>
                                            <c:when test="${bill.inDebt% 1 == 0}">
                                                <fmt:formatNumber value="${bill.inDebt}" type="number" groupingUsed="true"/>₫
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber value="${bill.inDebt}" type="number" groupingUsed="true" minFractionDigits="1"/>₫
                                            </c:otherwise>
                                        </c:choose>
                                    </td>


                                    <td >   <fmt:setLocale value="vi_VN"/>
                                        <c:choose>
                                            <c:when test="${bill.totalLiftPrice % 1 == 0}">
                                                <fmt:formatNumber value="${bill.totalLiftPrice}" type="number" groupingUsed="true"/>₫
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber value="${bill.totalLiftPrice}" type="number" groupingUsed="true" minFractionDigits="1"/>₫
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td >${bill.formattedDate}</td>

                                    <td class="text-center">
                                        <a href="/bills/details/${bill.id}" class="btn btn-default btn-sm" title="View">
                                            <i class="fa fa-eye"></i>
                                        </a>
                                    </td>


                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <div class="pagination-section">
                        <c:set var="c" value="${bills.number}"></c:set>
                        <ul class="pagination">
                            <li class="page-item ${c==0 ?'disabled':''}">
                                <a class="page-link" href="table?page=${c==0 ? 0 : (c - 1)}&input=${input}&startDate=${startDate}&endDate=${endDate}&minAmount=${minAmount}&maxAmount=${maxAmount}&type=${type}">Trước</a>
                            </li>

                            <c:forEach begin="0" end="${bills.totalPages - 1}" var="i">
                                <c:if test="${i >= c - 1 && i <= c + 1}">
                                    <li class="page-item ${c == i ? 'active' : ''}">
                                        <a class="page-link" href="table?page=${i}&input=${input != null ? input : ''}&startDate=${startDate}&endDate=${endDate}&minAmount=${minAmount}&maxAmount=${maxAmount}&type=${type}">${i + 1}</a>
                                    </li>
                                </c:if>
                                <c:if test="${i == c - 2 || i == c + 2}">
                                    <li><span>...</span></li>
                                </c:if>
                            </c:forEach>

                            <li class="page-item ${c == bills.totalPages - 1 ? 'disabled' : ''}">
                                <a class="page-link" href="table?page=${c == bills.totalPages - 1 ? bills.totalPages - 1 : (c + 1)}&input=${input}&startDate=${startDate}&endDate=${endDate}&minAmount=${minAmount}&maxAmount=${maxAmount}&type=${type}">Sau</a>
                            </li>
                        </ul>
                    </div>
                </c:if>
            </div>
        </section>
    </div>
</section>
<div class="modal fade" id="billModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Chi tiết hóa đơn</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <h6>General Bill Information</h6>
                <p><strong>Bill ID:</strong> <span id="billId"></span></p>
                <p><strong>Created At:</strong> <span id="createdAt"></span></p>
                <p><strong>Created By:</strong> <span id="createdBy"></span></p>

                <h6>Product Details</h6>
                <table class="table">
                    <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Actual Price</th>
                        <th>Listed Price</th>
                        <th>Total</th>
                        <th>Packaging</th>
                        <th>Qty/Package</th>
<%--                        <th>Lift</th>--%>
                        <th>Lift Price</th>
                        <th>Total Lift</th>
                    </tr>
                    </thead>
                    <tbody id="billDetails"></tbody>
                </table>
            </div>
        </div>
    </div>
</div>



<!-- Đoạn mã JavaScript của bạn -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/client/auth/assets/vendor/jquery/jquery.js"></script>
<script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>

<script>

    document.getElementById("search-input").addEventListener("keypress", function (event) {
        if (event.key === "Enter") {
            event.preventDefault();
            document.getElementById("search-form").submit();
        }
    });

    $(document).ready(function () {
        $(".view-button").click(function () {
            var billId = $(this).data("id");

            $.ajax({
                url: "/bill/details/" + billId ,
                type: "GET",
                success: function (response) {
                    if (!response || !response.billDetails || response.billDetails.length === 0) {
                        alert("Không có chi tiết hóa đơn!");
                        return;
                    }

                    $("#billId").text(response.id);
                    $("#createdAt").text(response.formattedDate || "N/A");
                    $("#createdBy").text(response.createdBy || "N/A");
                    $("#billDetails").empty();

                    response.billDetails.forEach(function (detail) {
                        $("#billDetails").append(`
                        <%--<tr>--%>
                        <%--    <td>${detail.nameProduct || "N/A"}</td>--%>
                        <%--    <td>${detail.quantity || 0}</td>--%>
                        <%--    <td>${detail.actualSellPrice || 0}</td>--%>
                        <%--    <td>${detail.listedPrice || 0}</td>--%>
                        <%--    <td>${detail.totalProductPrice || 0}</td>--%>
                        <%--    <td>${detail.packagingName || "N/A"}</td>--%>
                        <%--    <td>${detail.quantityPerPackage || "N/A"}</td>--%>
                        <%--    <td>${detail.isLift ? "Yes" : "No"}</td>--%>
                        <%--    <td>${detail.liftPrice != null ? detail.liftPrice : 0}</td>--%>
                        <%--    <td>${detail.totalLiftProductPrice != null ? detail.totalLiftProductPrice : 0}</td>--%>
                        <%--</tr>--%>
                    `);
                    });

                    $("#billModal").modal("show");
                },
                error: function (xhr) {
                    if (xhr.status === 404) {
                        alert("Hóa đơn không tồn tại!");
                    } else {
                        alert("Lỗi hệ thống, vui lòng thử lại sau!");
                    }
                }
            });
        });
    });



document.addEventListener("DOMContentLoaded", function () {
        function formatToDDMMYYYY(dateStr) {
            if (!dateStr) return "";
            let parts = dateStr.split("-");
            return `${parts[2]}/${parts[1]}/${parts[0]}`;
        }

        function formatToYYYYMMDD(dateStr) {
            if (!dateStr) return "";
            let parts = dateStr.split("/");
            return `${parts[2]}-${parts[1]}-${parts[0]}`;
        }

        let startDateInput = document.getElementById("startDate");
        let endDateInput = document.getElementById("endDate");

        // Lấy giá trị từ server (giả sử giá trị là YYYY-MM-DD)
        let startDateValue = "${startDate}";
        let endDateValue = "${endDate}";

        // Hiển thị dưới dạng DD/MM/YYYY
        startDateInput.value = formatToDDMMYYYY(startDateValue);
        endDateInput.value = formatToDDMMYYYY(endDateValue);

        document.getElementById("dateForm").addEventListener("submit", function () {
            startDateInput.value = formatToYYYYMMDD(startDateInput.value);
            endDateInput.value = formatToYYYYMMDD(endDateInput.value);
        });
    });
</script>




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
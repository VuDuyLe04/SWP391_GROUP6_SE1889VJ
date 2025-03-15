<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="fixed" style="overflow: hidden">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>Lịch sử nạp tiền </title>
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
        .panel-featured-primary {
            border-color: #0088cc;
        }
        .panel-featured-primary .panel-heading {
            background-color: #0088cc;
            color: #FFF;
            border-radius: 5px 5px 0 0;
        }
        .input-group-addon {
            background-color: #0088cc;
            color: #FFF;
            border-color: #0088cc;
        }
        .table > thead > tr > th {
            background-color: #f5f5f5;
            border-bottom: 2px solid #0088cc;
        }
        .btn-primary {
            background-color: #0088cc;
            border-color: #0088cc;
        }
        .btn-primary:hover {
            background-color: #006699;
            border-color: #006699;
        }
        .label-sm {
            font-size: 90%;
            padding: 3px 8px;
        }
        .mr-xs {
            margin-right: 5px;
        }
        .mb-xs {
            margin-bottom: 5px;
        }
        .mt-xs {
            margin-top: 5px;
        }
        .status-label {
            display: inline-block;
            min-width: 85px;
            text-align: center;
            padding: 5px 10px;
        }
        .pagination {
            margin: 20px auto;
            display: inline-flex;
            justify-content: center;
            padding-left: 0;
        }
        /* Existing modal styles */
        html, body {
            overflow-y: scroll !important;
            margin-right: 0 !important;
            padding-right: 0 !important;
            width: 100% !important;
        }

        /* Update modal styles */
        .modal {
            text-align: center;
            padding: 0 !important;
        }

        .modal:before {
            content: '';
            display: inline-block;
            height: 15vh; /* Giảm khoảng cách từ top để modal nằm gần nút Filter */
            vertical-align: middle;
            margin-right: -4px;
        }

        .modal-dialog {
            display: inline-block;
            text-align: left;
            vertical-align: middle;
            max-width: 800px !important;
            width: 95% !important;
            margin: 0 auto !important;
            transform: translate(0, -25%) !important;
        }

        .modal-content {
            border: none;
            border-radius: 4px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            height: auto !important;
            max-height: 500px !important;
        }

        .modal-body {
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .user-info {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 15px;
        }

        .info-group {
            width: calc(50% - 10px);
            margin-bottom: 12px;
            padding: 10px;
            background: #f8f9fa;
            border-radius: 3px;
            display: flex;
            align-items: center;
        }

        .info-group label {
            width: 120px;
            font-size: 14px;
            margin-bottom: 0;
            white-space: nowrap;
        }

        .info-value {
            font-size: 14px;
            flex: 1;
        }

        .modal-header {
            background: #0088cc;
            color: white;
            border-radius: 4px 4px 0 0;
            padding: 10px 15px;
            height: 50px;
        }

        .modal-header .close {
            display: none !important;
        }

        .modal-title {
            font-size: 14px;
            margin: 0;
        }

        .modal-footer {
            padding: 10px 15px;
            border-top: 1px solid #dee2e6;
            background: #f8f9fa;
            border-radius: 0 0 4px 4px;
            height: 50px;
        }

        .modal-footer .btn {
            padding: 5px 15px;
            font-size: 14px;
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
                <h2><i class="fa fa-users mr-xs"></i> Lịch sử nạp tiền </h2>
                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Quản lí người dùng</span></li>
                    </ol>
                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <div class="row">
                <div class="col-md-12">
                    <section class="panel panel-featured panel-featured-primary">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="#" class="panel-action panel-action-toggle" data-panel-toggle></a>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <h2 class="panel-title"><i class="fa fa-list-alt mr-xs"></i>User List</h2>
                                </div>
                                <div class="col-sm-6">
                                    <div class="pull-right">
                                        <form id="search-form" action="transpayments" method="get" class="search nav-form">
                                            <div class="input-group input-search">
                                                <input type="text" class="form-control" name="input"
                                                       placeholder="Tìm kiếm theo mã giao dịch,số điện thoại người dùng " value="${input}" >
                                                <span class="input-group-btn">
                                                    <button class="btn btn-primary" type="submit">
                                                        <i class="fa fa-search"></i>
                                                    </button>
                                                </span>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </header>

                        <div class="panel-body">
                            <div class="row mb-md">
                                <div class="col-sm-6">
                                    <form action="/transpayments" method="get">
                                        <div class="form-group">
                                            <label for="startDate">Từ ngày:</label>
                                            <input type="date" id="startDate" name="startDate" class="form-control" 
                                                   value="${startDate}">
                                        </div>

                                        <div class="form-group">
                                            <label for="endDate">Đến ngày:</label>
                                            <input type="date" id="endDate" name="endDate" class="form-control"
                                                   value="${endDate}">
                                        </div>

                                        <div class="form-group">
                                            <label for="minAmount">Số tiền tối thiểu:</label>
                                            <input type="number" id="minAmount" name="minAmount" class="form-control" value="${minAmount}">
                                        </div>

                                        <div class="form-group">
                                            <label for="maxAmount">Số tiền tối đa:</label>
                                            <input type="number" id="maxAmount" name="maxAmount" class="form-control" value="${maxAmount}">
                                        </div>

                                        <div class="form-group">
                                            <label for="status">Trạng thái giao dịch:</label>
                                            <select id="status" name="status" class="form-control">
                                                <option ${status == "ALL" ? "selected" : ""} value="ALL">Tất cả</option>
                                                <option ${status == "COMLETED" ? "selected" : ""} value="COMPLETED">Hoàn thành</option>
                                                <option ${status == "PENDING" ? "selected" : ""} value="PENDING">Đang chờ</option>
                                                <option ${status == "FAILURE" ? "selected" : ""} value="FAILURE">Thất bại</option>
                                            </select>
                                        </div>

                                        <button type="submit" class="btn btn-primary">Lọc</button>
                                    </form>



                                </div>
                                <div class="col-sm-6">

                                </div>
                            </div>

                            <table>
                                <thead>
                                <tr>
                                    <th>Mã giao dịch</th>
                                    <th>Số tiền</th>
                                    <th>Nội dung</th>
                                    <th>Ngày giao dịch</th>
                                    <th>Tài khoản nhận</th>
                                    <th>Cổng thanh toán</th>
                                    <th>Trạng thái</th>
                                    <th>ID người dùng</th>
                                    <th>Tên người dùng</th>
                                    <th>Số điện thoại</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="transaction" items="${transactions.content}">
                                    <tr>

                                        <td>${transaction.transactionId}</td>
                                        <td>${transaction.amount}đ</td>
                                        <td>${transaction.content}</td>
                                        <td>${transaction.date}</td>
                                        <td>${transaction.accountReceiver}</td>
                                        <td>${transaction.gate}</td>
                                        <td>${transaction.transactionStatus}</td>
                                        <td>${transaction.user.id}</td>
                                        <td>${transaction.user.name}</td>
                                        <td>${transaction.user.phone}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>


                            <c:set var="c" value="${transactions.number}"></c:set>
                                <ul class="pagination" style="display: flex; justify-content: center; margin-leftgit:413px">
                                    <li class="page-item ${c==0 ?'disabled':''} ">
                                        <a class="page-link" href="transpayments?page=${c==0 ? 0 : (c - 1)}&input=${input}&active=${active}&role=${roleId}">Trước</a>
                                    </li>

                                    <c:forEach begin="0" end="${transactions.totalPages - 1}" var="i">
                                        <c:if test="${i >= c - 1 && i <= c + 1}">
                                            <li class="page-item ${c == i ? 'active' : ''}"><a class="page-link" href="transpayments?page=${i}&input=${input != null ? input : ''}&active=${active != null ? active : '-1'}&role=${roleId != null ? roleId : '-1'}">${i + 1}</a>


                                            </li>
                                        </c:if>
                                        <c:if test="${i == c- 2 || i == c+ 2}">
                                            <li><span>...</span></li>
                                        </c:if>
                                    </c:forEach>
                                    <li class="page-item ${c== transactions.totalPages -1?'disabled':''} ">
                                        <a class="page-link" href="transpayments?page=${c== transactions.totalPages -1? transactions.totalPages -1: (c + 1)}&input=${input}&active=${active}&role=${roleId}">Sau</a>
                                    </li>

                                </ul>

                            </div>
                    </section>
                </div>
            </div>
        </section>
    </div>
</section>



<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" style="margin-top:330px">
            <div class="modal-header">
                <h4 class="modal-title" id="userModalLabel">
                    <i class="fa fa-user-circle mr-xs"></i> Thông tin chi tiết
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="user-info">
                    <div class="info-group">
                        <label><i class="fa fa-user mr-xs"></i> Tên:</label>
                        <span id="modal-name" class="info-value"></span>
                    </div>
                    <div class="info-group">
                        <label><i class="fa fa-phone mr-xs"></i> Số điện thoại:</label>
                        <span id="modal-phone" class="info-value"></span>
                    </div>
                    <div class="info-group">
                        <label><i class="fa fa-users mr-xs"></i> Vai trò:</label>
                        <span id="modal-role" class="info-value"></span>
                    </div>
                    <div class="info-group">
                        <label><i class="fa fa-check-circle mr-xs"></i> Trạng thái:</label>
                        <span id="modal-status" class="info-value"></span>
                    </div>
                    <div class="info-group">
                        <label><i class="fa fa-calendar mr-xs"></i> Tạo ngày:</label>
                        <span id="modal-createdAt" class="info-value"></span>
                    </div>
                    <div class="info-group">
                        <label><i class="fa fa-user-plus mr-xs"></i> Tạo bởi:</label>
                        <span id="modal-createdBy" class="info-value"></span>
                    </div>
                    <div class="info-group">
                        <label><i class="fa fa-calendar-plus-o mr-xs"></i> Cập nhật ngày:</label>
                        <span id="modal-updatedAt" class="info-value"></span>
                    </div>
                    <div class="info-group">
                        <label><i class="fa fa-user-plus mr-xs"></i> Cập nhật bởi:</label>
                        <span id="modal-updatedBy" class="info-value"></span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">
                    <i class="fa fa-times mr-xs"></i>Đóng
                </button>
            </div>
        </div>
    </div>
</div>


<!-- Đoạn mã JavaScript của bạn -->

<script src="/client/auth/assets/vendor/jquery/jquery.js"></script>
<script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>

<script>

    document.getElementById("search-input").addEventListener("keypress",function(event){
        if(event.key === "Enter"){
            event.preventDefault();
            document.getElementById("search-form").submit();
        }
    });
    function changeStatus(status){
        if(status == null) alert("Không có giá trị");
        else window.location.href = "/transpayments?status="+status;
    }
</script>




<script src="/client/auth/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="/client/auth/assets/vendor/nanoscroller/nanoscroller.js"></script>
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
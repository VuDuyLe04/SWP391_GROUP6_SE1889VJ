<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="fixed" style="overflow: hidden">
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
            max-width: 650px;  /* Giảm chiều rộng tổng thể của modal */
            margin: 1.75rem auto;
        }

        .modal-content {
            border: none;
            border-radius: 15px;
            box-shadow: 0 0 30px rgba(0,0,0,0.1);
        }

        .modal-header {
            background: linear-gradient(135deg, #0088cc 0%, #004466 100%);
            color: white;
            border-radius: 15px 15px 0 0;
            padding: 1.5rem;
            border: none;
        }

        .modal-title {
            font-size: 2rem !important;
            font-weight: 600;
        }

        .modal-body {
            padding: 1.5rem;  /* Giảm padding của modal body */
            background: #f8f9fa;
        }

        .store-info {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .info-group {
            display: flex;
            align-items: center;
            background: white;
            padding: 1rem;  /* Giảm padding của các info group */
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .info-group label {
            min-width: 180px;
            font-size: 1.3rem;
            color: #444;
            font-weight: 500;
            padding-left: 20px;
        }

        .info-value {
            flex: 1;
            font-size: 1.3rem;
            font-weight: 600;
            color: #333;
            padding-left: 20px;
        }

        /* Stats section */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin-top: 1rem;
            padding: 0.5rem;
        }

        .stat-card {
            background: white;
            padding: 0.8rem;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        }

        .stat-card .stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: #333;
            margin: 0.3rem 0;
        }

        .stat-card .stat-label {
            font-size: 1rem;
            color: #666;
            font-weight: 500;
        }

        .modal-footer {
            background: #f8f9fa;
            border-top: 1px solid rgba(0,0,0,0.1);
            border-radius: 0 0 15px 15px;
            padding: 1rem 1.5rem;
        }

        .modal-footer .btn-primary {
            font-size: 1.2rem;
            padding: 0.8rem 2rem;
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
                <h2><i class="fa fa-users mr-xs"></i>
                    Quản lí cửa hàng
                </h2>
                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>  Quản lí cửa hàng </span></li>
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
                                        <form id="search-form" action="stores" method="get" class="search nav-form">
                                            <div class="input-group input-search">
                                                <input type="text" class="form-control" name="input"
                                                       placeholder="Tìm kiếm theo tên hoặc địa chỉ cửa hàng" value="${input}" >
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
                            <div class="row">
                                <div class="col-sm-12">
                                    <!-- Filter Section with Create Store Button -->
                                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
                                        <div style="display: flex; align-items: center; gap: 30px;">
                                            <div style="display: flex; align-items: center;">
                                                <label style="min-width: 70px; margin-bottom: 0; color: #444; font-weight: 500;">Trạng thái:</label>
                                                <select id="status" name="status" class="form-control" onchange="filterByStatus(this.value)" style="width: 150px;">
                                                    <option ${status == "ALL" ? "selected" : ""} value="ALL">Tất cả</option>
                                                    <option ${status == "ACTIVE" ? "selected" : ""} value="ACTIVE">Hoạt động</option>
                                                    <option ${status == "INACTIVE" ? "selected" : ""} value="INACTIVE">Không hoạt động</option>
                                                </select>
                                            </div>
                                            <div style="display: flex; align-items: center;">
                                                <label style="min-width: 70px; margin-bottom: 0; color: #444; font-weight: 500;">Sắp xếp:</label>
                                                <select id="sort" name="sort" class="form-control" onchange="sortByCreatedAt(this.value)" style="width: 150px;">
                                                    <option ${sort == "normal" ? "selected" : ""} value="normal">Mặc định</option>
                                                    <option ${sort == "desc" ? "selected" : ""} value="desc">Mới nhất</option>
                                                    <option ${sort == "asc" ? "selected" : ""} value="asc">Cũ nhất</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div>
                                            <a href="createstore" class="btn btn-primary" style="padding: 6px 15px;">
                                                <i class="fa fa-plus mr-xs"></i> Tạo cửa hàng
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="table-responsive">
                                <!-- Total Store Info Section -->
                                <div style="display: flex; justify-content: flex-end; gap: 15px; margin-bottom: 8px;">
                                    <div style="display: flex; align-items: center;">
                                        <i class="fa fa-building mr-xs" style="color: #0088cc; font-size: 11px;"></i>
                                        <span style="font-weight: 400; color: #666; font-size: 11px;">Tổng số: 
                                            <span style="color: #0088cc; font-weight: 500;">${storePage.totalElements}</span> cửa hàng
                                        </span>
                                    </div>
                                    <div style="display: flex; align-items: center;">
                                        <i class="fa fa-file mr-xs" style="color: #0088cc; font-size: 11px;"></i>
                                        <span style="font-weight: 400; color: #666; font-size: 11px;">Trang: 
                                            <span style="color: #0088cc; font-weight: 500;">${storePage.number + 1}/${storePage.totalPages}</span>
                                        </span>
                                    </div>
                                </div>

                                <c:if test="${emptyList != null}">
                                    <div class="alert alert-info">
                                        <i class="fa fa-info-circle mr-xs"></i> ${emptyList}
                                    </div>
                                </c:if>
                                <c:if test="${searchMessage != null}">
                                    <div class="alert alert-info">
                                        <i class="fa fa-info-circle mr-xs"></i> ${searchMessage}
                                    </div>
                                </c:if>
                                <c:if test="${errorMessage != null}">
                                    <div class="alert alert-danger">
                                        <i class="fa fa-exclamation-circle mr-xs"></i> ${errorMessage}
                                    </div>
                                </c:if>
                                <table class="table table-bordered table-striped table-hover mb-none">
                                    <thead>
                                    <tr>
                                        <th><i class="fa"></i>STT</th>
                                        <th><i class="fa fa-user mr-xs"></i>Tên cửa hàng</th>
                                        <th><i class="fa fa-phone mr-xs"></i>Địa chỉ </th>
                                        <th><i class="fa fa-check-circle mr-xs"></i>Trạng thái</th>
                                        <th><i class="fa fa-cogs mr-xs"></i>Hành động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${storePage.content != null }">

                                        <c:forEach var="s" items="${storePage.content}" varStatus="status">
                                            <tr>
                                                <td>${storePage.number * storePage.size + status.index + 1}</td>

                                                <td><strong>${s.name}</strong></td>
                                            <td>${s.address}</td>
                                                <td>
                                                <span class="label ${s.status == 'ACTIVE' ? 'label-success' : 'label-danger'} label-sm status-label">
                                                   <i class="fa ${s.status == 'INACTIVE' ? 'fa-check' : 'fa-ban'} mr-xs"></i>
                                                   ${s.status == "ACTIVE" ? "Active" : "Inactive"}
                                                   </span>
                                                </td>
                                            <td>
                                                <button class="btn btn-default btn-sm mr-xs view-button"
                                                        title="Xem"
                                                        data-name="${s.name}"
                                                        data-address="${s.address}"
                                                        data-status="${s.status == 'ACTIVE' ? 'Hoạt động' : 'Không hoạt động'}"
                                                        data-createdAt="${s.createdAtFormatted}"
                                                        data-createdBy="${s.createdBy}"
                                                        data-updatedAt="${s.updatedAtFormatted}"
                                                        data-updatedBy="${s.updatedBy}"
                                                        data-totalCustomers="${s.customers != null ? s.customers.size() : 0}"
                                                        data-totalWarehouses="${s.wareHouses != null ? s.wareHouses.size() : 0}"
                                                        data-totalProducts="${s.products != null ? s.products.size() : 0}"
                                                        data-totalUserStores="${s.userStores != null && s.userStores.size() > 0 ? s.userStores.size() - 1 : 0}">


                                                <i class="fa fa-eye"></i>
                                                </button>

                                                <a href="/updatestore/${s.id}" class="btn btn-primary btn-sm" title="Chỉnh sửa">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                                <c:if test="${storePage.content != null }">
                                <c:set var="c" value="${storePage.number}"></c:set>
                                <ul class="pagination" style="display: flex; justify-content: center; margin-leftgit:413px">
                                    <li class="page-item ${c==0 ?'disabled':''} ">
                                        <a class="page-link" href="stores?page=${c==0 ? 0 : (c - 1)}&input=${input}&sort=${sort}&status=${status}">Trước</a>
                                    </li>
                                    <c:forEach begin="0" end="${storePage.totalPages - 1}" var="i">
                                        <c:if test="${i >= c - 1 && i <= c + 1}">
                                            <li class="page-item ${c == i ? 'active' : ''}"><a class="page-link" href="stores?page=${i}&input=${input != null ? input : ''}&sort=${sort != null ? sort : 'normal'}&status=${status != null ? status : 'ALL'}">${i + 1}</a></li>
                                        </c:if>
                                        <c:if test="${i == c- 2 || i == c+ 2}">
                                            <li><span>...</span></li>
                                        </c:if>
                                    </c:forEach>
                                    <li class="page-item ${c== storePage.totalPages -1?'disabled':''} ">
                                        <a class="page-link" href="stores?page=${c== storePage.totalPages -1? storePage.totalPages -1: (c + 1)}&input=${input}&sort=${sort}&status=${status}">Sau</a>
                                    </li>
                                </ul>
                                </c:if>
                            </div>

                        </div>
                    </section>
                </div>
            </div>
        </section>
    </div>
</section>



<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="userModalLabel">
                    Chi tiết cửa hàng
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Thông tin cơ bản -->
                <div class="store-info">
                    <div class="info-group">
                        <label>Tên cửa hàng:</label>
                        <div class="info-value" id="modal-name"></div>
                    </div>
                    <div class="info-group">
                        <label>Địa chỉ:</label>
                        <div class="info-value" id="modal-address"></div>
                    </div>
                    <div class="info-group">
                        <label>Trạng thái:</label>
                        <div class="info-value" id="modal-status"></div>
                    </div>
                    <div class="info-group">
                        <label>Ngày tạo:</label>
                        <div class="info-value" id="modal-createdAt"></div>
                    </div>
                    <div class="info-group">
                        <label>Cập nhật cuối:</label>
                        <div class="info-value" id="modal-updatedAt"></div>
                    </div>
                </div>

                <!-- Thống kê -->
                <div class="stats-container">
                    <div class="stat-card">
                        <div class="stat-value" id="modal-totalCustomers"></div>
                        <div class="stat-label">Khách hàng</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-value" id="modal-totalWarehouses"></div>
                        <div class="stat-label">Kho hàng</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-value" id="modal-totalProducts"></div>
                        <div class="stat-label">Sản phẩm</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-value" id="modal-totalUserStores"></div>
                        <div class="stat-label">Nhân viên</div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">
                    Đóng
                </button>
            </div>
        </div>
    </div>
</div>



<script src="/client/auth/assets/vendor/jquery/jquery.js"></script>
<script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>

<script>
    $(document).ready(function() {
        $('.view-button').on('click', function() {
            const name = $(this).data("name");
            const address = $(this).data("address");
            const status = $(this).data("status");
            const createdAt = $(this).attr('data-createdAt');
            const updatedAt = $(this).attr('data-updatedAt')
            // Xử lý các giá trị số liệu
            const totalCustomers = $(this).attr("totalCustomers") || 0;
            const totalWarehouses = $(this).attr("totalWarehouses") || 0;
            const totalUserStores = $(this).attr("data-totalUserStores") || 0;
            const totalProducts = $(this).attr("data-totalProducts") || 0;
            console.log("totalUserStores:", $(this).data("totalUserStores"));
            // console.log("totalProducts:", $(this).data("totalProducts"));

            $("#modal-name").text(name);
            $("#modal-address").text(address);
            $("#modal-status").text(status);
            $("#modal-createdAt").text(createdAt || "Chưa có thông tin");
            $("#modal-updatedAt").text(updatedAt || "Chưa có thông tin");

            $("#modal-totalCustomers").text(totalCustomers);
            $("#modal-totalWarehouses").text(totalWarehouses);
            $("#modal-totalProducts").text(totalProducts);
            $("#modal-totalUserStores").text(totalUserStores);

            $('#userModal').modal('show');
        });
    });
    document.getElementById("search-input").addEventListener("keypress",function(event){
        if(event.key === "Enter"){
            event.preventDefault();
            document.getElementById("search-form").submit();
        }
    });
    function filterByStatus(value) {
        const url = new URL(window.location.href);//lay doi tuong url hien tai
        url.searchParams.delete('page');
        url.searchParams.set('status', value); // Luôn cập nhật giá trị status

        const input = url.searchParams.get('input'); // Lấy input từ URL (nếu có)
        if (input !== null && input.trim() !== '') {
            url.searchParams.set('input', input); // Giữ nguyên input nếu có
        } else {
            url.searchParams.delete('input'); // Nếu input rỗng/null thì xóa khỏi URL
        }

        window.location.href = url.toString(); // Điều hướng đến URL mới
    }

    function sortByCreatedAt(value) {
        const url = new URL(window.location.href);
        url.searchParams.set('sort', value); // Luôn cập nhật giá trị status
        url.searchParams.delete('page');
        const input = url.searchParams.get('input'); // Lấy input từ URL (nếu có)
        if (input !== null && input.trim() !== '') {
            url.searchParams.set('input', input); // Giữ nguyên input nếu có
        } else {
            url.searchParams.delete('input'); // Nếu input rỗng/null thì xóa khỏi URL
        }

        window.location.href = url.toString(); // Điều hướng đến URL mới
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
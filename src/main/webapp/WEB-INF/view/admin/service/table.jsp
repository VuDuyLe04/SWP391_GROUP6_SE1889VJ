<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="fixed">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>Danh sách dịch vụ</title>
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
    <style>
        .label-sm {
            font-size: 90%;
            padding: 3px 8px;
        }
    </style>


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
                <h2>Danh sách dịch vụ</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Danh sách dịch vụ</span></li>
                    </ol>

                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>


            <!-- start: page -->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading" style=" background-color: #0088cc;">

                            <div class="panel-actions">
                                <a href="#" class="panel-action panel-action-toggle" data-panel-toggle></a>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                </div>
                                <div class="col-sm-6">
                                    <div class="pull-right">
                                        <div class="input-group input-search">
                                            <input type="text" class="form-control" id="name"
                                                   placeholder="Tìm kiếm theo tên">
                                            <span class="input-group-btn">
                                                <button class="btn btn-primary" id="btnSearch">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </header>
                        <div class="panel-body">
                            <div class="row mb-md">
                                <div class="col-sm-6">
                                    <div class="form-inline">
                                        <div class="form-group mr-md">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user-circle"></i></span>
                                                <select id="durationMonths" class="form-control">
                                                    <option value="" id="tatca">Tất cả</option>
                                                    <option value="1" id="1-thang">1 tháng</option>
                                                    <option value="3" id="3-thang">3 tháng</option>
                                                    <option value="6" id="6-thang">6 tháng</option>
                                                    <option value="12" id="12-thang">12 tháng</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group mr-md">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-toggle-on"></i></span>
                                                <select id="status" class="form-control">
                                                    <option value="" id="status-1">Các trạng thái</option>
                                                    <option value="true" id="status-2">Hoạt động</option>
                                                    <option value="false" id="status-3">Bị cấm</option>
                                                </select>
                                            </div>
                                        </div>

                                        <button class="btn btn-primary" id="btnFilter"><i
                                                class="fa fa-filter mr-xs"></i>Lọc
                                        </button>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="pull-right">
                                        <a href="/service/create" class="btn btn-primary mb-xs mt-xs mr-xs">
                                            <i class="fa fa-plus mr-xs"></i>Thêm dịch vụ mới
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-condensed mb-none">
                                    <thead>

                                    <tr>
                                        <th>STT</th>
                                        <th class="text-center">Tên</th>
                                        <th class="text-center">Thời gian dịch vụ</th>
                                        <th class="text-center">Giá</th>
                                        <th class="text-center">Trạng thái</th>
                                        <th class="text-center"><i class="fa fa-cogs mr-xs"></i>Hành động</th>
                                    </tr>

                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listService}" var="service" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td class="text-center">${service.name}</td>
                                            <td class="text-center">${service.durationMonths} tháng</td>
                                            <td class="text-center">${service.price}</td>
<%--                                            <td class="text-center">${service.active}</td>--%>
                                            <td class="text-center">
                                                <span class="label ${service.active == 'true' ? 'label-success' : 'label-danger'} label-sm status-label">
                    <i class="fa ${service.active == 'true' ? 'fa-check' : 'fa-ban'} mr-xs"></i>
                    ${service.active == "true" ? "Active" : "Banned"}
                </span>
                                            </td>
                                            <td class="text-center">
                                                <a href="/service/update/${service.id}" class="btn btn-primary">Cập
                                                    nhật</a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>

                                </table>
                                <c:if test="${totalPages > 0}">
                                    <c:set var="c" value="${currentPage}"></c:set>
                                    <ul class="pagination" style="display: flex; justify-content: center;">
                                        <li class="page-item ${c == 0 ? 'disabled' : ''}">
                                            <a class="page-link" href="/service/table?page=${c == 0 ? 0 : (c - 1)}&durationMonths=${param.durationMonths}&status=${param.status}&name=${param.name}">Trước</a>
                                        </li>

                                        <c:forEach begin="0" end="${totalPages - 1}" var="i">
                                            <c:if test="${i >= c - 1 && i <= c + 1}">
                                                <li class="page-item ${c == i ? 'active' : ''}">
                                                    <a class="page-link" href="/service/table?page=${i}&durationMonths=${param.durationMonths != null ? param.durationMonths : ''}&status=${param.status != null ? param.status : 'ALL'}&name=${param.name != null ? param.name : ''}">${i + 1}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${i == c - 2 || i == c + 2}">
                                                <li><span>...</span></li>
                                            </c:if>
                                        </c:forEach>

                                        <li class="page-item ${c == totalPages - 1 ? 'disabled' : ''}">
                                            <a class="page-link" href="/service/table?page=${c == totalPages - 1 ? totalPages - 1 : (c + 1)}&durationMonths=${param.durationMonths}&status=${param.status}&name=${param.name}">Sau</a>
                                        </li>
                                    </ul>
                                </c:if>
                            </div>
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

<script>
    // Your JavaScript code here
    document.getElementById('btnFilter').addEventListener('click', function (event) {
        event.preventDefault();

        let durationMonths = document.getElementById('durationMonths').value;
        let status = document.getElementById('status').value;
        const currentUrl = new URL("http://localhost:8080/service/table");
        const searchParams = currentUrl.searchParams;

        searchParams.set('durationMonths', durationMonths);
        searchParams.set('status', status);

        window.location.href = currentUrl.toString();
    });

    // Auto select values after page load
    document.addEventListener("DOMContentLoaded", function () {
        // Tự động lấy giá trị filter và tìm kiếm từ URL để điền vào form khi tải trang
        const params = new URLSearchParams(window.location.search);
        if (params.has('durationMonths')) {
            document.getElementById('durationMonths').value = params.get('durationMonths');
        }
        if (params.has('status')) {
            document.getElementById('status').value = params.get('status');
        }
        if (params.has('name')) {
            document.getElementById('name').value = params.get('name');
        }

        // Hàm chung để xử lý cả nút lọc và nút tìm kiếm
        const applyFilters = () => {
            const durationMonths = document.getElementById('durationMonths').value;
            const status = document.getElementById('status').value;
            const name = document.getElementById('name').value.trim();

            const url = new URL(window.location.origin + '/service/table');

            if(durationMonths) url.searchParams.set('durationMonths', durationMonths);
            if(status) url.searchParams.set('status', status);
            if(name) url.searchParams.set('name', name);

            window.location.href = url;
        };

        document.getElementById('btnSearch').addEventListener('click', applyFilters);
        document.getElementById('btnSearch').addEventListener('click', applyFilters);
        document.getElementById('btnSearch').addEventListener('click', applyFilters);
    });



    // Gán sự kiện khi nhấn nút tìm kiếm
    document.getElementById('btnSearch').addEventListener('click', function(event) {
        event.preventDefault();  // Ngăn không cho form được gửi đi mặc định

        // Lấy giá trị từ ô input tìm kiếm
        let name = document.getElementById('name').value;

        // Lấy URL hiện tại
        const currentUrl = new URL("http://localhost:8080/service/table");
        const searchParams = currentUrl.searchParams;

        // Cập nhật tham số 'name' trong URL
        searchParams.set('name', name);

        // Cập nhật lại URL và reload trang
        window.location.href = currentUrl.toString();
    });

    // Xử lý khi trang load lại để tự động điền lại giá trị tìm kiếm từ URL


</script>
</body>
</html>
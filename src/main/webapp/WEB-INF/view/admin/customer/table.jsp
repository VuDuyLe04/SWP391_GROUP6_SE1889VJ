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
                                <a href="#" class="panel-action panel-action-toggle" data-panel-toggle></a>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                </div>
                                <div class="col-sm-6">
                                    <div class="pull-right">
                                        <div class="input-group input-search">
                                            <input type="text" class="form-control" id="nameOrPhone"
                                                   placeholder="Tìm kiếm theo tên hoặc số điện thoại">
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
                                </div>

                                <div class="col-sm-6">
                                    <div class="pull-right">
                                        <a href="/customer/create" class="btn btn-primary mb-xs mt-xs mr-xs">
                                            <i class="fa fa-plus mr-xs"></i>Thêm khách hàng mới
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-condensed mb-none">
                                    <thead>
                                    <tr>
                                        <th class="text-center">STT</th>
                                        <th class="text-center">Tên</th>
                                        <th class="text-center">Số điện thoại</th>
                                        <th class="text-center">Tiền nợ</th>
                                        <th class="text-center">Hoạt động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listCustomer}" var="customer" varStatus="status">
                                        <tr>
                                            <td class="text-center">${status.index + 1}</td>
                                            <td class="text-center">${customer.name}</td>
                                            <td class="text-center">${customer.phone}</td>
                                            <td class="text-center">${customer.balance}</td>
                                            <td class="text-center">
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


                                        <!-- Nút "Previous" -->
                                        <c:if test="${currentPage > 0}">
                                            <li class="page-item">
                                                <a class="page-link"
                                                   href="/customer/table?page=${currentPage - 1}"
                                                   aria-label="Previous">
                                                    <span aria-hidden="true">&laquo; Trước</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <!-- Hiển thị danh sách trang -->
                                        <c:if test="${totalPages > 0}">
                                            <c:forEach begin="0" end="${totalPages - 1}" var="i">
                                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                    <a class="page-link"
                                                       href="/customer/table?page=${i}">${i + 1}</a>
                                                </li>
                                            </c:forEach>
                                        </c:if>

                                        <!-- Nút "Next" -->
                                        <c:if test="${currentPage < totalPages - 1}">
                                            <li class="page-item">
                                                <a class="page-link"
                                                   href="/customer/table?page=${currentPage + 1}"
                                                   aria-label="Next">
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
<script>
    // Tự động điền lại giá trị tìm kiếm vào ô 'nameOrPhone' khi trang được tải lại
    document.addEventListener("DOMContentLoaded", function () {
        const params = new URLSearchParams(window.location.search);

        // Kiểm tra xem URL có chứa tham số 'nameOrPhone' không và tự động điền vào ô tìm kiếm
        if (params.has('nameOrPhone')) {
            document.getElementById('nameOrPhone').value = params.get('nameOrPhone');
        }

        // Hàm xử lý tìm kiếm
        const applySearch = () => {
            const nameOrPhone = document.getElementById('nameOrPhone').value.trim();

            // Cập nhật URL với tham số tìm kiếm 'nameOrPhone'
            const url = new URL(window.location.origin + '/customer/table');  // Thay đổi đường dẫn nếu cần
            if (nameOrPhone) url.searchParams.set('nameOrPhone', nameOrPhone);

            // Điều hướng tới URL mới với tham số tìm kiếm
            window.location.href = url;
        };

        // Thêm sự kiện click cho nút tìm kiếm
        document.getElementById('btnSearch').addEventListener('click', function (event) {
            event.preventDefault();  // Ngăn không cho form gửi đi mặc định
            applySearch();
        });

        // Cũng có thể xử lý khi nhấn phím Enter để tìm kiếm
        document.getElementById('nameOrPhone').addEventListener('keypress', function (event) {
            if (event.key === 'Enter') {
                applySearch();
            }
        });
    });
</script>


</body>
</html>
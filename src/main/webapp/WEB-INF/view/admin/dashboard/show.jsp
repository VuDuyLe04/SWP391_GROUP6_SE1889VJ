<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="fixed">
<head>


    <!-- Basic -->
    <meta charset="UTF-8">

    <title>Dashboard</title>
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

    <script src="/client/auth/assets/vendor/jquery/jquery.js"></script>
    <script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>

    <script>
        $(document).ready(function () {
            // Kiểm tra điều kiện trong session
            <c:if test="${empty sessionScope.store && sessionScope.user.role.name == 'STAFF'}">
            // Hiển thị modal không thể đóng ra ngoài hoặc bằng ESC
            $('#popupModal').modal({
                backdrop: 'static', // không cho phép đóng bằng cách click ra ngoài
                keyboard: false // không cho phép đóng bằng phím ESC
            });
            </c:if>
        });
    </script>
    <style>
        /* Căn chỉnh nút quay về góc phải */
        .close-homepage {
            position: absolute;
            top: 10px;
            right: 10px;
            padding: 5px 10px;
            font-size: 14px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 3px;
            text-decoration: none;
        }

            .close-homepage:hover {
            background-color: #0056b3;
        }
    </style>
    <style>
        /* Tạo danh sách gọn gàng và dễ nhìn hơn */
        #popupModal ul {
            list-style: none; /* Bỏ dấu chấm */
            padding: 0;
            margin: 0;
            text-align: center; /* Căn giữa nội dung */
        }

        /* Tạo khoảng cách và viền cho mỗi mục */
        #popupModal li {
            background: #f8f9fa; /* Màu nền nhẹ */
            border-radius: 8px; /* Bo góc */
            margin: 10px auto; /* Căn giữa và tạo khoảng cách */
            padding: 14px;
            width: 80%; /* Giới hạn chiều rộng */
            font-size: 18px; /* Chữ lớn hơn */
            transition: 0.3s; /* Hiệu ứng hover */
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.15);
        }

        /* Hiệu ứng khi hover vào */
        #popupModal li:hover {
            background: #e2e6ea; /* Màu sáng hơn khi di chuột */
            transform: scale(1.03);
        }

        /* Tạo khoảng cách giữa link và nội dung */
        #popupModal li a {
            text-decoration: none; /* Bỏ gạch chân */
            color: #007bff; /* Màu xanh */
            font-weight: bold;
            display: block; /* Cả vùng có thể nhấp */
            font-size: 20px; /* Chữ to hơn */
        }

        /* Hiệu ứng khi hover vào link */
        #popupModal li a:hover {
            color: #0056b3; /* Màu xanh đậm hơn */
        }

        /* Căn chỉnh thông báo khi không có cửa hàng */
        #popupModal p {
            text-align: center;
            font-weight: bold;
            font-size: 18px; /* Chữ lớn hơn */
        }
    </style>
    <style>
        /* Container cho tổng doanh thu */
        .revenue-container {
            display: flex;
            justify-content: space-around;
            margin: 30px 0;
        }

        /* Box cho từng doanh thu */
        .revenue-box {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 45%; /* Điều chỉnh kích thước cho phù hợp */
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        /* Thêm hiệu ứng hover cho box */
        .revenue-box:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        /* Cải thiện font cho số tiền */
        .revenue-amount {
            font-size: 2rem;
            color: #007bff;
            font-weight: bold;
            margin-top: 10px;
        }

        /* Định dạng tiêu đề cho doanh thu */
        .revenue-box p {
            font-size: 1.2rem;
            color: #333;
            font-weight: 600;
            margin: 0;
        }

        /* Style cho "Dịch vụ" và "Thanh toán" */
        .revenue-container .revenue-box:nth-child(1) {
            background-color: #e3f2fd; /* Màu nền nhẹ cho doanh thu dịch vụ */
        }

        .revenue-container .revenue-box:nth-child(2) {
            background-color: #fff3e0; /* Màu nền nhẹ cho doanh thu thanh toán */
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
                <h2>Dashboard</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Dashboard</span></li>
                    </ol>

                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <div class="row">

                <section class="panel">
                    <header class="panel-heading">
                        <div class="panel-actions">
                            <a href="#" class="fa fa-caret-down"></a>
                            <a href="#" class="fa fa-times"></a>
                        </div>

                        <h2 class="panel-title">Best Seller</h2>

                    </header>
                    <div class="panel-body">
                        <!-- Chọn năm -->
                        <label for="yearSelect">Chọn năm:</label>
                        <select id="yearSelect">
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                            <option value="2022">2022</option>
                            <option value="2023">2023</option>
                            <option value="2024">2024</option>
                            <option value="2025" selected>2025</option>
                        </select>

                        <div id="totalRevenueContainer" class="revenue-container">
                            <!-- Doanh thu dịch vụ -->
                            <div class="revenue-box" id="revenue-box-service">
                                <h3><i class="fa fa-cogs"></i> Tổng Doanh Thu (Dịch Vụ)</h3>
                                <p><strong></strong><span id="totalRevenue" class="revenue-amount">0</span></p>
                            </div>

                            <!-- Doanh thu thanh toán -->
                            <div class="revenue-box" id="revenue-box-payment">
                                <h3><i class="fa fa-credit-card"></i> Tổng Doanh Thu (Nạp tiền)</h3>
                                <p><strong></strong><span id="totalRevenuePayment" class="revenue-amount">0</span></p>
                            </div>
                        </div>


                        <!-- Biểu đồ doanh thu -->
                        <div class="chart-container" id="revenue-service-chart">
                            <h3><i class="fa fa-cogs"></i> Biểu đồ Doanh Thu Dịch Vụ</h3>  <!-- Tiêu đề cho biểu đồ doanh thu dịch vụ -->
                            <div class="chart chart-md" id="flotDashBasic"></div> <!-- Biểu đồ doanh thu dịch vụ -->
                        </div>

                        <!-- Biểu đồ Doanh thu thanh toán -->
                        <div class="chart-container" id="revenue-payment-chart">
                            <h3><i class="fa fa-credit-card"></i> Biểu đồ Doanh Thu Nạp Tiền</h3>  <!-- Tiêu đề cho biểu đồ doanh thu thanh toán -->
                            <div class="chart chart-md" id="flotRevenuePaymentTransaction"></div> <!-- Biểu đồ doanh thu thanh toán -->
                        </div>

                        <script>
                            $(document).ready(function() {
                                function formatCurrency(amount, currency) {
                                    return new Intl.NumberFormat('vi-VN', {
                                        style: 'currency',
                                        currency: currency,  // Chọn đơn vị tiền tệ, ví dụ 'VND', 'USD'
                                        minimumFractionDigits: 0  // Không hiển thị phần thập phân
                                    }).format(amount);  // Ví dụ: 1,000,000 VND
                                }



                                // Hàm để gửi yêu cầu đến API và vẽ biểu đồ doanh thu
                                function loadRevenueData(year) {
                                    fetch('http://localhost:8080/api/v1/revenue', {
                                        method: 'POST',
                                        headers: {
                                            'Content-Type': 'application/json',
                                        },
                                        body: JSON.stringify({
                                            year: year,
                                            periodType: 'YEAR'  // Lọc theo năm
                                        })
                                    })
                                        .then(response => response.json())  // Parse JSON
                                        .then(data => {
                                            // Hiển thị tổng doanh thu từ API
                                            $('#totalRevenue').text(formatCurrency(data.totalRevenue, 'VND')); // Hiển thị tổng doanh thu dịch vụ

                                            // Tạo dữ liệu cho Flot.js từ dữ liệu API
                                            let flotData = [
                                                {
                                                    data: data.revenueDetails.map(detail => [detail.month - 1, detail.revenue]), // Sửa tháng cho phù hợp với chỉ số mảng (0-based)
                                                    label: "Doanh thu",
                                                    color: "#0088cc"
                                                }
                                            ];

                                            // Khởi tạo biểu đồ Flot.js với dữ liệu từ API
                                            $.plot("#flotDashBasic", flotData, {
                                                series: {
                                                    lines: {show: true},
                                                    points: {show: true}
                                                },
                                                grid: {
                                                    hoverable: true,
                                                    clickable: true
                                                },
                                                xaxis: {
                                                    ticks: [
                                                        [0, "January"], [1, "February"], [2, "March"], [3, "April"],
                                                        [4, "May"], [5, "June"], [6, "July"], [7, "August"],
                                                        [8, "September"], [9, "October"], [10, "November"], [11, "December"]
                                                    ]
                                                }
                                            });
                                        })
                                        .catch(error => {
                                            console.error("Lỗi khi lấy dữ liệu từ API:", error);
                                        });
                                }

                                // Hàm để gửi yêu cầu đến API và vẽ biểu đồ doanh thu thanh toán
                                function loadRevenuePaymentData(year) {
                                    fetch('http://localhost:8080/api/v1/revenue-payment-service', {
                                        method: 'POST',
                                        headers: {
                                            'Content-Type': 'application/json',
                                        },
                                        body: JSON.stringify({
                                            year: year,
                                            periodType: 'YEAR'  // Lọc theo năm
                                        })
                                    })
                                        .then(response => response.json())  // Parse JSON
                                        .then(data => {
                                            // Hiển thị tổng doanh thu thanh toán từ API
                                            $('#totalRevenuePayment').text(formatCurrency(data.totalRevenue, 'VND')); // Hiển thị tổng doanh thu thanh toán

                                            // Tạo dữ liệu cho Flot.js từ dữ liệu API
                                            let flotPaymentData = [
                                                {
                                                    data: data.revenueDetails.map(detail => [detail.month - 1, detail.revenue]), // Sửa tháng cho phù hợp với chỉ số mảng (0-based)
                                                    label: "Doanh thu thanh toán",
                                                    color: "#ff5733",  // Màu sắc khác để phân biệt
                                                    bars: {show: true, barWidth: 0.6, align: 'center'}  // Cấu hình cho biểu đồ cột
                                                }
                                            ];

                                            // Khởi tạo biểu đồ Flot.js với dữ liệu từ API
                                            $.plot("#flotRevenuePaymentTransaction", flotPaymentData, {
                                                series: {
                                                    bars: {show: true, barWidth: 0.6, align: 'center'} // Đảm bảo dùng biểu đồ cột
                                                },
                                                grid: {
                                                    hoverable: true,
                                                    clickable: true
                                                },
                                                xaxis: {
                                                    ticks: [
                                                        [0, "January"], [1, "February"], [2, "March"], [3, "April"],
                                                        [4, "May"], [5, "June"], [6, "July"], [7, "August"],
                                                        [8, "September"], [9, "October"], [10, "November"], [11, "December"]
                                                    ]
                                                }
                                            });
                                        })
                                        .catch(error => {
                                            console.error("Lỗi khi lấy dữ liệu từ API:", error);
                                        });
                                }

                                // Load dữ liệu cho năm 2025 khi trang được tải
                                loadRevenueData(2025);
                                loadRevenuePaymentData(2025);

                                // Khi thay đổi năm trong dropdown, tải lại dữ liệu cho cả hai biểu đồ
                                $('#yearSelect').change(function () {
                                    var selectedYear = $(this).val();
                                    loadRevenueData(selectedYear);  // Gửi yêu cầu với năm đã chọn cho doanh thu
                                    loadRevenuePaymentData(selectedYear);  // Gửi yêu cầu cho doanh thu thanh toán
                                });
                            });
                        </script>
                    </div>

                </section>


            </div>

            <!-- start: page -->
            <div class="row">

                <div class="col-md-6 col-lg-12 col-xl-6">
                    <div class="row">
                        <div class="col-md-12 col-lg-6 col-xl-6">
                            <section class="panel panel-featured-left panel-featured-tertiary">
                                <div class="panel-body">
                                    <div class="widget-summary">
                                        <div class="widget-summary-col widget-summary-col-icon">
                                            <div class="summary-icon bg-tertiary">
                                                <i class="fa fa-users"></i> <!-- Đổi biểu tượng thành biểu tượng người dùng -->
                                            </div>
                                        </div>
                                        <div class="widget-summary-col">
                                            <div class="summary">
                                                <h4 class="title">Tài khoản người dùng</h4> <!-- Đổi tiêu đề thành "Staff + Owner" -->
                                                <div class="info">
                                                    <strong class="amount">
                                                        <!-- Hiển thị tổng số lượng Staff và Owner -->
                                                        ${countStaff + countOwner}
                                                    </strong>
                                                </div>
                                            </div>
<%--                                            <div class="summary-footer">--%>
<%--                                                <a href="/users" class="text-muted text-uppercase">View all</a>--%>
<%--                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>

                        <!-- Số lượng Owner -->
                        <div class="col-md-12 col-lg-6 col-xl-6">
                            <section class="panel panel-featured-left panel-featured-secondary">
                                <div class="panel-body">
                                    <div class="widget-summary">
                                        <div class="widget-summary-col widget-summary-col-icon">
                                            <div class="summary-icon bg-secondary">
                                                <i class="fa fa-user-tie"></i>
                                            </div>
                                        </div>
                                        <div class="widget-summary-col">
                                            <div class="summary">
                                                <h4 class="title">Tài khoản chủ cửa hàng</h4>
                                                <div class="info">
                                                    <strong class="amount" id="countOwner">${countOwner}</strong>
                                                </div>
                                            </div>

                                            <%--                                            <div class="summary-footer">--%>
                                            <%--                                                <a href="/users?role=owner" class="text-muted text-uppercase">View all</a> <!-- Liên kết tới danh sách Owners -->--%>
                                            <%--                                            </div>--%>

                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>

                        <!-- Số lượng Staff -->
                        <div class="col-md-12 col-lg-6 col-xl-6">
                            <section class="panel panel-featured-left panel-featured-primary">
                                <div class="panel-body">
                                    <div class="widget-summary">
                                        <div class="widget-summary-col widget-summary-col-icon">
                                            <div class="summary-icon bg-primary">
                                                <i class="fa fa-users"></i>
                                            </div>
                                        </div>
                                        <div class="widget-summary-col">
                                            <div class="summary">
                                                <h4 class="title">Tài khoản nhân viên</h4>
                                                <div class="info">
                                                    <strong class="amount" id="countStaff">${countStaff}</strong>
                                                </div>
                                            </div>

<%--                                            <div class="summary-footer">--%>
<%--                                                <a href="/users?role=staff" class="text-muted text-uppercase">View all</a> <!-- Liên kết tới danh sách Staff -->--%>
<%--                                            </div>--%>

                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>



                    </div>
                </div>
            </div>




            <!-- end: page -->
        </section>
    </div>



</section>
<!-- Popup Modal không thể tắt bất kỳ cách nào -->
<div id="popupModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <a href="/" class="btn close-homepage">Trang chủ</a>
                <h4 class="modal-title">Bạn phải chọn cửa hàng để quản lý </h4>

            </div>
            <ul>

                <c:set var="hasStore" value="false"/>
                <c:forEach items="${sessionScope.user.userStores}" var="userStore" varStatus="status">
                    <c:if test="${userStore.accessStoreStatus == 'ACCESSED'}">
                        <c:set var="hasStore" value="true"/>
                        <li>
                            <!-- Sử dụng id động với chỉ số index -->
                            <form id="storeForm-${status.index}" method="post" action="/storesession">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <input type="hidden" value="${userStore.store.id}" name="storeId">
                                <a href="#" onclick="document.getElementById('storeForm-${status.index}').submit(); return false;">
                                        ${userStore.store.name}
                                </a>
                            </form>
                        </li>
                    </c:if>
                </c:forEach>
                <c:if test="${!hasStore}">
                    <p style="color: red">Không có cửa hàng để quản lý</p>
                </c:if>

            </ul>
            <!-- Không có footer hoặc nút đóng nào -->
        </div>
    </div>
</div>

<!-- Vendor -->
<%--<script src="/client/auth/assets/vendor/jquery/jquery.js"></script>--%>
<script src="/client/auth/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<%--<script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>--%>
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
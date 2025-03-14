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
                <div class="col-md-6">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="#" class="fa fa-caret-down"></a>
                                <a href="#" class="fa fa-times"></a>
                            </div>

                            <h2 class="panel-title">Best Seller</h2>
                            <p class="panel-subtitle">Customize the graphs as much as you want, there are so many options and features to display information using JSOFT Admin Template.</p>
                        </header>
                        <div class="panel-body">

                            <!-- Flot: Basic -->
                            <div class="chart chart-md" id="flotDashBasic"></div>
                            <script>

                                var flotDashBasicData = [{
                                    data: [
                                        [0, 170],
                                        [1, 169],
                                        [2, 173],
                                        [3, 188],
                                        [4, 147],
                                        [5, 113],
                                        [6, 128],
                                        [7, 169],
                                        [8, 173],
                                        [9, 128],
                                        [10, 128]
                                    ],
                                    label: "Series 1",
                                    color: "#0088cc"
                                }, {
                                    data: [
                                        [0, 115],
                                        [1, 124],
                                        [2, 114],
                                        [3, 121],
                                        [4, 115],
                                        [5, 83],
                                        [6, 102],
                                        [7, 148],
                                        [8, 147],
                                        [9, 103],
                                        [10, 113]
                                    ],
                                    label: "Series 2",
                                    color: "#2baab1"
                                }, {
                                    data: [
                                        [0, 70],
                                        [1, 69],
                                        [2, 73],
                                        [3, 88],
                                        [4, 47],
                                        [5, 13],
                                        [6, 28],
                                        [7, 69],
                                        [8, 73],
                                        [9, 28],
                                        [10, 28]
                                    ],
                                    label: "Series 3",
                                    color: "#734ba9"
                                }];

                                // See: assets/javascripts/dashboard/examples.dashboard.js for more settings.

                            </script>

                        </div>
                    </section>
                </div>
                <div class="col-md-6">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="#" class="fa fa-caret-down"></a>
                                <a href="#" class="fa fa-times"></a>
                            </div>
                            <h2 class="panel-title">Server Usage</h2>
                            <p class="panel-subtitle">It's easy to create custom graphs on JSOFT Admin Template, there are several graph types that you can use, such as lines, bars, pie charts, etc...</p>
                        </header>
                        <div class="panel-body">

                            <!-- Flot: Curves -->
                            <div class="chart chart-md" id="flotDashRealTime"></div>

                        </div>
                    </section>
                </div>
            </div>

            <!-- start: page -->
            <div class="row">
                <div class="col-md-6 col-lg-12 col-xl-6">
                    <section class="panel">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="chart-data-selector" id="salesSelectorWrapper">
                                        <h2>
                                            Sales:
                                            <strong>
                                                <select class="form-control" id="salesSelector">
                                                    <option value="JSOFT Admin" selected>JSOFT Admin</option>
                                                    <option value="JSOFT Drupal" >JSOFT Drupal</option>
                                                    <option value="JSOFT Wordpress" >JSOFT Wordpress</option>
                                                </select>
                                            </strong>
                                        </h2>

                                        <div id="salesSelectorItems" class="chart-data-selector-items mt-sm">
                                            <!-- Flot: Sales JSOFT Admin -->
                                            <div class="chart chart-sm" data-sales-rel="JSOFT Admin" id="flotDashSales1" class="chart-active"></div>
                                            <script>

                                                var flotDashSales1Data = [{
                                                    data: [
                                                        ["Jan", 140],
                                                        ["Feb", 240],
                                                        ["Mar", 190],
                                                        ["Apr", 140],
                                                        ["May", 180],
                                                        ["Jun", 320],
                                                        ["Jul", 270],
                                                        ["Aug", 180]
                                                    ],
                                                    color: "#0088cc"
                                                }];

                                                // See: assets/javascripts/dashboard/examples.dashboard.js for more settings.

                                            </script>

                                            <!-- Flot: Sales JSOFT Drupal -->
                                            <div class="chart chart-sm" data-sales-rel="JSOFT Drupal" id="flotDashSales2" class="chart-hidden"></div>
                                            <script>

                                                var flotDashSales2Data = [{
                                                    data: [
                                                        ["Jan", 240],
                                                        ["Feb", 240],
                                                        ["Mar", 290],
                                                        ["Apr", 540],
                                                        ["May", 480],
                                                        ["Jun", 220],
                                                        ["Jul", 170],
                                                        ["Aug", 190]
                                                    ],
                                                    color: "#2baab1"
                                                }];

                                                // See: assets/javascripts/dashboard/examples.dashboard.js for more settings.

                                            </script>

                                            <!-- Flot: Sales JSOFT Wordpress -->
                                            <div class="chart chart-sm" data-sales-rel="JSOFT Wordpress" id="flotDashSales3" class="chart-hidden"></div>
                                            <script>

                                                var flotDashSales3Data = [{
                                                    data: [
                                                        ["Jan", 840],
                                                        ["Feb", 740],
                                                        ["Mar", 690],
                                                        ["Apr", 940],
                                                        ["May", 1180],
                                                        ["Jun", 820],
                                                        ["Jul", 570],
                                                        ["Aug", 780]
                                                    ],
                                                    color: "#734ba9"
                                                }];

                                                // See: assets/javascripts/dashboard/examples.dashboard.js for more settings.

                                            </script>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-4 text-center">
                                    <h2 class="panel-title mt-md">Sales Goal</h2>
                                    <div class="liquid-meter-wrapper liquid-meter-sm mt-lg">
                                        <div class="liquid-meter">
                                            <meter min="0" max="100" value="35" id="meterSales"></meter>
                                        </div>
                                        <div class="liquid-meter-selector" id="meterSalesSel">
                                            <a href="#" data-val="35" class="active">Monthly Goal</a>
                                            <a href="#" data-val="28">Annual Goal</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-md-6 col-lg-12 col-xl-6">
                    <div class="row">
                        <div class="col-md-12 col-lg-6 col-xl-6">
                            <section class="panel panel-featured-left panel-featured-primary">
                                <div class="panel-body">
                                    <div class="widget-summary">
                                        <div class="widget-summary-col widget-summary-col-icon">
                                            <div class="summary-icon bg-primary">
                                                <i class="fa fa-life-ring"></i>
                                            </div>
                                        </div>
                                        <div class="widget-summary-col">
                                            <div class="summary">
                                                <h4 class="title">Support Questions</h4>
                                                <div class="info">
                                                    <strong class="amount">1281</strong>
                                                    <span class="text-primary">(14 unread)</span>
                                                </div>
                                            </div>
                                            <div class="summary-footer">
                                                <a class="text-muted text-uppercase">(view all)</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div class="col-md-12 col-lg-6 col-xl-6">
                            <section class="panel panel-featured-left panel-featured-secondary">
                                <div class="panel-body">
                                    <div class="widget-summary">
                                        <div class="widget-summary-col widget-summary-col-icon">
                                            <div class="summary-icon bg-secondary">
                                                <i class="fa fa-usd"></i>
                                            </div>
                                        </div>
                                        <div class="widget-summary-col">
                                            <div class="summary">
                                                <h4 class="title">Total Profit</h4>
                                                <div class="info">
                                                    <strong class="amount">$ 14,890.30</strong>
                                                </div>
                                            </div>
                                            <div class="summary-footer">
                                                <a class="text-muted text-uppercase">(withdraw)</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div class="col-md-12 col-lg-6 col-xl-6">
                            <section class="panel panel-featured-left panel-featured-tertiary">
                                <div class="panel-body">
                                    <div class="widget-summary">
                                        <div class="widget-summary-col widget-summary-col-icon">
                                            <div class="summary-icon bg-tertiary">
                                                <i class="fa fa-shopping-cart"></i>
                                            </div>
                                        </div>
                                        <div class="widget-summary-col">
                                            <div class="summary">
                                                <h4 class="title">Today's Orders</h4>
                                                <div class="info">
                                                    <strong class="amount">38</strong>
                                                </div>
                                            </div>
                                            <div class="summary-footer">
                                                <a class="text-muted text-uppercase">(statement)</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div class="col-md-12 col-lg-6 col-xl-6">
                            <section class="panel panel-featured-left panel-featured-quartenary">
                                <div class="panel-body">
                                    <div class="widget-summary">
                                        <div class="widget-summary-col widget-summary-col-icon">
                                            <div class="summary-icon bg-quartenary">
                                                <i class="fa fa-user"></i>
                                            </div>
                                        </div>
                                        <div class="widget-summary-col">
                                            <div class="summary">
                                                <h4 class="title">Today's Visitors</h4>
                                                <div class="info">
                                                    <strong class="amount">3765</strong>
                                                </div>
                                            </div>
                                            <div class="summary-footer">
                                                <a class="text-muted text-uppercase">(report)</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>



            <div class="row">
                <div class="col-xl-3 col-lg-6">
                    <section class="panel panel-transparent">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="#" class="fa fa-caret-down"></a>
                                <a href="#" class="fa fa-times"></a>
                            </div>

                            <h2 class="panel-title">My Profile</h2>
                        </header>
                        <div class="panel-body">
                            <section class="panel panel-group">
                                <header class="panel-heading bg-primary">

                                    <div class="widget-profile-info">
                                        <div class="profile-picture">
                                            <img src="assets/images/!logged-user.jpg">
                                        </div>
                                        <div class="profile-info">
                                            <h4 class="name text-semibold">John Doe</h4>
                                            <h5 class="role">Administrator</h5>
                                            <div class="profile-footer">
                                                <a href="#">(edit profile)</a>
                                            </div>
                                        </div>
                                    </div>

                                </header>
                                <div id="accordion">
                                    <div class="panel panel-accordion panel-accordion-first">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse1One">
                                                    <i class="fa fa-check"></i> Tasks
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapse1One" class="accordion-body collapse in">
                                            <div class="panel-body">
                                                <ul class="widget-todo-list">
                                                    <li>
                                                        <div class="checkbox-custom checkbox-default">
                                                            <input type="checkbox" checked="" id="todoListItem1" class="todo-check">
                                                            <label class="todo-label" for="todoListItem1"><span>Lorem ipsum dolor sit amet</span></label>
                                                        </div>
                                                        <div class="todo-actions">
                                                            <a class="todo-remove" href="#">
                                                                <i class="fa fa-times"></i>
                                                            </a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="checkbox-custom checkbox-default">
                                                            <input type="checkbox" id="todoListItem2" class="todo-check">
                                                            <label class="todo-label" for="todoListItem2"><span>Lorem ipsum dolor sit amet</span></label>
                                                        </div>
                                                        <div class="todo-actions">
                                                            <a class="todo-remove" href="#">
                                                                <i class="fa fa-times"></i>
                                                            </a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="checkbox-custom checkbox-default">
                                                            <input type="checkbox" id="todoListItem3" class="todo-check">
                                                            <label class="todo-label" for="todoListItem3"><span>Lorem ipsum dolor sit amet</span></label>
                                                        </div>
                                                        <div class="todo-actions">
                                                            <a class="todo-remove" href="#">
                                                                <i class="fa fa-times"></i>
                                                            </a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="checkbox-custom checkbox-default">
                                                            <input type="checkbox" id="todoListItem4" class="todo-check">
                                                            <label class="todo-label" for="todoListItem4"><span>Lorem ipsum dolor sit amet</span></label>
                                                        </div>
                                                        <div class="todo-actions">
                                                            <a class="todo-remove" href="#">
                                                                <i class="fa fa-times"></i>
                                                            </a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="checkbox-custom checkbox-default">
                                                            <input type="checkbox" id="todoListItem5" class="todo-check">
                                                            <label class="todo-label" for="todoListItem5"><span>Lorem ipsum dolor sit amet</span></label>
                                                        </div>
                                                        <div class="todo-actions">
                                                            <a class="todo-remove" href="#">
                                                                <i class="fa fa-times"></i>
                                                            </a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="checkbox-custom checkbox-default">
                                                            <input type="checkbox" id="todoListItem6" class="todo-check">
                                                            <label class="todo-label" for="todoListItem6"><span>Lorem ipsum dolor sit amet</span></label>
                                                        </div>
                                                        <div class="todo-actions">
                                                            <a class="todo-remove" href="#">
                                                                <i class="fa fa-times"></i>
                                                            </a>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <hr class="solid mt-sm mb-lg">
                                                <form method="get" class="form-horizontal form-bordered">
                                                    <div class="form-group">
                                                        <div class="col-sm-12">
                                                            <div class="input-group mb-md">
                                                                <input type="text" class="form-control">
                                                                <div class="input-group-btn">
                                                                    <button type="button" class="btn btn-primary" tabindex="-1">Add</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-accordion">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse1Two">
                                                    <i class="fa fa-comment"></i> Messages
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapse1Two" class="accordion-body collapse">
                                            <div class="panel-body">
                                                <ul class="simple-user-list mb-xlg">
                                                    <li>
                                                        <figure class="image rounded">
                                                            <img src="assets/images/!sample-user.jpg" alt="Joseph Doe Junior" class="img-circle">
                                                        </figure>
                                                        <span class="title">Joseph Doe Junior</span>
                                                        <span class="message">Lorem ipsum dolor sit.</span>
                                                    </li>
                                                    <li>
                                                        <figure class="image rounded">
                                                            <img src="assets/images/!sample-user.jpg" alt="Joseph Junior" class="img-circle">
                                                        </figure>
                                                        <span class="title">Joseph Junior</span>
                                                        <span class="message">Lorem ipsum dolor sit.</span>
                                                    </li>
                                                    <li>
                                                        <figure class="image rounded">
                                                            <img src="assets/images/!sample-user.jpg" alt="Joe Junior" class="img-circle">
                                                        </figure>
                                                        <span class="title">Joe Junior</span>
                                                        <span class="message">Lorem ipsum dolor sit.</span>
                                                    </li>
                                                    <li>
                                                        <figure class="image rounded">
                                                            <img src="assets/images/!sample-user.jpg" alt="Joseph Doe Junior" class="img-circle">
                                                        </figure>
                                                        <span class="title">Joseph Doe Junior</span>
                                                        <span class="message">Lorem ipsum dolor sit.</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>

                        </div>
                    </section>
                </div>
                <div class="col-xl-3 col-lg-6">
                    <section class="panel panel-transparent">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="#" class="fa fa-caret-down"></a>
                                <a href="#" class="fa fa-times"></a>
                            </div>

                            <h2 class="panel-title">My Stats</h2>
                        </header>
                        <div class="panel-body">
                            <section class="panel">
                                <div class="panel-body">
                                    <div class="small-chart pull-right" id="sparklineBarDash"></div>
                                    <script type="text/javascript">
                                        var sparklineBarDashData = [5, 6, 7, 2, 0, 4 , 2, 4, 2, 0, 4 , 2, 4, 2, 0, 4];
                                    </script>
                                    <div class="h4 text-bold mb-none">488</div>
                                    <p class="text-xs text-muted mb-none">Average Profile Visits</p>
                                </div>
                            </section>
                            <section class="panel">
                                <div class="panel-body">
                                    <div class="circular-bar circular-bar-xs m-none mt-xs mr-md pull-right">
                                        <div class="circular-bar-chart" data-percent="45" data-plugin-options='{ "barColor": "#2baab1", "delay": 300, "size": 50, "lineWidth": 4 }'>
                                            <strong>Average</strong>
                                            <label><span class="percent">45</span>%</label>
                                        </div>
                                    </div>
                                    <div class="h4 text-bold mb-none">12</div>
                                    <p class="text-xs text-muted mb-none">Working Projects</p>
                                </div>
                            </section>
                            <section class="panel">
                                <div class="panel-body">
                                    <div class="small-chart pull-right" id="sparklineLineDash"></div>
                                    <script type="text/javascript">
                                        var sparklineLineDashData = [15, 16, 17, 19, 10, 15, 13, 12, 12, 14, 16, 17];
                                    </script>
                                    <div class="h4 text-bold mb-none">89</div>
                                    <p class="text-xs text-muted mb-none">Pending Tasks</p>
                                </div>
                            </section>
                        </div>
                    </section>
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="#" class="fa fa-caret-down"></a>
                                <a href="#" class="fa fa-times"></a>
                            </div>

                            <h2 class="panel-title">
                                <span class="label label-primary label-sm text-normal va-middle mr-sm">198</span>
                                <span class="va-middle">Friends</span>
                            </h2>
                        </header>
                        <div class="panel-body">
                            <div class="content">
                                <ul class="simple-user-list">
                                    <li>
                                        <figure class="image rounded">
                                            <img src="assets/images/!sample-user.jpg" alt="Joseph Doe Junior" class="img-circle">
                                        </figure>
                                        <span class="title">Joseph Doe Junior</span>
                                        <span class="message truncate">Lorem ipsum dolor sit.</span>
                                    </li>
                                    <li>
                                        <figure class="image rounded">
                                            <img src="assets/images/!sample-user.jpg" alt="Joseph Junior" class="img-circle">
                                        </figure>
                                        <span class="title">Joseph Junior</span>
                                        <span class="message truncate">Lorem ipsum dolor sit.</span>
                                    </li>
                                    <li>
                                        <figure class="image rounded">
                                            <img src="assets/images/!sample-user.jpg" alt="Joe Junior" class="img-circle">
                                        </figure>
                                        <span class="title">Joe Junior</span>
                                        <span class="message truncate">Lorem ipsum dolor sit.</span>
                                    </li>
                                </ul>
                                <hr class="dotted short">
                                <div class="text-right">
                                    <a class="text-uppercase text-muted" href="#">(View All)</a>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div class="input-group input-search">
                                <input type="text" class="form-control" name="q" id="q" placeholder="Search...">
                                <span class="input-group-btn">
											<button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
											</button>
										</span>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-xl-6 col-lg-12">
                    <section class="panel">
                        <header class="panel-heading panel-heading-transparent">
                            <div class="panel-actions">
                                <a href="#" class="fa fa-caret-down"></a>
                                <a href="#" class="fa fa-times"></a>
                            </div>

                            <h2 class="panel-title">Company Activity</h2>
                        </header>
                        <div class="panel-body">
                            <div class="timeline timeline-simple mt-xlg mb-md">
                                <div class="tm-body">
                                    <div class="tm-title">
                                        <h3 class="h5 text-uppercase">November 2013</h3>
                                    </div>
                                    <ol class="tm-items">
                                        <li>
                                            <div class="tm-box">
                                                <p class="text-muted mb-none">7 months ago.</p>
                                                <p>
                                                    It's awesome when we find a good solution for our projects, JSOFT Admin is <span class="text-primary">#awesome</span>
                                                </p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="tm-box">
                                                <p class="text-muted mb-none">7 months ago.</p>
                                                <p>
                                                    Checkout! How cool is that!
                                                </p>
                                                <div class="thumbnail-gallery">
                                                    <a class="img-thumbnail lightbox" href="assets/images/projects/project-4.jpg" data-plugin-options='{ "type":"image" }'>
                                                        <img class="img-responsive" width="215" src="assets/images/projects/project-4.jpg">
                                                        <span class="zoom">
																	<i class="fa fa-search"></i>
																</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <section class="panel panel-transparent">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="#" class="fa fa-caret-down"></a>
                                <a href="#" class="fa fa-times"></a>
                            </div>

                            <h2 class="panel-title">Global Stats</h2>
                        </header>
                        <div class="panel-body">
                            <div id="vectorMapWorld" style="height: 350px; width: 100%;"></div>
                        </div>
                    </section>
                </div>
                <div class="col-lg-6 col-md-12">
                    <section class="panel">
                        <header class="panel-heading panel-heading-transparent">
                            <div class="panel-actions">
                                <a href="#" class="fa fa-caret-down"></a>
                                <a href="#" class="fa fa-times"></a>
                            </div>

                            <h2 class="panel-title">Projects Stats</h2>
                        </header>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped mb-none">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Project</th>
                                        <th>Status</th>
                                        <th>Progress</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>JSOFT - Responsive HTML5 Template</td>
                                        <td><span class="label label-success">Success</span></td>
                                        <td>
                                            <div class="progress progress-sm progress-half-rounded m-none mt-xs light">
                                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                                                    100%
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>JSOFT - Responsive Drupal 7 Theme</td>
                                        <td><span class="label label-success">Success</span></td>
                                        <td>
                                            <div class="progress progress-sm progress-half-rounded m-none mt-xs light">
                                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                                                    100%
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Tucson - Responsive HTML5 Template</td>
                                        <td><span class="label label-warning">Warning</span></td>
                                        <td>
                                            <div class="progress progress-sm progress-half-rounded m-none mt-xs light">
                                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                                    60%
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Tucson - Responsive Business WordPress Theme</td>
                                        <td><span class="label label-success">Success</span></td>
                                        <td>
                                            <div class="progress progress-sm progress-half-rounded m-none mt-xs light">
                                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">
                                                    90%
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>JSOFT - Responsive Admin HTML5 Template</td>
                                        <td><span class="label label-warning">Warning</span></td>
                                        <td>
                                            <div class="progress progress-sm progress-half-rounded m-none mt-xs light">
                                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 45%;">
                                                    45%
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>JSOFT - Responsive HTML5 Template</td>
                                        <td><span class="label label-danger">Danger</span></td>
                                        <td>
                                            <div class="progress progress-sm progress-half-rounded m-none mt-xs light">
                                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                                    40%
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>7</td>
                                        <td>JSOFT - Responsive Drupal 7 Theme</td>
                                        <td><span class="label label-success">Success</span></td>
                                        <td>
                                            <div class="progress progress-sm progress-half-rounded mt-xs light">
                                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 95%;">
                                                    95%
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>
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
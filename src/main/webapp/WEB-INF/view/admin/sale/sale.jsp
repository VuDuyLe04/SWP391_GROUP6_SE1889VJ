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
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
    />
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



            <!-- start: page -->
            <div class="row bg-primary p-2">
                <div class="input-group col-md-4">
                    <input
                            type="text"
                            class="form-control"
                            placeholder="Product name"
                            aria-label="Recipient's username"
                            aria-describedby="basic-addon2"
                    />
                    <div class="input-group-append">
                        <button class="btn btn-success" type="button">Search</button>
                    </div>
                </div>

                <div class="col-md-3">
                    <select class="form-control">
                        <option value="all">All</option>
                        <option value="nep">Gạo nếp</option>
                        <option value="te">Gạo tẻ</option>
                        <option value="nut">Gạo nứt</option>
                        <option value="gaodo">Gạo đỏ</option>
                    </select>
                </div>

                <div class="col-md-5 d-flex align-items-center">
                    <div class="form-check form-check-inline">
                        <input
                                class="form-check-input"
                                type="checkbox"
                                id="filter1"
                                value="filter1"
                        />
                        <label class="form-check-label" for="filter1">Thơm</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input
                                class="form-check-input"
                                type="checkbox"
                                id="filter2"
                                value="filter2"
                        />
                        <label class="form-check-label" for="filter2">Dẻo</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input
                                class="form-check-input"
                                type="checkbox"
                                id="filter3"
                                value="filter3"
                        />
                        <label class="form-check-label" for="filter3">Bùi</label>
                    </div>
                </div>
            </div>

            <div class="row bg-secondary">
                <div class="col-md-8 overflow-auto">
                    <div
                            class="product d-flex justify-content-between align-items-center mb-2 mt-2 bg-light p-1"
                    >
                        <img src="/asset/img/anh1.jpg" alt="" width="50px" height="50px" />

                        <div class="m-2">name</div>
                        <div class="m-2">
                            <select class="form-control">
                                <option value="kg">kg</option>
                                <option value="tui50kg">Túi 50kg</option>
                                <option value="tui25kg">Túi 25kg</option>
                            </select>
                        </div>
                        <div class="m-2">
                            <select class="form-control">
                                <option value="giam100d">Giam 100d</option>
                                <option value="giam200d">Giam 200d</option>
                            </select>
                        </div>
                        <div class="m-2 text-danger">price</div>
                        <input placeholder="quantity" type="number" />
                        <button class="btn btn-primary">Chon</button>
                    </div>
                </div>
                <div class="col-md-4 mt-2 ">
                    <div class="p-3 bg-light rounded bill">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <span>customer name</span>
                            <span>Time</span>
                        </div>

                        <ul class="nav nav-tabs mb-2">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Hóa đơn</a>
                            </li>
                        </ul>
                        <div class="list-product-bill">
                            <div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>name</div>
                                    <div>type</div>
                                    <div>quantity</div>
                                    <div>price</div>
                                    <div>total</div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>gia giam</div>
                                    <div>total gia giam</div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="d-flex justify-content-between">
                                <span>Tổng tiền hàng</span>
                                <span>1,925,000</span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span>Giảm giá</span>
                                <span>0</span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span>Khách cần trả</span>
                                <span class="font-weight-bold text-success">1,925,000</span>
                            </div>
                            <hr />
                        </div>

                        <div class="mt-2">
            <textarea
                    class="form-control"
                    rows="2"
                    placeholder="Ghi chú"
            ></textarea>
                        </div>

                        <div class="text-center mt-3">
                            <button class="btn btn-success btn-block" style="height: 50px">
                                Thanh toán
                            </button>
                        </div>
                    </div>
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
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="fixed">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>Lịch sử nạp tiền</title>
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
                <h2>Lịch sử nạp tiền</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Lịch sử nạp tiền</span></li>
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
                                        <form id="search-form" action="#" method="get" class="search nav-form">
                                            <div class="input-group input-search">
                                                <input type="text" class="form-control" name="input"
                                                       placeholder="Tìm kiếm theo tên hoặc giá tiền" value="${input}" >
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
                                    <form action="usermanagement" method="get" class="form-inline">
                                        <c:if test="${sessionScope.user.role.id == 1}">
                                            <div class="form-group mr-md">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user-circle"></i></span>
                                                    <select id="role" name="role" class="form-control">
                                                        <option ${roleId == -1 ? "selected" : ""} value="-1" >Thời gian</option>
                                                        <c:forEach items="${roles}" var="r">
                                                        <option ${roleId == r.id ? "selected" : ""} value="${r.id}">
                                                            <c:if test="${r.name == 'ADMIN'}">Quản trị viên</c:if>
                                                            <c:if test="${r.name == 'OWNER'}">Chủ cửa hàng</c:if>
                                                            <c:if test="${r.name == 'STAFF'}">Nhân viên</c:if>

                                                            </c:forEach>

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group mr-md">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-toggle-on"></i></span>
                                                    <select id="active" name="active" class="form-control">
                                                        <option ${active == -1 ? "selected" : ""} value="-1">Các trạng thái</option>
                                                        <option ${active == 1 ? "selected" : ""} value="1">Hoạt động</option>
                                                        <option ${active == 0 ? "selected" : ""} value="0">Bị cấm</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary"><i class="fa fa-filter mr-xs"></i>Lọc</button>
                                        </c:if>


                                    </form>
                                </div>

                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-condensed mb-none">
                                    <thead>

                                    <tr>
                                        <th>STT</th>
                                        <th class="text-center">Mã giao dịch</th>
                                        <th class="text-center">Tiền</th>
                                        <th class="text-center">Nội dung</th>
                                        <th class="text-center">Thời gian</th>
                                        <th class="text-center">Tài khoản nhận tiền</th>
                                        <th class="text-center">Cổng thanh toán</th>
                                        <th class="text-center">Trạng thái</th>
                                    </tr>

                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listTransactionPayment}" var="t" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td class="text-center">${t.transactionId}</td>
                                            <td class="text-center">${t.amount}</td>
                                            <td class="text-center">${t.content}</td>
                                            <td class="text-center">${t.date}</td>
                                            <td class="text-center">${t.accountReceiver}</td>
                                            <td class="text-center">${t.gate}</td>
                                            <td class="text-center">${t.transactionStatus}</td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>

                                </table>
                                <div class="pagination-container text-center mt-3">
                                    <ul class="pagination justify-content-center">
                                        <c:if test="${currentPage > 0}">
                                            <li class="page-item">
                                                <a class="page-link" href="/payment/history?page=${currentPage - 1}"
                                                   aria-label="Previous">
                                                    <span aria-hidden="true">&laquo; Trước</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${totalPages > 0}">
                                            <c:forEach begin="0" end="${totalPages - 1}" var="i">
                                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                    <a class="page-link" href="/payment/history?page=${i}">${i + 1}</a>
                                                </li>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${currentPage < totalPages - 1}">
                                            <li class="page-item">
                                                <a class="page-link" href="/payment/history?page=${currentPage + 1}"
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
</body>
</html>
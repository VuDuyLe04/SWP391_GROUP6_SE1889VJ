<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="fixed">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>Danh sách nợ của khách hàng</title>
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
    <jsp:include page="../layout/header.jsp"/>
    <div class="inner-wrapper">
        <jsp:include page="../layout/sidebar.jsp"/>
        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Danh sách nợ của ${customer.name}</h2>

            </header>

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="/customer/debt-receipt/create/${customer.id}" class="btn btn-success"
                                   style="display: inline-flex;
                                          justify-content: center;
                                          align-items: center;
                                          width: 120px;
                                          height: 40px;
                                          font-size: 14px;
                                          font-weight: bold;
                                          color: #ffffff;
                                          background: linear-gradient(90deg, #0093DD, #007ACC);
                                          border: none;
                                          border-radius: 5px;
                                          text-decoration: none;
                                          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                                          transition: all 0.3s ease;">
                                    Tạo phiếu nợ
                                </a>
                            </div>

                            <!-- Form tìm kiếm theo ngày -->
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <form method="GET" action="/debt-receipt/search/${customer.id}" class="form-inline">
                                        <div class="form-group">
                                            <label>Số tiền nợ:</label>
                                            <input type="number" name="debtAmount" class="form-control" value="${param.debtAmount}" step="0.01"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Ngày bắt đầu:</label>
                                            <input type="date" name="from" class="form-control" value="${param.from}"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Ngày kết thúc:</label>
                                            <input type="date" name="to" class="form-control" value="${param.to}"/>
                                        </div>
                                        <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                                    </form>
                                </div>
                            </div>
                        </header>

                        <div class="panel-body">
                            <div class="mb-3">
                                <strong>Tổng nợ:</strong> ${totalAmount}
                            </div>

                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>Mã nợ</th>
                                    <th>Số tiền</th>
                                    <th>Loại nợ</th>
                                    <th>Lý do</th>
                                    <th>Ngày tạo</th>
                                    <th>Người tạo</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${deptList}" var="dept" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>${dept.debtAmount}</td>
                                        <td>${dept.debtType}</td>
                                        <td>${dept.debtReason}</td>
                                        <td>${dept.createdAt}</td>
                                        <td>${dept.createdBy}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <!-- Phân trang -->
                            <div class="pagination-container text-center mt-3">
                                <ul class="pagination justify-content-center">
                                    <c:set var="searchQuery" value="" />

                                    <!-- Thêm các tham số tìm kiếm vào searchQuery -->
                                    <c:if test="${not empty param.from}">
                                        <c:set var="searchQuery" value="${searchQuery}&from=${param.from}" />
                                    </c:if>
                                    <c:if test="${not empty param.to}">
                                        <c:set var="searchQuery" value="${searchQuery}&to=${param.to}" />
                                    </c:if>
                                    <c:if test="${not empty param.debtAmount}">
                                        <c:set var="searchQuery" value="${searchQuery}&debtAmount=${param.debtAmount}" />
                                    </c:if>

                                    <!-- Previous page -->
                                    <c:if test="${currentPage > 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="/debt-receipt/search/${customer.id}?page=${currentPage - 1}${searchQuery}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo; Trước</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${currentPage == 1}">
                                        <li class="page-item disabled">
                                            <span class="page-link">&laquo; Trước</span>
                                        </li>
                                    </c:if>

                                    <!-- Page numbers -->
                                    <c:if test="${totalPages > 0}">
                                        <c:forEach begin="0" end="${totalPages - 1}" var="i">
                                            <li class="page-item ${i == currentPage - 1 ? 'active' : ''}">
                                                <a class="page-link" href="/debt-receipt/search/${customer.id}?page=${i + 1}${searchQuery}">${i + 1}</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>

                                    <!-- Next page -->
                                    <c:if test="${currentPage < totalPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="/debt-receipt/search/${customer.id}?page=${currentPage + 1}${searchQuery}" aria-label="Next">
                                                <span aria-hidden="true">Sau &raquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${currentPage == totalPages}">
                                        <li class="page-item disabled">
                                            <span class="page-link">Sau &raquo;</span>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>



                            <a href="/customer" class="btn btn-primary">
                                Quay lại danh sách
                            </a>
                        </div>
                    </section>
                </div>
            </div>
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
</body>
</html>
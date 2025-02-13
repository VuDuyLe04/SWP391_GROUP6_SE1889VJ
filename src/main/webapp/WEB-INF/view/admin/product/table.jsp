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
                <h2>List Product</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Danh sách sản phẩm</span></li>
                    </ol>

                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>



            <!-- start: page -->


            <section class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <a href="#" class="fa fa-caret-down"></a>
                        <a href="#" class="fa fa-times"></a>
                    </div>

                    <h2 class="panel-title">Danh sách sản phẩm</h2>
                </header>
                <div class="panel-body">


                        <div class="col-md-6">
                            <form method="GET" action="/product/search" class="form-inline" style="margin-bottom: 20px;">
                                <div class="input-group">
                                    <input type="text" class="form-control" name="name" placeholder="Nhập tên gạo" value="${param.name}" required pattern="[A-Za-z0-9 ]+" title="Chỉ nhập chữ cái và số">

                                    <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                    </span>
                                </div>
                            </form>
                        </div>



                    <div class="col-md-6 text-right">
                        <form method="GET" action="/product" class="form-inline">
                            <label for="sort">Sắp xếp theo giá:</label>
                            <select name="order" id="sort" class="form-control" onchange="this.form.submit()">
                                <option value="asc" ${order == 'asc' ? 'selected' : ''}>Thấp đến cao</option>
                                <option value="desc" ${order == 'desc' ? 'selected' : ''}>Cao đến thấp</option>
                            </select>
                            <input type="hidden" name="sort" value="unitPrice">
                        </form>
                    </div>


                </div>


                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-condensed mb-none">
                            <thead>
                            <tr>
                                <th>Code</th>
                                <th>Tên gạo</th>
                                <th class="text-center">Hình ảnh</th>
                                <th class="text-center">Giá gạo</th>

                                <th class="text-center">Kho</th>
                                <th class="text-center" style="width: 350px;">Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" items="${listProduct}">
                                    <tr>
                                        <td>${product.id}</td>
                                        <td class="hidden-xs hidden-sm">${product.name}</td>
                                        <td class="text-center">${product.image}</td>
                                        <td class="text-center">${product.unitPrice} đ/kg</td>
                                        <td class="text-center">${product.storage}</td>


                                        <td class="text-center">
                                            <button class="btn btn-primary btn-sm" onclick="window.location.href='/product/update/${product.id}'">Cập nhật</button>

                                            <button class="btn btn-info btn-sm" onclick="window.location.href='/product/view/${product.id}'">Xem chi tiết</button>

<%--                                            <form method="post" action="/product/delete" style="display:inline;">--%>
<%--                                                <input type="hidden" name="_csrf" value="${_csrf.token}" />--%>
<%--                                                <input type="hidden" name="id" value="${product.id}" />--%>
<%--                                                <button class="btn btn-danger btn-sm" type="submit" onclick="return confirm('Are you sure you want to delete this item?');">Xóa sản phẩm</button>--%>
<%--                                            </form>--%>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="pagination-container text-center mt-3">
                            <ul class="pagination">
                                <c:if test="${currentPage > 0}">
                                    <li>
                                        <a href="/product?page=${currentPage - 1}&sort=${sort}&order=${order}">Trước</a>
                                    </li>
                                </c:if>

                                <c:if test="${totalPages > 0}">
                                    <c:forEach begin="0" end="${totalPages - 1}" var="i">
                                        <li class="${i == currentPage ? 'active' : ''}">
                                            <a href="/product?page=${i}&sort=${sort}&order=${order}">${i + 1}</a>
                                        </li>
                                    </c:forEach>
                                </c:if>


                                <c:if test="${currentPage < totalPages - 1}">
                                    <li>
                                        <a href="/product?page=${currentPage + 1}&sort=${sort}&order=${order}">Sau</a>
                                    </li>
                                </c:if>
                            </ul>

                        </div>
                    </div>
                <div class="panel-heading">
                    <a href="/product/create" class="btn btn-success">Tạo sản phẩm mới</a>
                </div>

            </section>



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
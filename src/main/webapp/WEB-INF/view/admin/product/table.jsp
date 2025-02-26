<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="fixed">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>Quản lí sản phẩm</title>
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
        .add-product{
            color: white;
        }
        .sort-select{
            padding-top: 10px;
            padding-left: 0;
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
                <h2>Quản lí sản phẩm</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Danh sách sản phẩm</span></li>
                    </ol>

                    <a class="sidebar-right-toggle" ><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

<%--            <c:if test="${not empty successMessage}">--%>
<%--                <div class="alert alert-success">${successMessage}</div>--%>
<%--            </c:if>--%>
<%--            <c:if test="${not empty errorMessage}">--%>
<%--                <div class="alert alert-danger">${errorMessage}</div>--%>
<%--            </c:if>--%>


            <div class="row">
                <div class="col-md-12">
                    <section class="panel panel-featured panel-featured-primary">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="#" class="panel-action panel-action-toggle" data-panel-toggle></a>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <h2 class="panel-title"><i class="fa fa-list-alt mr-xs"></i>Các loại đóng gói</h2>
                                </div>
                                <div class="col-sm-6">
                                    <div class="pull-right">
                                        <form id="search-form" action="/product/search" method="GET" class="search nav-form">
                                            <div class="input-group input-search">
                                                <input type="text" class="form-control" name="name"
                                                       placeholder="Tìm theo tên đóng gói" value="${param.name}"  pattern="^(?!\s*$)[a-zA-ZÀ-Ỹà-ỹ0-9 ]+$" title="Chỉ nhập chữ cái và số">
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
                                    <form action="product" method="get" class="form-inline">
                                        <div class="form-group mr-md">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-store"></i></span>
                                                <select id="store" name="store" class="form-control">
                                                    <option value="0" ${store == 0 ? "selected" : ""}>Tất cả cửa hàng</option>

                                                    <c:forEach items="${stores}" var="storeItem">
                                                        <option value="${storeItem.id}" ${store == storeItem.id ? "selected" : ""}>
                                                                ${storeItem.name}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <button type="submit" class="btn btn-primary"><i class="fa fa-filter mr-xs"></i>Filter</button>

                                    </form>
                                    <div class="col-md-12 sort-select">
                                        <form method="GET" action="/product" class="form-inline">
                                            <label >Sắp xếp theo giá:</label>
                                            <select name="order" id="sortPrice" class="form-control" onchange="this.form.submit()">
                                                <option value="asc" ${order == 'asc' ? 'selected' : ''}>Thấp đến cao</option>
                                                <option value="desc" ${order == 'desc' ? 'selected' : ''}>Cao đến thấp</option>
                                            </select>
                                            <input type="hidden" name="sort" value="unitPrice">
                                        </form>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="pull-right">



                                        <button class="btn btn-primary mb-xs mt-xs mr-xs">
                                            <i class="fa fa-plus mr-xs"></i><a href="/product/createProduct" class="add-product">Tạo sản phẩm mới</a>
                                        </button>
                                    </div>
                                </div>

                            </div>
<%--                            talbe--%>
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover mb-none">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên gạo</th>
                                        <th class="text-center">Giá gạo</th>
                                        <th class="text-center">Số lượng</th>
                                        <th class="text-center">Loại gạo</th>
                                        <th class="text-center">Lưu trữ</th>
                                        <th class="text-center" style="width: 350px;">Hành động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="product" items="${listProduct}" varStatus="status">
                                        <!-- Modal -->



                                        <!-- Bảng dữ liệu -->
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td class="hidden-xs hidden-sm">${product.name}</td>
                                            <td class="text-center">${product.unitPrice} đ/kg</td>
                                            <td class="text-center">${product.totalQuantity}</td>
                                            <td class="text-center">${product.category}</td>
                                            <td class="text-center">
                                                <span class="label ${product.storage == 'true' ? 'label-success' : 'label-danger'} label-sm status-label">
                                                    <i class="fa ${product.storage == 'true' ? 'fa-check' : 'fa-ban'} mr-xs"></i>
                                                    ${product.storage == "true" ? "Active" : "Banned"}
                                                </span>
                                            </td>
                                            <td class="text-center">
                                                <button class="btn btn-default btn-sm mr-xs view-modal" title="View" onclick="window.location.href='/product/view/${product.id}'">
                                                    <i class="fa fa-eye"></i>
                                                </button>
                                                <button class="btn btn-primary btn-sm" title="Update" onclick="window.location.href='/product/update/${product.id}'">
                                                    <i class="fa fa-pencil"></i>
                                                </button>


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

                                <c:set var="c" value="${productPage.number}" />

                                <ul class="pagination justify-content-center">
                                    <!-- Nút Previous -->
                                    <li class="page-item ${c == 0 ? 'disabled' : ''}">
                                        <a class="page-link"
                                           href="${c == 0 ? '#' : 'product?page='}${c - 1}&sort=${param.sort}&order=${param.order}&store=${param.store}">Trước</a>
                                    </li>

                                    <!-- Hiển thị các số trang -->
                                    <c:if test="${productPage.totalPages > 0}">
                                        <c:forEach begin="0" end="${productPage.totalPages - 1}" var="i">
                                            <c:if test="${i >= c - 2 && i <= c + 2}">
                                                <li class="page-item ${c == i ? 'active' : ''}">
                                                    <a class="page-link" href="product?page=${i}&sort=${param.sort}&order=${param.order}&store=${param.store}">${i + 1}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>

                                    <!-- Nút Next -->
                                    <li class="page-item ${c >= productPage.totalPages - 1 ? 'disabled' : ''}">
                                        <a class="page-link"
                                           href="${c >= productPage.totalPages - 1 ? '#' : 'product?page='}${c + 1}&sort=${param.sort}&order=${param.order}&store=${param.store}">Sau</a>
                                    </li>
                                </ul>


                            </div>

                        </div>
                    </section>
                </div>
            </div>


            <!-- start: page -->






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
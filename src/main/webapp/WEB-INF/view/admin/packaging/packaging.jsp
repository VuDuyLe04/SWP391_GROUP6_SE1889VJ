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
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .modal-dialog {
            background-color: #fff;
            margin: 10% auto;
            padding: 20px;
            border-radius: 10px;
            width: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            position: relative;
            animation: fadeIn 0.3s ease-in-out;
        }
        .close {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 24px;

            cursor: pointer;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .but-sort{
            padding-top: 10px;
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
                <h2><i class="fa fa-users mr-xs"></i>Quản lí đóng gói</h2>
                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Quản lí đóng gói</span></li>
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
                                    <h2 class="panel-title"><i class="fa fa-list-alt mr-xs"></i>Các loại đóng gói</h2>
                                </div>
                                <div class="col-sm-6">
                                    <div class="pull-right">
                                        <form id="search-form" action="packaings" method="get" class="search nav-form">
                                            <div class="input-group input-search">
                                                <input type="text" class="form-control" name="input"
                                                       placeholder="Tìm theo tên đóng gói" >
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
                                    <form id="form-header" action="packaings" method="get" class="form-inline">
                                        <!-- Hidden input for sort parameter -->
                                        <input type="hidden" name="sort" id="sortField" value="${sort}">

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

                                        <div class="form-group mr-md">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-toggle-on"></i></span>
                                                <select id="active" name="active" class="form-control">
                                                    <option ${active == -1 ? "selected" : ""} value="-1">Tất cả</option>
                                                    <option ${active == 1 ? "selected" : ""} value="1">Sử dụng</option>
                                                    <option ${active == 0 ? "selected" : ""} value="0">Lưu trữ</option>
                                                </select>
                                            </div>
                                        </div>

                                        <button type="submit" class="btn btn-primary">
                                            <i class="fa fa-filter mr-xs"></i>Filter
                                        </button>

                                        <div class="d-flex gap-2 p-2 but-sort">
                                            <button type="button" class="btn btn-secondary" onclick="setSort('liftCost,asc')">
                                                <i class="fa fa-sort-amount-asc"></i> Giá tăng
                                            </button>
                                            <button type="button" class="btn btn-secondary" onclick="setSort('liftCost,desc')">
                                                <i class="fa fa-sort-amount-desc"></i> Giá giảm
                                            </button>
                                            <button type="button" class="btn btn-secondary" onclick="setSort('createdAt,desc')">
                                                <i class="fa fa-clock-o"></i> Mới nhất
                                            </button>
                                            <button type="button" class="btn btn-secondary" onclick="setSort('createdAt,asc')">
                                                <i class="fa fa-clock-o"></i> Muộn nhất
                                            </button>
                                        </div>
                                    </form>
                                </div>

                                <div class="col-sm-6">
                                    <div class="pull-right">
                                        <button id="openAddPackageModal" class="btn btn-primary mb-xs mt-xs mr-xs">
                                            <i class="fa fa-plus mr-xs"></i>Thêm gói
                                        </button>
                                    </div>
                                </div>
                                <div id="addPack" class="modal">
                                    <div class="modal-dialog">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h5>Thêm gói mới</h5>
                                            <button type="button" class="close" id="closeModalButton">&times;</button>
                                        </div>

                                        <!-- Modal Body -->
                                        <form id="add-form" action="/addPackaging" method="post" onsubmit="return validateAddPack()">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label >Loại gói:</label>
                                                    <input id="add-input-pack" type="text" class="form-control" name="packageType" required>
                                                    <p id="packageErro" class="text-danger" style="display: none"></p>
                                                </div>
                                                <div class="form-group">
                                                    <label>Gía bốc vác:</label>
                                                    <input min="0" type="number" class="form-control" name="liftCost" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Số lượng gạo 1 gói:</label>
                                                    <input min="0" type="number" class="form-control" name="quantityPerPackage" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Cửa hàng</label>
                                                </div>
                                                <select id="store-option" name="storeId" class="form-control">
                                                    <c:forEach items="${stores}" var="storeIt">
                                                        <option value="${storeIt.id}" ${store == storeIt.id ? "selected" : ""}>
                                                                ${storeIt.name}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" id="cancelButton">Hủy</button>
                                                <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>

                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover mb-none">
                                    <thead>
                                    <tr>
                                        <th><i class="fa"></i>STT</th>
                                        <th><i class="fa fa-user mr-xs"></i>Đóng gói</th>
                                        <th><i class="fa fa-user mr-xs"></i>Gía bốc</th>
                                        <th><i class="fa fa-check-circle mr-xs"></i>Cửa hàng</th>
                                        <th><i class="fa fa-check-circle mr-xs"></i>Tình Trạng</th>
                                        <th><i class="fa fa-cogs mr-xs"></i>Hoạt động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="u" items="${packagings}" varStatus="status">
                                        <!-- Modal -->
                                        <div class="modal" id="myModal-${u.id}">
                                            <div class="modal-dialog">

                                                    <!-- Modal Header -->
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Chi tiết loại: ${u.packageType}</h4>
                                                        <span class="close" data-id="myModal-${u.id}">&times;</span>
                                                    </div>

                                                    <!-- Modal body -->
                                                <div class="modal-body">
                                                    <p>Loại gói: ${u.packageType}</p>
                                                    <p>Gía bốc vác: ${u.liftCost} đồng</p>

                                                    <c:if test="${not empty u.createdAt}">
                                                        <p>Tạo ngày: ${u.createdAtFormatted}</p>
                                                    </c:if>

                                                    <c:if test="${not empty u.createdBy}">
                                                        <p>Tạo bởi: ${u.createdBy}</p>
                                                    </c:if>

                                                    <c:if test="${not empty u.updatedAt}">
                                                        <p>Cập nhật ngày: ${u.updatedAtFormatted}</p>
                                                    </c:if>

                                                    <c:if test="${not empty u.updatedBy}">
                                                        <p>Cập nhật bởi: ${u.updatedBy}</p>
                                                    </c:if>
                                                    <p>Cửa hàng: ${u.store.name}</p>
                                                    <p>Số lượng đóng gói: ${u.quantityPerPackage} kg</p>
                                                </div>


                                            </div>
                                        </div>
                                        <div class="modal" id="updateModal-${u.id}">
                                            <div class="modal-dialog">

                                                    <!-- Modal Header -->
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Cập nhật thông tin loại: ${u.packageType}</h4>
                                                        <span class="close" data-id="updateModal-${u.id}">&times;</span>
                                                    </div>

                                                    <!-- Modal update -->
                                                    <form id="formUpdate-${u.id}" action="/updatePackaging" method="post">
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                        <div class="modal-body">
                                                            <div class="form-group" hidden="hidden">
                                                                <label for="packageType-${u.id}">Id:</label>
                                                                <input  type="text" class="form-control" id="id-${u.id}" name="id" value="${u.id}" required>

                                                            </div>

                                                            <div class="form-group">
                                                                <label for="packageType-${u.id}">Loại gói:</label>
                                                                <input type="text" class="form-control" id="packageType-${u.id}" data-type="${u.packageType}" data-store="${u.store.id}" name="packageType" value="${u.packageType}" required>
                                                                <p id="packageTypeError-${u.id}" class="text-danger" style="display: none"></p>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="liftCost-${u.id}">Gía bốc vác:</label>
                                                                <input min="0" type="number" class="form-control" id="liftCost-${u.id}" name="liftCost" value="${u.liftCost}" required>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="storage-${u.id}">Tình trạng:</label>
                                                                <select class="form-control" id="storage-${u.id}" name="storage" required>
                                                                    <option value="true" ${u.storage == 'true' ? 'selected' : ''}>Sử dụng</option>
                                                                    <option value="false" ${u.storage == 'false' ? 'selected' : ''}>Lưu trữ</option>
                                                                </select>
                                                            </div>

                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-id="updateModal-${u.id}">Hủy</button>
                                                            <button type="submit" class="btn btn-primary" id="button-update" onclick="getPackInputType(${u.id})">Cập nhật</button>
                                                        </div>
                                                    </form>

                                            </div>
                                        </div>

                                        <!-- Bảng dữ liệu -->
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${u.packageType}</td>
                                            <td>${u.liftCost}</td>
                                            <td>
                                                    ${u.store.name}
                                            </td>
                                            <td>
                                                <span class="label ${u.storage == 'true' ? 'label-success' : 'label-danger'} label-sm status-label">
                                                    <i class="fa ${u.storage == 'true' ? 'fa-check' : 'fa-ban'} mr-xs"></i>
                                                    ${u.storage == "true" ? "Active" : "Banned"}
                                                </span>
                                            </td>
                                            <td>
                                                <button class="btn btn-default btn-sm mr-xs view-modal" title="View" data-id="myModal-${u.id}">
                                                    <i class="fa fa-eye"></i>
                                                </button>
                                                <button class="btn btn-primary btn-sm" title="Update" data-id="updateModal-${u.id}">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <c:set var="c" value="${packagingPage.number}"></c:set>

                                <ul class="pagination justify-content-center">
                                    <!-- Nút Previous -->
                                    <li class="page-item ${c == 0 ? 'disabled' : ''}">
                                        <a class="page-link" href="packaings?page=${c == 0 ? 0 : (c - 1)}&store=${param.store}&input=${param.input}&sort${param.sort}&active=${param.active}">Trước</a>
                                    </li>

                                    <!-- Hiển thị các số trang -->
                                    <c:if test="${packagingPage.totalPages > 0}">
                                        <c:forEach begin="0" end="${packagingPage.totalPages - 1}" var="i">
                                            <c:if test="${i >= c - 1 && i <= c + 1}">
                                                <li class="page-item ${c == i ? 'active' : ''}">
                                                    <a class="page-link" href="packaings?page=${i}&store=${param.store}&input=${param.input}&sort${param.sort}&active=${param.active}">${i + 1}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>

                                    <!-- Nút Next -->
                                    <li class="page-item ${c == packagingPage.totalPages - 1 ? 'disabled' : ''}">
                                        <a class="page-link" href="packaings?page=${c == packagingPage.totalPages - 1 ? c : (c + 1)}&store=${param.store}&input=${param.input}&sort${param.sort}&active=${param.active}">Sau</a>
                                    </li>

                                </ul>

                            </div>

                        </div>
                    </section>
                </div>
            </div>
            <div hidden="hidden"><c:forEach var="a" items="${allPack}">
                <h5 data-id="${a.id}" data-storeId="${a.store.id}">${a.packageType}</h5>

            </c:forEach></div>


            <!-- start: page -->

            <!-- end: page -->
        </section>
    </div>



</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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
    document.addEventListener("DOMContentLoaded", function () {
        const viewButtons = document.querySelectorAll(".view-modal");
        const closeButtons = document.querySelectorAll(".close");

        viewButtons.forEach(button => {
            button.addEventListener("click", function () {
                const modalId = this.getAttribute("data-id");
                const modal = document.getElementById(modalId);
                if (modal) {
                    modal.style.display = "block";
                }
            });
        });


        closeButtons.forEach(button => {
            button.addEventListener("click", function () {
                const modal = this.closest(".modal");
                if (modal) {
                    modal.style.display = "none";
                }
            });
        });


        window.addEventListener("click", function (event) {
            document.querySelectorAll(".modal").forEach(modal => {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            });
        });


        const addPackageButton = document.getElementById("openAddPackageModal");
        if (addPackageButton) {
            addPackageButton.addEventListener("click", function () {
                const modalAddPackage = document.getElementById("addPack");
                if (modalAddPackage) {
                    modalAddPackage.style.display = "block";
                }
            });
        }


        const closeAddPackageModal = document.querySelector("#addPack .close");
        if (closeAddPackageModal) {
            closeAddPackageModal.addEventListener("click", function () {
                const modalAddPackage = document.getElementById("addPack");
                if (modalAddPackage) {
                    modalAddPackage.style.display = "none";
                }
            });
        }

        const updateButtons = document.querySelectorAll(".btn-primary");
        updateButtons.forEach(button => {
            button.addEventListener("click", function () {
                const modalId = this.getAttribute("data-id");
                const modal = document.getElementById(modalId);
                if (modal) {
                    modal.style.display = "block";
                }
            });
        });
    });

    // get all packType
    let packageTypes = [];

    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll("div[hidden] h5").forEach(h5 => {
            packageTypes.push({
                packageType: h5.textContent.trim(),
                id: h5.getAttribute("data-id"),
                storeId: h5.getAttribute("data-storeId")
            });
        });

        console.log(packageTypes);
    });


    //validate form update
    function getPackInputType(id) {
        const form = document.getElementById("formUpdate-" + id);
        if (form) {
            form.addEventListener("submit", function (event) {
                event.preventDefault();
                const inputPack = document.getElementById("packageType-" + id);
                const errorMsg = document.getElementById("packageTypeError-" + id);
                const dataType = inputPack.getAttribute("data-type");
                const storeIdData = inputPack.getAttribute("data-store");

                if (inputPack) {
                    const inputPackValue = inputPack.value.trim();
                    let exists = false;

                    if (inputPackValue !== dataType) {
                        packageTypes.forEach(pkg => {
                            if (pkg.storeId === storeIdData) {
                                if (pkg.packageType === inputPackValue && pkg.id !== id) {
                                    exists = true;
                                }
                            }
                        });
                    }

                    if (exists) {
                        errorMsg.textContent = "Tên gói đã tồn tại trong cửa hàng.";
                        errorMsg.style.display = "block";
                    } else {
                        errorMsg.style.display = "none";
                        form.submit();
                    }
                }
            });
        }
    }
    function validateAddPack() {
        let packageTypeInput = document.getElementById("add-input-pack").value.trim().toLowerCase();
        let storeIdInput = document.getElementById("store-option").value;
        let packageError = document.getElementById("packageErro");

        let exists = packageTypes.some(p => p.packageType === packageTypeInput && p.storeId === storeIdInput);

        if (exists) {
            packageError.textContent = "Loại gói này đã tồn tại trong cửa hàng!";
            packageError.style.display = "block";
            return false;
        }

        packageError.style.display = "none";
        return true;
    }
    function setSort(sortValue) {
        document.getElementById('sortField').value = sortValue;
        document.getElementById('form-header').submit();
    }




</script>
</body>
</html>
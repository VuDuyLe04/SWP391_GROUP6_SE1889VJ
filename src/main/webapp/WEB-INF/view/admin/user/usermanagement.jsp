<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="fixed" style="overflow: hidden">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>Quản lí người dùng</title>
    <meta name="keywords" content="HTML5 Admin Template" />
    <meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
    <meta name="author" content="JSOFT.net">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <!-- Web Fonts  -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

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
        /* Existing modal styles */
        html, body {
            overflow-y: scroll !important;
            margin-right: 0 !important;
            padding-right: 0 !important;
            width: 100% !important;
        }
        
        /* Update modal styles */
        .modal {
            text-align: center;
            padding: 0 !important;
        }
        
        .modal:before {
            content: '';
            display: inline-block;
            height: 15vh; /* Giảm khoảng cách từ top để modal nằm gần nút Filter */
            vertical-align: middle;
            margin-right: -4px;
        }
        
        .modal-dialog {
            display: inline-block;
            text-align: left;
            vertical-align: middle;
            max-width: 800px !important;
            width: 95% !important;
            margin: 0 auto !important;
            transform: translate(0, -25%) !important;
        }
        
        .modal-content {
            border: none;
            border-radius: 4px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            height: auto !important;
            max-height: 500px !important;
        }
        
        .modal-body {
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        
        .user-info {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 15px;
        }
        
        .info-group {
            width: calc(50% - 10px);
            margin-bottom: 12px;
            padding: 10px;
            background: #f8f9fa;
            border-radius: 3px;
            display: flex;
            align-items: center;
        }
        
        .info-group label {
            width: 120px;
            font-size: 14px;
            margin-bottom: 0;
            white-space: nowrap;
        }
        
        .info-value {
            font-size: 14px;
            flex: 1;
        }
        
        .modal-header {
            background: #0088cc;
            color: white;
            border-radius: 4px 4px 0 0;
            padding: 10px 15px;
            height: 50px;
        }
        
        .modal-header .close {
            display: none !important;
        }
        
        .modal-title {
            font-size: 14px;
            margin: 0;
        }
        
        .modal-footer {
            padding: 10px 15px;
            border-top: 1px solid #dee2e6;
            background: #f8f9fa;
            border-radius: 0 0 4px 4px;
            height: 50px;
        }
        
        .modal-footer .btn {
            padding: 5px 15px;
            font-size: 14px;
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
                <h2><i class="fa fa-users mr-xs"></i>
                    <c:if test="${sessionScope.user.role.id == 1}">
                        Quản lí người dùng
                </c:if>
                    <c:if test="${sessionScope.user.role.id == 2}">
                        Quản lí nhân viên
                    </c:if>
                </h2>
                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Quản lí người dùng</span></li>
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
                                    <h2 class="panel-title"><i class="fa fa-list-alt mr-xs"></i>User List</h2>
                                </div>
                                <div class="col-sm-6">
                                    <div class="pull-right">
                                        <form id="search-form" action="usermanagement" method="get" class="search nav-form">
                                            <div class="input-group input-search">
                                                <input type="text" class="form-control" name="input" 
                                                       placeholder="Tìm kiếm theo tên hoặc số điện thoại" value="${input}" >
                                                <span class="input-group-btn">
                                                    <button class="btn btn-primary" type="submit">

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
                                                    <span class="input-group-addon"><i
                                                            class="fa fa-user-circle"></i></span>
                                                    <select id="role" name="role" class="form-control">
                                                        <option ${roleId == -1 ? "selected" : ""} value="-1">Các vai
                                                            trò
                                                        </option>
                                                        <c:forEach items="${roles}" var="r">
                                                            <option ${roleId == r.id ? "selected" : ""} value="${r.id}">
                                                                <c:if test="${r.name == 'OWNER'}">Chủ cửa hàng</c:if>
                                                                <c:if test="${r.name == 'STAFF'}">Nhân viên</c:if>
                                                            </option>
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
                                        <c:if test="${sessionScope.user.role.id == 2}">


                                            <div class="form-group mr-md">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-toggle-on"></i></span>
                                                    <select id="storeId" name="storeId" class="form-control" onchange="filterByStore(this.value)">
                                                        <option value="-1" ${storeId == -1 ? 'selected' : ''}>Tất cả cửa hàng</option>
                                                        <c:forEach items="${stores}" var="s">
                                                            <option value="${s.id}" ${storeId == s.id ? 'selected' : ''}>${s.name}</option>
                                                        </c:forEach>

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group mr-md">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-toggle-on"></i></span>
                                                    <select id="status" name="status" class="form-control" onchange="filterByStatus(this.value)">
                                                        <option ${status == -1 ? "selected" : ""} value="-1">Các trạng thái</option>
                                                        <option ${status == 1 ? "selected" : ""} value="1">Hoạt động</option>
                                                        <option ${status == 0 ? "selected" : ""} value="0">Bị cấm</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </c:if>

                                    </form>
                                </div>
                                ${inputError}
                                <div class="col-sm-6">
                                    <div class="pull-right">

                                        <c:if test="${sessionScope.user.role.id == 1}">

                                            <a href="createuser" class="btn btn-primary mb-xs mt-xs mr-xs">
                                                <i class="fa fa-plus mr-xs"></i>Tạo chủ sở hữu
                                            </a>
                                            </c:if>
                                        <c:if test="${sessionScope.user.role.id == 2}">
                                            <a href="createstaff" class="btn btn-primary mb-xs mt-xs mr-xs">
                                                <i class="fa fa-plus mr-xs"></i>Tạo nhân viên
                                            </a>
                                        </c:if>

                                    </div>
                                </div>
                            </div>
                            <c:if test="${emptyList != null}">
                                <div class="alert alert-info">
                                    <i class="fa fa-info-circle mr-xs"></i> ${emptyList}
                                </div>
                            </c:if>
                            <c:if test="${emptyList == null}">

                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover mb-none">
                                    <thead>
                                    <tr>
                                        <th><i class="fa"></i>STT</th>
                                        <th><i class="fa fa-user mr-xs"></i>Tên</th>
                                        <th><i class="fa fa-phone mr-xs"></i>Số điện thoại</th>
                                        <c:if test="${sessionScope.user.role.id == 1}">
                                            <th><i class="fa fa-users mr-xs"></i>Vai trò</th>
                                            <th><i class="fa fa-check-circle mr-xs"></i>Trạng thái</th>
                                        </c:if>
                                        <th><i class="fa fa-cogs mr-xs"></i>Hành động</th>
                                    </tr>
                                    </thead>
                                    ${emptyList}
                                    <tbody>
                                    <c:if test="${userPage != null }">
                                    <c:forEach var="u" items="${userPage.content}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td><strong>${u.name}</strong></td>
                                            <td>${u.phone}
                                                </td>
                                            <c:if test="${sessionScope.user.role.id == 1}">
                                                <td><span class="text-primary">
                                                        <c:choose>
                                                            <c:when test="${u.role.name == 'ADMIN'}">Quản trị viên</c:when>
                                                            <c:when test="${u.role.name == 'OWNER'}">Chủ cửa hàng</c:when>
                                                            <c:when test="${u.role.name == 'STAFF'}">Nhân viên</c:when>
                                                            <c:otherwise>${u.role.name}</c:otherwise>
                                                        </c:choose>
                                                </span></td>
                                                <td>
                <span class="label ${u.active == 'true' ? 'label-success' : 'label-danger'} label-sm status-label">
                    <i class="fa ${u.active == 'true' ? 'fa-check' : 'fa-ban'} mr-xs"></i>
                    ${u.active == "true" ? "Active" : "Banned"}
                </span>
                                                </td>
                                            </c:if>

                                            <td>
                                                <c:if test="${sessionScope.user.role.id == 1}">
                                                <button
                                                        class="btn btn-default btn-sm mr-xs view-button"
                                                        title="Xem"
                                                        data-name="${u.name}"
                                                        data-phone="${u.phone}"
                                                        data-role="${u.role.name}"
                                                        data-status="${u.active == 'true' ? 'Active' : 'Banned'}"
                                                        data-createdAt="${u.createdAtFormatted}"
                                                        data-createdBy = "${u.createdBy}"
                                                        data-updatedAt="${u.updatedAtFormatted}"
                                                        data-updatedBy = "${u.updatedBy}"
                                                        data-userStores = "${u.userStores}"
                                                >

                                                    <i class="fa fa-eye"></i>
                                                </button>
                                                </c:if>
                                                <c:if test="${sessionScope.user.role.id == 1}">
                                                    <a href="updateuser?id=${u.id}" class="btn btn-primary btn-sm" title="Chỉnh sửa">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>
                                            </c:if>
                                                <c:if test="${sessionScope.user.role.id == 2}">
                                                    <a href="updatestaff/${u.id}" class="btn btn-primary btn-sm" title="Chỉnh sửa">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>
                                                </c:if>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                                <c:if test="${not empty userPage}">
                                <c:set var="c" value="${userPage.number}"></c:set>
                                <ul class="pagination" style="display: flex; justify-content: center; margin-leftgit:413px">
                                    <li class="page-item ${c==0 ?'disabled':''} ">
                                        <a class="page-link" href="usermanagement?page=${c==0 ? 0 : (c - 1)}&input=${input}&active=${active}&role=${roleId}">Trước</a>
                                    </li>

                                    <c:forEach begin="0" end="${userPage.totalPages - 1}" var="i">
                                        <c:if test="${i >= c - 1 && i <= c + 1}">
                                            <c:if test="${sessionScope.user.role.id == 1}">
                                            <li class="page-item ${c == i ? 'active' : ''}"><a class="page-link" href="usermanagement?page=${i}&input=${input != null ? input : ''}&active=${active != null ? active : '-1'}&role=${roleId != null ? roleId : '-1'}">${i + 1}</a>

                                            </c:if>
                                            <c:if test="${sessionScope.user.role.id == 2}">
                                                <li class="page-item ${c == i ? 'active' : ''}"><a class="page-link" href="usermanagement?page=${i}&input=${input != null ? input : ''}&storeId=${storeId != null ? storeId : '-1'}">${i + 1}</a>

                                            </c:if>


                                            </li>
                                        </c:if>

                                    </c:forEach>
                                    <c:if test="${i == c- 2 || i == c+ 2}">
                                        <li><span>...</span></li>
                                    </c:if>

                                    <li class="page-item ${c== userPage.totalPages -1?'disabled':''} ">
                                        <c:if test="${sessionScope.user.role.id == 1}">
                                        <a class="page-link" href="usermanagement?page=${c== userPage.totalPages -1? userPage.totalPages -1: (c + 1)}&input=${input}&active=${active}&role=${roleId}">Sau</a>
                                        </c:if>
                                        <c:if test="${sessionScope.user.role.id == 2}">
                                            <a class="page-link" href="usermanagement?page=${c== userPage.totalPages -1? userPage.totalPages -1: (c + 1)}&input=${input}&storeId=${storeId}">Sau</a>
                                        </c:if>

                                    </li>

                                </ul>
                                </c:if>

                            </div>
                            </c:if>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </div>
</section>



<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" style="margin-top:330px">
            <div class="modal-header">
                <h4 class="modal-title" id="userModalLabel">
                    <i class="fa fa-user-circle mr-xs"></i> Thông tin chi tiết
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="user-info">
                    <div class="info-group">
                        <label><i class="fa fa-user mr-xs"></i> Tên:</label>
                        <span id="modal-name" class="info-value"></span>
                    </div>
                    <div class="info-group">
                        <label><i class="fa fa-phone mr-xs"></i> Số điện thoại:</label>
                        <span id="modal-phone" class="info-value"></span>
                    </div>
                    <div class="info-group">
                        <label><i class="fa fa-users mr-xs"></i> Vai trò:</label>
                        <span id="modal-role" class="info-value"></span>
                    </div>
                    <div class="info-group">
                        <label><i class="fa fa-check-circle mr-xs"></i> Trạng thái:</label>
                        <span id="modal-status" class="info-value"></span>
                    </div>
                    <div class="info-group">
                        <label><i class="fa fa-calendar mr-xs"></i> Tạo ngày:</label>
                        <span id="modal-createdAt" class="info-value"></span>
                    </div>
                    <div class="info-group">
                        <label><i class="fa fa-user-plus mr-xs"></i> Tạo bởi:</label>
                        <span id="modal-createdBy" class="info-value"></span>
                    </div>
                    <div class="info-group">
                        <label><i class="fa fa-calendar-plus-o mr-xs"></i> Cập nhật ngày:</label>
                        <span id="modal-updatedAt" class="info-value"></span>
                    </div>
                    <div class="info-group">
                        <label><i class="fa fa-user-plus mr-xs"></i> Cập nhật bởi:</label>
                        <span id="modal-updatedBy" class="info-value"></span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">
                    <i class="fa fa-times mr-xs"></i>Đóng
                </button>
            </div>
        </div>
    </div>
</div>


<!-- Đoạn mã JavaScript của bạn -->

<script src="/client/auth/assets/vendor/jquery/jquery.js"></script>
<script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>

<script>
    $(document).ready(function() {
        $('.view-button').on('click', function() {
            const name = $(this).data('name');
            const phone = $(this).data('phone');
            let role = $(this).data('role');
            if(role === "ADMIN") role = "Quản trị viên";
            else if(role === "OWNER") role = "Chủ cửa hàng";
            else role = "Nhân viên";

            const createdAt = $(this).attr('data-createdAt');
            const updatedAt = $(this).attr('data-updatedAt');


            const status = $(this).data('status');
         //   const createdAt = $(this).data('createdAt');
            const createdBy = $(this).data('createdBy');
          //  const updatedAt = $(this).data('updatedAt');
            const updatedBy = $(this).data('updatedBy');
            const userStores = $(this).data('userStores');

            $('#modal-name').text(name);
            $('#modal-phone').text(phone);
            $('#modal-role').text(role);
            $('#modal-status').text(status);
            $('#modal-createdAt').text(createdAt);
            $('#modal-createdBy').text(createdBy);
            $('#modal-updatedAt').text(updatedAt);
            $('#modal-updatedBy').text(updatedBy);


            $('#userModal').modal('show');
        });
    });
    document.getElementById("search-input").addEventListener("keypress",function(event){
        if(event.key === "Enter"){
            event.preventDefault();
            document.getElementById("search-form").submit();
        }
    });
    function filterByStore(value) {
        const url = new URL(window.location.href);//lay doi tuong url hien tai
        url.searchParams.delete('page');
        url.searchParams.set('storeId', value); // Luôn cập nhật giá trị status
        url.searchParams.delete('input'); // Nếu input rỗng/null thì xóa khỏi URL
        url.searchParams.delete('page'); // Nếu input rỗng/null thì xóa khỏi URL


        window.location.href = url.toString(); // Điều hướng đến URL mới
    }
    function filterByStatus(value) {
        const url = new URL(window.location.href);//lay doi tuong url hien tai
        url.searchParams.delete('page');
        url.searchParams.set('status', value); // Luôn cập nhật giá trị status
        url.searchParams.delete('input'); // Nếu input rỗng/null thì xóa khỏi URL
        url.searchParams.delete('page'); // Nếu input rỗng/null thì xóa khỏi URL


        window.location.href = url.toString(); // Điều hướng đến URL mới
    }
</script>




<script src="/client/auth/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="/client/auth/assets/vendor/nanoscroller/nanoscroller.js"></script>
<script src="/client/auth/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="/client/auth/assets/vendor/magnific-popup/magnific-popup.js"></script>
<script src="/client/auth/assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

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
<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="fixed">
<head>
    <!-- Basic -->
    <meta charset="UTF-8" />
    <title>Tạo nhân viên mới | JSOFT Admin</title>
    <meta name="keywords" content="HTML5 Admin Template" />
    <meta
      name="description"
      content="JSOFT Admin - Responsive HTML5 Template"
    />
    <meta name="author" content="JSOFT.net" />

    <!-- Mobile Metas -->
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
    />

    <!-- Web Fonts  -->
    <link
      href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light"
      rel="stylesheet"
      type="text/css"
    />

    <!-- Vendor CSS -->
    <link
      rel="stylesheet"
      href="/client/auth/assets/vendor/bootstrap/css/bootstrap.css"
    />
    <link
      rel="stylesheet"
      href="/client/auth/assets/vendor/font-awesome/css/font-awesome.css"
    />
    <link
      rel="stylesheet"
      href="/client/auth/assets/vendor/magnific-popup/magnific-popup.css"
    />
    <link
      rel="stylesheet"
      href="/client/auth/assets/vendor/bootstrap-datepicker/css/datepicker3.css"
    />

    <!-- Specific Page Vendor CSS -->
    <link
      rel="stylesheet"
      href="/client/auth/assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css"
    />
    <link
      rel="stylesheet"
      href="/client/auth/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css"
    />
    <link
      rel="stylesheet"
      href="/client/auth/assets/vendor/morris/morris.css"
    />

    <!-- Theme CSS -->
    <link rel="stylesheet" href="/client/auth/assets/stylesheets/theme.css" />

    <!-- Skin CSS -->
    <link
      rel="stylesheet"
      href="/client/auth/assets/stylesheets/skins/default.css"
    />

    <!-- Theme Custom CSS -->
    <link
      rel="stylesheet"
      href="/client/auth/assets/stylesheets/theme-custom.css"
    />

    <!-- Head Libs -->
    <script src="/client/auth/assets/vendor/modernizr/modernizr.js"></script>

    <style>
      /* Card styles */
      .info-card {
        background: white;
        border-radius: 12px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
        margin-bottom: 15px;
        padding: 0;
        overflow: hidden;
      }

      .card-header {
        background: #f8f9fa;
        padding: 15px 20px;
        border-bottom: 1px solid #e9ecef;
      }

      .card-header h3 {
        color: #2c3e50;
        font-size: 16px;
        margin: 0;
        display: flex;
        align-items: center;
        gap: 8px;
      }

      .card-header h3 i {
        color: #0088cc;
      }

      .card-body {
        padding: 15px;
      }

      /* Staff info styles */
      .staff-info {
        display: flex;
        flex-wrap: wrap;
        gap: 15px;
        margin-bottom: 0;
      }

      .info-item {
        flex: 1;
        min-width: 250px;
        padding: 12px;
        background: #f8f9fa;
        border-radius: 8px;
        border: 1px solid #e9ecef;
      }

      .info-item-label {
        color: #6c757d;
        font-size: 13px;
        margin-bottom: 5px;
      }

      .info-item-value {
        color: #2c3e50;
        font-weight: 500;
        font-size: 15px;
      }

      /* Table styles */
      .custom-table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
      }

      .custom-table th {
        background-color: #f8f9fa;
        color: #495057;
        font-weight: 600;
        padding: 15px;
        font-size: 14px;
        border-bottom: 2px solid #e9ecef;
      }

      .custom-table td {
        padding: 12px 15px;
        vertical-align: middle;
        border-bottom: 1px solid #e9ecef;
        font-size: 14px;
        color: #2c3e50;
      }

      .custom-table tr:hover {
        background-color: #f8f9fa;
      }

      /* Toggle switch styles */
      .switch {
        position: relative;
        display: inline-block;
        width: 40px;
        height: 22px;
        margin: 0;
      }

      .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #e9ecef;
        transition: 0.3s;
        border-radius: 22px;
      }

      .slider:before {
        position: absolute;
        content: "";
        height: 16px;
        width: 16px;
        left: 3px;
        bottom: 3px;
        background-color: white;
        transition: 0.3s;
        border-radius: 50%;
      }

      input:checked + .slider {
        background-color: #0088cc;
      }

      input:checked + .slider:before {
        transform: translateX(18px);
      }

      .status-text {
        margin-left: 10px;
        font-weight: 500;
        font-size: 14px;
      }

      .status-text.active {
        color: #0088cc;
      }

      .status-text.inactive {
        color: #6c757d;
      }

      /* Thêm hiệu ứng hover cho switch */
      .switch:hover .slider {
        box-shadow: 0 0 3px rgba(0, 136, 204, 0.3);
      }

      .switch:hover input:checked + .slider {
        background-color: #006da3;
      }

      /* Add store section */
      .add-store-section {
        background: white;
        border-radius: 12px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
        overflow: hidden;
        margin-top: 15px;
      }

      .store-list {
        max-height: 300px;
        overflow-y: auto;
        padding: 0 20px;
      }

      .store-item {
        display: flex;
        align-items: center;
        padding: 12px;
        border-bottom: 1px solid #e9ecef;
        transition: background-color 0.2s;
      }

      .store-item:hover {
        background-color: #f8f9fa;
      }

      .store-item input[type="checkbox"] {
        width: 18px;
        height: 18px;
        margin-right: 12px;
        cursor: pointer;
      }

      .store-item label {
        margin: 0;
        font-size: 14px;
        color: #2c3e50;
        cursor: pointer;
        flex: 1;
      }

      .btn-container {
        padding: 20px;
        background: #f8f9fa;
        border-top: 1px solid #e9ecef;
        text-align: center;
      }

      .btn-confirm {
        background: #0088cc;
        color: white;
        padding: 10px 30px;
        border-radius: 6px;
        border: none;
        font-weight: 500;
        font-size: 14px;
        display: inline-flex;
        align-items: center;
        gap: 8px;
        transition: all 0.3s;
      }

      .btn-confirm:hover {
        background: #006da3;
        transform: translateY(-1px);
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      }

      .btn-confirm:active {
        transform: translateY(0);
      }

      /* Alert styles */
      .alert {
        border-radius: 8px;
        margin: 0 0 15px;
        padding: 12px 15px;
        border: none;
        display: flex;
        align-items: center;
        gap: 10px;
      }

      .alert-success {
        background-color: #d4edda;
        color: #155724;
      }

      .alert-danger {
        background-color: #f8d7da;
        color: #721c24;
      }

      .alert .close {
        font-size: 20px;
        opacity: 0.5;
        transition: opacity 0.3s;
      }

      .alert .close:hover {
        opacity: 0.75;
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
                <h2>
              <a
                href="/usermanagement"
                style="color: inherit; text-decoration: none"
              >
                <i class="fa fa-arrow-left mr-xs" style="cursor: pointer"></i>
              </a>
              Chỉnh sửa nhân viên
                </h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                <li><span></span></li>
                    </ol>

              <a class="sidebar-right-toggle" data-open="sidebar-right"
                ><i class="fa fa-chevron-left"></i
              ></a>
                </div>
            </header>

          <!-- start: page -->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel" style="margin-top: -72px;">
                        <header class="panel-heading">
                            <div class="panel-actions"></div>
                  <h2 class="panel-title"></h2>
                        </header>
                        <div class="panel-body">
                  <!-- Alerts -->
                  <c:if test="${not empty success}">
                    <div class="alert alert-success">
                      <i class="fa fa-check-circle"></i>
                      ${success}
                      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    </div>
                  </c:if>
                  <c:if test="${not empty error}">
                    <div class="alert alert-danger">
                      <i class="fa fa-exclamation-circle"></i>
                      ${error}
                      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    </div>
                  </c:if>

                  <!-- Staff Info Card -->
                  <div class="info-card">
                    <div class="card-header">
                      <h3>
                        <i class="fa fa-user"></i>
                        Thông tin nhân viên: ${user.name}
                      </h3>
                    </div>
                    <div class="card-body">
                      <div class="staff-info">
                        <div class="info-item">
                          <div class="info-item-label">Số điện thoại</div>
                          <div class="info-item-value">${user.phone}</div>
                        </div>
                        <div class="info-item">
                          <div class="info-item-label">Ngày tạo</div>
                          <div class="info-item-value">${user.createdAtFormatted}</div>
                        </div>
                        <div class="info-item">
                          <div class="info-item-label">Cập nhật lần cuối</div>
                          <div class="info-item-value">${user.updatedAtFormatted}</div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <!-- Store Access Card -->
                  <div class="info-card">
                    <div class="card-header">
                      <h3>
                        <i class="fa fa-key"></i>
                        Quyền truy cập cửa hàng
                      </h3>
                    </div>
                    <div class="card-body">
                      <table class="custom-table">
                                        <thead>
                                        <tr>
                            <th>Tên cửa hàng</th>
                            <th style="width: 150px;">Trạng thái</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="userStore" items="${user.userStores}">
                                            <tr>
                                                <td>${userStore.store.name}</td>
                                                <td>
                                <div style="display: flex; align-items: center">
                                  <label class="switch">
                                    <input type="checkbox"
                                    name="accessStoreStatus_${userStore.id}"
                                    ${userStore.accessStoreStatus == 'ACCESSED' ? 'checked' : ''}
                                    onchange="updateUserStoreAccess('${user.id}', '${userStore.id}', this)">
                                    <span class="slider"></span>
                                  </label>
                                  <span class="status-text ${userStore.accessStoreStatus == 'ACCESSED' ? 'active' : 'inactive'}">
                                    ${userStore.accessStoreStatus == 'ACCESSED' ? 'Truy cập' : 'Cấm'}
                                  </span>
                                </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                    </div>
                  </div>

                  <!-- Add Store Card -->
<c:if test="${not empty stores}">
                  <div class="add-store-section">
                    <div class="card-header">
                      <h3>
                        <i class="fa fa-plus-circle"></i>
                        Thêm cửa hàng mới
                      </h3>
                    </div>
                    <form action="/savestore" method="get">
                      <input type="hidden" name="userId" value="${user.id}">
                      <div class="store-list">
                        <c:forEach var="store" items="${stores}">
                          <div class="store-item">
                            <input type="checkbox" name="selectedStores" value="${store.id}" id="store_${store.id}">
                            <label for="store_${store.id}">${store.name}</label>
                          </div>
                        </c:forEach>
                      </div>
                      <div class="btn-container">
                        <button type="submit" class="btn-confirm">
                          <i class="fa fa-check"></i>
                          <span>Xác nhận thêm cửa hàng</span>
                        </button>
                      </div>
                                </form>
                  </div>
</c:if>
                        </div>
                    </section>
                </div>
            </div>
          <!-- end: page -->
        </section>
    </div>
</section>

<script>
      function updateUserStoreAccess(userId, userStoreId, checkbox) {
        const status = checkbox.checked ? "ACCESSED" : "ACCESSDENY";
        const statusText = checkbox.parentElement.nextElementSibling;

        // Log để debug
        console.log("Updating access:", {
          userId: userId,
          userStoreId: userStoreId,
          status: status,
        });

        // Gửi request
        window.location.href =
          "/updatestatus?" +
          "userId=" +
          userId +
          "&userStoreId=" +
          userStoreId +
          "&status=" +
          status;
      }
</script>

    <!-- Vendor -->
<script src="/client/auth/assets/vendor/jquery/jquery.js"></script>
    <script src="/client/auth/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>
<script src="/client/auth/assets/vendor/nanoscroller/nanoscroller.js"></script>
<script src="/client/auth/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="/client/auth/assets/vendor/magnific-popup/magnific-popup.js"></script>
<script src="/client/auth/assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

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

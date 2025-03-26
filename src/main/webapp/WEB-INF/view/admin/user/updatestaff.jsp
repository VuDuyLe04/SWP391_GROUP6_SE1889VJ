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
        width: 36px;
        height: 20px;
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
        border-radius: 20px;
      }

      .slider:before {
        position: absolute;
        content: "";
        height: 16px;
        width: 16px;
        left: 2px;
        bottom: 2px;
        background-color: white;
        transition: 0.3s;
        border-radius: 50%;
      }

      input:checked + .slider {
        background-color: #0088cc;
      }

      input:checked + .slider:before {
        transform: translateX(16px);
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

      /* Staff Info Card Styles */
      .info-card {
        background: white;
        border-radius: 12px;
        box-shadow: 0 2px 15px rgba(0,0,0,0.08);
        margin-bottom: 25px;
        overflow: hidden;
      }

      .staff-header {
        background: linear-gradient(135deg, #0088cc, #004d73);
        padding: 25px;
        border-bottom: none;
      }

      .staff-main-info {
        display: flex;
        align-items: center;
        gap: 15px;
      }

      .staff-avatar {
        width: 40px;
        height: 40px;
        background: rgba(0,136,204,0.1);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .staff-avatar i {
        font-size: 20px;
        color: #0088cc;
      }

      .staff-details h3 {
        color: #2c3e50;
        font-size: 16px;
        margin: 0 0 5px 0;
        font-weight: 600;
      }

      .staff-meta {
        display: flex;
        gap: 15px;
        color: #6c757d;
        font-size: 13px;
      }

      .staff-meta span {
        display: flex;
        align-items: center;
        gap: 5px;
      }

      .staff-meta i {
        color: #0088cc;
        font-size: 13px;
      }

      /* Form Styles */
      .staff-form {
        padding: 8px;
      }

      .form-grid {
        display: grid;
        grid-template-columns: 1.2fr 1.2fr 0.6fr;
        gap: 15px;
        margin-bottom: 15px;
        align-items: flex-end;
      }

      .form-group {
        margin-bottom: 0;
      }

      .form-group label {
        display: flex;
        align-items: center;
        gap: 8px;
        color: #344767;
        font-weight: 600;
        margin-bottom: 10px;
        font-size: 14px;
          margin-left: -9px;
      }

      .form-group label i {
        color: #0088cc;
      }

      .input-wrapper {
        position: relative;
      }

      .form-control {
        height: 35px;
        font-size: 13px;
        padding: 8px 12px;
      }

      .form-control:focus {
        border-color: #0088cc;
        box-shadow: 0 0 0 3px rgba(0,136,204,0.15);
      }

      .error-message {
        color: #dc3545;
        font-size: 13px;
        margin-top: 5px;
      }

      /* Status Toggle Styles */
      .status-wrapper {
        display: flex;
        align-items: center;
        gap: 15px;
        height: 35px;
          margin-left: 10px;
      }

      .switch {
        position: relative;
        display: inline-block;
        width: 36px;
        height: 20px;
      }

      .switch input {
        opacity: 0;
        width: 0;
        height: 0;
      }

      .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #e9ecef;
        transition: .4s;
        border-radius: 20px;
      }

      .slider:before {
        position: absolute;
        content: "";
        height: 16px;
        width: 16px;
        left: 2px;
        bottom: 2px;
        background-color: white;
        transition: .4s;
        border-radius: 50%;
      }

      input:checked + .slider {
        background-color: #0088cc;
      }

      input:checked + .slider:before {
        transform: translateX(16px);
      }

      .status-text {
        font-size: 14px;
        font-weight: 500;
      }

      .status-text.active {
        color: #0088cc;
      }

      .status-text.inactive {
        color: #6c757d;
      }

      /* Form Actions */
      .form-actions {
        padding-top: 20px;
        border-top: 1px solid #e9ecef;
        text-align: right;
      }

      .btn-submit {
        height: 35px;
        padding: 0 15px;
        font-size: 13px;
        background: #0088cc;
        color: white;
        border: none;
        border-radius: 6px;
        display: inline-flex;
        align-items: center;
        gap: 6px;
        cursor: pointer;
        transition: all 0.3s ease;
        margin-top: 2px;
      }

      .btn-submit:hover {
        background: #006da3;
        transform: translateY(-1px);
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      }

      /* Alert Styles */
      .alert {
        margin-top: 20px;
        border-radius: 8px;
        border-left: 4px solid;
      }

      .alert-success {
        background-color: #d4edda;
        color: #155724;
        border-left-color: #28a745;
      }

      /* Responsive Design */
      @media (max-width: 768px) {
        .form-grid {
          grid-template-columns: 1fr;
        }
        
        .staff-main-info {
          flex-direction: column;
          text-align: center;
        }
        
        .staff-meta {
          flex-direction: column;
          gap: 5px;
        }
        
        .action-group {
          margin-top: 10px;
        }
      }

      /* Style cho nút submit */
      .action-group {
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
        padding-bottom: 0;
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



                  <!-- Staff Info Card -->
                  <div class="info-card">
                    <div class="card-header">
                        <div class="staff-main-info">
                            <div class="staff-avatar">
                                <i class="fa fa-user-circle"></i>
                            </div>
                            <div class="staff-details">
                                <h3>${user.name}</h3>
                                <div class="staff-meta">
                                    <span><i class="fa fa-calendar-plus-o"></i> Ngày tạo: ${user.createdAtFormatted}</span>
                                    <span><i class="fa fa-refresh"></i> Cập nhật: ${user.updatedAtFormatted}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card-body">
                        <form action="/updatestatus" method="get" class="staff-form">
                            <input type="hidden" name="userId" value="${user.id}">
                            
                            <div class="form-grid">
                                <div class="form-group">
                                    <label for="phone">
                                        <i class="fa fa-phone"></i>
                                        Số điện thoại
                                    </label>
                                    <div class="input-wrapper">
                                        <input type="text"
                                               id="phone"
                                               name="phone"
                                               class="form-control"
                                               placeholder="Nhập số điện thoại"
                                               value="${user.phone}"
                                               onblur="checkPhone(this.value)">
                                        <div class="error-message" id="phoneError">${error}</div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>
                                        <i class="fa fa-toggle-on"></i>
                                        Trạng thái tài khoản
                                    </label>
                                    <div class="status-wrapper">
                                        <label class="switch">
                                            <input type="checkbox" id="activeSwitch"
                                                   name="active"
                                                   value="true"
                                            ${user.active ? 'checked' : ''}>

                                            <span class="slider round"></span>
                                        </label>

                                        <span id="statusText" class="status-text ${user.active ? 'active' : 'inactive'}">
                                            ${user.active ? 'Đang hoạt động' : 'Ngừng hoạt động'}
                                        </span>
                                    </div>

                                </div>

                                <div class="form-group action-group">
                                    <label style="visibility: hidden;">
                                        <i class="fa fa-save"></i>
                                        Action
                                    </label>
                                    <button type="submit" class="btn-submit">
                                        <i class="fa fa-save"></i>
                                        Lưu thay đổi
                                    </button>
                                </div>
                            </div>
                        </form>

                        <c:if test="${not empty success}">
                            <div class="alert alert-success fade in">
                                <i class="fa fa-check-circle"></i>
                                ${success}
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            </div>
                        </c:if>
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

    function checkPhone(phone) {
        const phoneRegex = /^[0-9]{10}$/; // Kiểm tra số điện thoại có đúng 10 chữ số
        const phoneError = document.getElementById("phoneError");
        const button = document.getElementById("submitBtn");

        if (phone.length > 0 && !phoneRegex.test(phone.trim())) {
            phoneError.textContent = "Số điện thoại không hợp lệ. Vui lòng nhập đúng 10 chữ số!";
            phoneError.style.display = "block";
            button.disabled = true;
        }
    }


        document.getElementById("activeSwitch").addEventListener("change", function() {
        let statusText = document.getElementById("statusText");
        if (this.checked) {
        statusText.textContent = "Đang hoạt động";
        statusText.classList.remove("inactive");
        statusText.classList.add("active");
    } else {
        statusText.textContent = "Ngừng hoạt động";
        statusText.classList.remove("active");
        statusText.classList.add("inactive");
    }
    });


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

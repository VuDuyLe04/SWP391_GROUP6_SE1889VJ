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
      /* Toggle switch styles */
      .switch {
        position: relative;
        display: inline-block;
        width: 28px; /* Reduced size */
        height: 16px; /* Reduced size */
        margin: 0;
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
        background-color: #ccc;
        transition: 0.4s;
        border-radius: 16px;
      }

      .slider:before {
        position: absolute;
        content: "";
        height: 12px; /* Reduced size */
        width: 12px; /* Reduced size */
        left: 2px;
        bottom: 2px;
        background-color: white;
        transition: 0.4s;
        border-radius: 50%;
      }

      input:checked + .slider {
        background-color: #0088cc;
      }

      input:checked + .slider:before {
        transform: translateX(12px); /* Adjusted for new size */
      }

      .status-text {
        margin-left: 5px;
        font-weight: 500;
        font-size: 11px; /* Smaller font */
      }

      /* Button container styles */
      .button-container {
        text-align: center;
        margin-top: 20px;
        padding: 10px 0;
        display: flex;
        justify-content: center;
        gap: 10px;
      }

      .btn {
        display: inline-flex;
        align-items: center;
        gap: 5px;
        padding: 6px 12px;
      }

      /* Table styles */
      .store-table {
        margin-top: 20px;
        border: 1px solid #e5e5e5;
        border-radius: 5px;
        overflow: hidden;
      }

      .store-table th {
        background-color: #f7f7f7;
        border-bottom: 2px solid #e5e5e5;
        padding: 8px 12px;
        font-weight: 600;
      }

      .store-table td {
        padding: 6px 12px;
        vertical-align: middle;
        border-bottom: 1px solid #e5e5e5;
      }

      .store-table tbody tr:hover {
        background-color: #f9f9f9;
      }

      .store-section {
        background: white;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
      }

      .section-title {
        font-size: 16px;
        font-weight: 600;
        margin-bottom: 15px;
        color: #333;
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
              <section class="panel">
                <header class="panel-heading">
                  <div class="panel-actions"></div>
                  <h2 class="panel-title"></h2>
                </header>
                <div class="panel-body">
                  <h3>Thông Tin Nhân Viên</h3>
                  <table class="table table-bordered">
                    <tr>
                      <th>Tên Nhân Viên</th>
                      <td>${user.name}</td>
                    </tr>
                    <tr>
                      <th>Số Điện Thoại</th>
                      <td>${user.phone}</td>
                    </tr>
                    <tr>
                      <th>Ngày tạo</th>
                      <td>${user.createdAtFormatted}</td>
                    </tr>
                    <tr>
                      <th>Ngày chỉnh sửa</th>
                      <td>${user.updatedAtFormatted}</td>
                    </tr>
                  </table>

                  <!-- Bảng danh sách cửa hàng -->
                  <h3>Chỉnh sửa quyền truy cập các cửa hàng</h3>
                  <form action="updateUserStores" method="post">
                    <input type="hidden" name="userId" value="${user.id}" />
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                          <th>Tên Cửa Hàng</th>
                          <th>Trạng Thái Truy Cập</th>
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
                                  value="ACCESSED" ${userStore.accessStoreStatus
                                  == 'ACCESSED' ? 'checked' : ''}
                                  onchange="updateStatusText(this)">
                                  <span class="slider"></span>
                                </label>
                                <span class="status-text">
                                  ${userStore.accessStoreStatus == 'ACCESSED' ?
                                  'Truy cập' : 'Cấm'}
                                </span>
                              </div>
                            </td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                    <div class="button-container">
                      <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save"></i> Lưu trạng thái
                      </button>
                      <button
                        type="button"
                        class="btn btn-success"
                        onclick="window.location.href='/createstore'"
                      >
                        <i class="fa fa-plus"></i> Thêm cửa hàng
                      </button>
                    </div>
                  </form>
                </div>
              </section>
            </div>
          </div>
          <!-- end: page -->
        </section>
      </div>
    </section>

    <script>
      function checkPhone(phone) {
        const phoneRegex = /^[0-9]{10}$/;
        const phoneError = document.getElementById("phoneError");
        const button = document.getElementById("submitBtn");

        if (phone.length > 0 && !phoneRegex.test(phone.trim())) {
          phoneError.textContent =
            "Số điện thoại không hợp lệ. Vui lòng nhập đúng 10 chữ số!";
          button.disabled = true;
        } else {
          phoneError.textContent = "";
          button.disabled = false;
        }
      }

      function checkPassword() {
        const password = document.getElementById("password").value;
        const passError = document.getElementById("passError");
        const button = document.getElementById("submitBtn");
        const passRegex =
          /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}/;

        if (password.length > 0 && !passRegex.test(password)) {
          passError.textContent =
            "Mật khẩu không hợp lệ. Mật khẩu phải có ít nhất 8 ký tự, gồm chữ hoa, chữ thường, số và ký tự đặc biệt!";
          button.disabled = true;
        } else {
          passError.textContent = "";
          button.disabled = false;
        }
      }

      function checkRePassword() {
        const password = document.getElementById("password").value;
        const repassword = document.getElementById("repassword").value;
        const repassError = document.getElementById("repassError");
        const button = document.getElementById("submitBtn");

        if (repassword.length > 0 && password !== repassword) {
          repassError.textContent =
            "Mật khẩu không khớp. Xin vui lòng nhập lại!";
          button.disabled = true;
        } else {
          repassError.textContent = "";
          button.disabled = false;
        }
      }

      function checkName() {
        const name = document.getElementById("name").value.trim();
        const nameError = document.getElementById("nameError");
        const button = document.getElementById("submitBtn");
        const nameRegex = /^[a-zA-ZÀ-ỹ\s]+$/;

        if (name.length > 0 && !nameRegex.test(name.trim())) {
          nameError.textContent =
            "Tên không được chứa số và các kí tự đặc biệt!";
          button.disabled = true;
        } else {
          nameError.textContent = "";
          button.disabled = false;
        }
      }

      function updateStatusText(checkbox) {
        const statusText = checkbox.parentElement.nextElementSibling;
        statusText.textContent = checkbox.checked
          ? "Đã truy cập"
          : "Chưa truy cập";
        checkbox.value = checkbox.checked ? "ACCESSED" : "NOT_ACCESSED";
      }

      document
        .getElementById("submitBtn")
        .addEventListener("click", function (event) {
          let isValid = true;
          let phone = document.getElementById("phone").value.trim();
          let password = document.getElementById("password").value.trim();
          let repassword = document.getElementById("repassword").value.trim();
          let name = document.getElementById("name").value.trim();

          document.getElementById("phoneError").textContent = "";
          document.getElementById("passError").textContent = "";
          document.getElementById("repassError").textContent = "";
          document.getElementById("nameError").textContent = "";

          if (phone === "") {
            document.getElementById("phoneError").textContent =
              "Vui lòng nhập số điện thoại!";
            isValid = false;
          }

          if (password === "") {
            document.getElementById("passError").textContent =
              "Vui lòng nhập mật khẩu!";
            isValid = false;
          }

          if (repassword === "") {
            document.getElementById("repassError").textContent =
              "Vui lòng nhập lại mật khẩu!";
            isValid = false;
          }

          if (name === "") {
            document.getElementById("nameError").textContent =
              "Vui lòng nhập tên!";
            isValid = false;
          }

          if (!isValid) {
            event.preventDefault();
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

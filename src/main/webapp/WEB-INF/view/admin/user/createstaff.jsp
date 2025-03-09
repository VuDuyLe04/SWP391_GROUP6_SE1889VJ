<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="fixed" style="overflow: hidden">
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
            background: linear-gradient(145deg, #ffffff 0%, #f8f9fa 100%);
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
            padding: 1.5rem;
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(0, 136, 204, 0.1);
            max-width: 550px;
            margin: 15px auto;
        }

        .panel-featured-primary::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: linear-gradient(90deg, #0088cc, #00a3cc, #0088cc);
            background-size: 200% 100%;
            animation: gradientMove 3s ease infinite;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .panel-featured-primary form {
            max-width: 100%;
            margin: 0 auto;
            padding: 10px;
        }

        .panel-featured-primary input[type="text"],
        .panel-featured-primary input[type="password"] {
            width: 100%;
            padding: 10px 14px;
            margin: 4px 0 12px;
            border: 2px solid #e4e9f2;
            border-radius: 10px;
            font-size: 14px;
            transition: all 0.3s ease;
            background: #ffffff;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.02);
        }

        .panel-featured-primary input:focus {
            border-color: #0088cc;
            box-shadow: 0 0 0 4px rgba(0, 136, 204, 0.1);
            outline: none;
            transform: translateY(-1px);
        }

        .panel-featured-primary label {
            display: block;
            margin-bottom: 4px;
            color: #2c3345;
            font-weight: 600;
            font-size: 13px;
            letter-spacing: 0.3px;
        }

        /* Status toggle styles */
        .panel-featured-primary .status-toggle {
            background: linear-gradient(145deg, #f8f9fa 0%, #ffffff 100%);
            padding: 15px;
            border-radius: 12px;
            border: 2px solid #e4e9f2;
            margin: 15px 0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
        }

        /* Checkbox style */
        .panel-featured-primary input[type="checkbox"] {
            width: 52px;
            height: 28px;
            position: relative;
            appearance: none;
            background: #e4e9f2;
            border-radius: 28px;
            cursor: pointer;
            transition: 0.4s;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .panel-featured-primary input[type="checkbox"]:checked {
            background: linear-gradient(135deg, #0088cc 0%, #00a3cc 100%);
        }

        .panel-featured-primary input[type="checkbox"]::after {
            content: '';
            position: absolute;
            top: 2px;
            left: 2px;
            width: 24px;
            height: 24px;
            background: #fff;
            border-radius: 50%;
            transition: 0.4s cubic-bezier(0.68, -0.55, 0.265, 1.55);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .panel-featured-primary input[type="checkbox"]:checked::after {
            left: 26px;
            background: #fff;
        }

        /* Select style */
        .panel-featured-primary select {
            width: 180px;
            padding: 8px 14px;
            border: 2px solid #e4e9f2;
            border-radius: 15px;
            background: #fff;
            font-size: 14px;
            color: #2c3345;
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='%230088cc' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: calc(100% - 15px) center;
            padding-right: 40px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.02);
        }

        .panel-featured-primary select:focus {
            border-color: #0088cc;
            box-shadow: 0 0 0 4px rgba(0, 136, 204, 0.1);
            outline: none;
            transform: translateY(-1px);
        }

        /* Error messages */
        .panel-featured-primary .error-message {
            color: #dc3545;
            font-size: 12px;
            padding: 8px 12px;
            background: linear-gradient(145deg, #fff5f7 0%, #fff 100%);
            border-radius: 12px;
            margin: 8px 0;
            border-left: 4px solid #dc3545;
            box-shadow: 0 2px 8px rgba(220, 53, 69, 0.1);
        }

        /* Submit button */
        .panel-featured-primary button[type="submit"] {
            width: 100%;
            padding: 12px 20px;
            background: linear-gradient(135deg, #0088cc 0%, #00a3cc 100%);
            color: white;
            border: none;
            border-radius: 15px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 15px;
            box-shadow: 0 6px 20px rgba(0, 136, 204, 0.15);
            letter-spacing: 0.5px;
        }

        .panel-featured-primary button[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 136, 204, 0.25);
            background: linear-gradient(135deg, #0077b3 0%, #0088cc 100%);
        }

        .panel-featured-primary button[type="submit"]:disabled {
            background: linear-gradient(145deg, #e4e9f2 0%, #f1f3f7 100%);
            color: #a0a9b8;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        /* Success message */
        .panel-featured-primary .success-message {
            color: #0ca678;
            background: linear-gradient(145deg, #e6fcf5 0%, #fff 100%);
            border-radius: 12px;
            padding: 10px 15px;
            margin-top: 15px;
            text-align: center;
            font-size: 13px;
            border-left: 4px solid #0ca678;
            box-shadow: 0 2px 8px rgba(12, 166, 120, 0.1);
        }

        /* Hover effects */
        .panel-featured-primary input:hover,
        .panel-featured-primary select:hover {
            border-color: #0088cc;
            transform: translateY(-1px);
        }

        /* Animation for focus states */
        @keyframes focusAnimation {
            0% { box-shadow: 0 0 0 0 rgba(0, 136, 204, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(0, 136, 204, 0); }
            100% { box-shadow: 0 0 0 0 rgba(0, 136, 204, 0); }
        }

        /* Status toggle container */
        .status-container {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 15px 0;
        }

        .status-container label {
            margin: 0;
            font-size: 13px;
            color: #2c3345;
        }

        /* Checkbox style */
        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 40px; /* Giảm width */
            height: 22px; /* Giảm height */
            margin: 0 8px;
        }

        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .toggle-slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #e4e9f2;
            transition: .3s;
            border-radius: 22px;
        }

        .toggle-slider:before {
            position: absolute;
            content: "";
            height: 16px; /* Giảm size của nút tròn */
            width: 16px;
            left: 3px;
            bottom: 3px;
            background-color: white;
            transition: .3s;
            border-radius: 50%;
        }

        input:checked + .toggle-slider {
            background: #0088cc;
        }

        input:checked + .toggle-slider:before {
            transform: translateX(18px); /* Điều chỉnh khoảng cách di chuyển */
        }

        /* Status label */
        .status-label {
            display: inline-block;
            font-size: 13px;
            color: #2c3345;
            margin-left: 5px;
        }

        /* Thêm style cho switch */
        .switch-status {
            position: relative;
            display: flex;
            align-items: center;
            vertical-align: middle;
            margin: 0;
            height: 34px; /* Căn chỉnh chiều cao giống form-control */
        }

        .switch-status input[type="checkbox"] {
            display: none;
        }

        .switch-status label {
            display: block;
            width: 48px;
            height: 24px;
            border-radius: 24px;
            cursor: pointer;
            background: #e6e6e6;
            transition: all 0.3s ease;
            position: relative;
            margin: 0;
        }

        .switch-status label:after {
            content: '';
            position: absolute;
            left: 2px;
            top: 2px;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: white;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .switch-status input[type="checkbox"]:checked + label {
            background: #0088cc;
        }

        .switch-status input[type="checkbox"]:checked + label:after {
            left: 26px;
        }

        .status-text {
            display: inline-block;
            margin-left: 10px;
            font-weight: 500;
            color: #444;
            line-height: 24px; /* Căn chỉnh chiều cao text */
        }

        /* Style cho select trong trường hợp role.id == 2 */
        .status-select {
            max-width: 200px;
        }

        .status-wrapper {
            display: flex;
            align-items: center;
            height: 34px; /* Căn chỉnh chiều cao giống form-control */
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
                    <a href="usermanagement" style="color: inherit; text-decoration: none;">
                        <i class="fa fa-arrow-left mr-xs" style="cursor: pointer;"></i>
                    </a>
                    Tạo nhân viên
                </h2>
                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Tạo nhân viên </span></li>
                    </ol>
                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="panel-actions"></div>
                            <h2 class="panel-title">Tạo nhân viên </h2>
                        </header>
                        <div class="panel-body">
                            <form:form action="/createstaff" method="post" modelAttribute="StaffDTO" class="form-horizontal form-bordered">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Tên nhân viên</label>
                                    <div class="col-md-6">
                                        <form:input path="name" 
                                               class="form-control"
                                               id="name"
                                               placeholder="Nhập tên nhân viên"
                                               onblur="checkName()"/>
                                        <form:errors path="name" cssClass="text-danger"/>
                                        <span class="text-danger" id="nameError">${nameError}</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Số điện thoại</label>
                                    <div class="col-md-6">
                                        <form:input path="phone"
                                               class="form-control"
                                               id="phone"
                                               placeholder="Nhập số điện thoại"
                                               onblur="checkPhone(this.value)"/>
                                        <form:errors path="phone" cssClass="text-danger"/>
                                        <span class="text-danger" id="phoneError" style="display:none">Số điện thoại không hợp lệ. Xin vui lòng nhập lại!</span>
                                        <span class="text-danger">${phoneError}</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Mật khẩu</label>
                                    <div class="col-md-6">
                                        <form:password path="password"
                                               class="form-control"
                                               id="password"
                                               placeholder="Nhập mật khẩu"
                                               onblur="checkPassword()"/>
                                        <form:errors path="password" cssClass="text-danger"/>
                                        <span class="text-danger" id="passError"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Nhập lại mật khẩu</label>
                                    <div class="col-md-6">
                                        <input type="password"
                                               class="form-control"
                                               id="repassword"
                                               name="repassword"
                                               placeholder="Nhập lại mật khẩu"
                                               onblur="checkRePassword()">
                                        <span class="text-danger" id="repassError"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Chọn cửa hàng</label>
                                    <div class="col-md-6">
                                        <form:select path="storeId" class="form-control">
                                            <form:options items="${stores}" itemValue="id" itemLabel="name"/>
                                        </form:select>
                                        <form:errors path="storeId" cssClass="text-danger"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <button type="submit" 
                                                class="btn btn-primary" 
                                                id="submitBtn" 
                                                ${success != null || error != null ? 'disabled' : ''}>
                                            Tạo nhân viên
                                        </button>
                                    </div>
                                </div>

                                <c:if test="${success != null}">
                                    <div class="form-group">
                                        <div class="col-md-6 col-md-offset-3">
                                            <div class="alert alert-success">${success}</div>
                                        </div>
                                    </div>
                                </c:if>
                            </form:form>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </div>
</section>

<script>
    function checkPhone(phone) {
        const phoneRegex = /^[0-9]{10}$/; // Kiểm tra số điện thoại có đúng 10 chữ số
        const phoneError = document.getElementById("phoneError");
        const button = document.getElementById("submitBtn");

        if (phone.length > 0 && !phoneRegex.test(phone.trim())) {
            phoneError.textContent = "Số điện thoại không hợp lệ. Vui lòng nhập đúng 10 chữ số!";
            phoneError.style.display = "block";
            button.disabled = true;
        } else {
            phoneError.style.display = "none";
            button.disabled = false;

        }
    }

    function checkPassword() {
        const password = document.getElementById("password").value;
        const passError = document.getElementById("passError");
        const button = document.getElementById("submitBtn");
        const passRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}/;

        if (password.length > 0 && !passRegex.test(password)) {
            passError.textContent = "Mật khẩu không hợp lệ. Mật khẩu phải có ít nhất 8 ký tự, gồm chữ hoa, chữ thường, số và ký tự đặc biệt!";
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
            repassError.textContent = "Mật khẩu không khớp. Xin vui lòng nhập lại!";
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

        // Biểu thức chính quy kiểm tra tên hợp lệ
        const nameRegex = /^[a-zA-ZÀ-ỹ\s]+$/;

        if (name.length > 0 && !nameRegex.test(name.trim())) {
            nameError.textContent = "Tên không đuợc chứa số và các kí tự đặc biệt! ";
            button.disabled = true;
        } else {
            nameError.textContent = "";
            button.disabled = false;
        }
    }
    document.getElementById("submitBtn").addEventListener("click", function(event) {
        let isValid = true;

        // Lấy các giá trị từ input
        let phone = document.getElementById("phone").value.trim();
        let password = document.getElementById("password").value.trim();
        let repassword = document.getElementById("repassword").value.trim();
        let name = document.getElementById("name").value.trim();

        // Xóa các thông báo lỗi cũ
        document.getElementById("phoneError").style.display = "none";
        document.getElementById("passError").innerText = "";
        document.getElementById("repassError").innerText = "";

        // Kiểm tra số điện thoại
        if (phone === "") {
            document.getElementById("phoneError").innerText = "Vui lòng nhập số điện thoại!";
            document.getElementById("phoneError").style.display = "block";
            isValid = false;
        }

        // Kiểm tra mật khẩu
        if (password === "") {
            document.getElementById("passError").innerText = "Vui lòng nhập mật khẩu!";
            isValid = false;
        }

        // Kiểm tra nhập lại mật khẩu
        if (repassword === "") {
            document.getElementById("repassError").innerText = "Vui lòng nhập lại mật khẩu!";
            isValid = false;
        }
        // Kiểm tra tên
        if (name === "") {
            document.getElementById("nameError").innerText = "Vui lòng nhập tên!";
            isValid = false;
        }

        // Nếu có lỗi, ngăn form submit
        if (!isValid) {
            event.preventDefault();
        }
    });


</script>


<!-- Đoạn mã JavaScript của bạn -->

<script src="/client/auth/assets/vendor/jquery/jquery.js"></script>
<script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>


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
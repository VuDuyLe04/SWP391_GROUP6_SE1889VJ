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
                    Chỉnh sửa người dùng
                </h2>
                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Chỉnh sửa người dùng</span></li>
                    </ol>
                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <div class="row">
                <div class="col-md-12">
                    <section class="panel panel-featured panel-featured-primary">
                        <form action="updateuser" >
                            <!-- Phone -->
                            <input
                                    type="text"
                                       hidden=""
                                    name="id"
                                    placeholder="Nhập tên"
                                    value="${useru.id != null ? useru.id : ''}"

                            >
                            <label for="phone">Số điện thoại:</label>
                            <input
                                    type="text"
                                    id="phone"
                                    name="phone"
                                    placeholder="Nhập số điện thoại"
                                    value="${useru.phone != null ? useru.phone : ''}"
<%--                                    onblur="checkPhone(this.value)"--%>
                                    onblur="checkPhone(this.value,'${useru.id}')"
                                    required
                            >

                            <p style="color: red">
                                ${error}
                            </p>
                            <p id="phoneError" style="color:red; display: none"> </p>
                            <!-- Password -->
                            <label for="password">Mật khẩu:</label>
                            <input
                                    type="password"
                                    id="password"
                                    name="password"
                                    placeholder="Nhập mật khẩu"

                                    onblur="checkPassword()"
                                    value="${useru.password != null ? useru.password : ''}"
                                    required
                            >
                            <p id="passError" style="color: red" > </p>
                            <label for="repassword">Nhập lại mật khẩu:</label>
                            <input
                                    type="password"
                                    id="repassword"
                                    name="repassword"
                                    placeholder="Nhập lại mật khẩu"
                                    onblur="checkPassword()"
                                    value="${useru.password != null ? useru.password : ''}"
                                    required
                            >
                            <p id="repassError" style="color: red"></p>

                            <!-- Name -->
                            <label for="name">Tên:</label>
                            <input
                                    type="text"
                                    id="name"
                                    name="name"
                                    placeholder="Nhập tên"
                                    value="${useru.name != null ? useru.name : ''}"
                                    required
                            >

                            <!-- Role-based Active Status -->
                            <c:if test="${sessionScope.user.role.id == 1}">
                                <div class="status-container">
                                    <label>Trạng thái:</label>
                                    <label class="toggle-switch">
                                        <input type="checkbox"  name="active"  ${useru.active == 'true' ? 'checked' : ''}>
                                        <span class="toggle-slider"></span>
                                    </label>
                                    <span class="status-label">Hoạt động</span>
                                </div>
                            </c:if>

                            <c:if test="${sessionScope.user.role.id == 2}">
                                <label for="active">Trạng thái :</label>
                                <select id="active" name="active" required>
                                    <option value="true" ${param.active == 'true' ? 'selected' : ''}>Hoạt động</option>
                                    <option value="false" ${param.active == 'false' ? 'selected' : ''}>Cấm</option>
                                </select>
                            </c:if>
                            <p style="color: limegreen">${success}</p>
                            <!-- Submit Button -->
                            <button type="submit" ${success != null ? 'disabled' : ''}>Xác nhận </button>

                        </form>

                    </section>
                </div>
            </div>
        </section>
    </div>
</section>

<script>
    function checkPhone(phone) {
        const phoneRegex = /^[0-9]{10}$/; // Kiểm tra số điện thoại có đúng 10 chữ số
        const phoneError = document.getElementById("phoneError"); // Phần tử hiển thị lỗi

        if (phone.trim() === "") {
            phoneError.textContent = "Vui lòng nhập số điện thoại!";
            phoneError.style.color = "red";
            phoneError.style.display = "block";

            return false; // Ngăn chặn submit
        }

        if (!phoneRegex.test(phone)) {
            phoneError.textContent = "Số điện thoại không hợp lệ. Vui lòng nhập đúng 10 chữ số!";
            phoneError.style.color = "red";
            phoneError.style.display = "block";

            return false; // Ngăn chặn submit
        }

        // Số điện thoại hợp lệ
        phoneError.style.display = "none"; // Ẩn thông báo lỗi
        window.location.href = "checkphone?updatedPhone=" + phone + "&id="+ id;
        return true;
    }



    function checkPassword() {
        const password = document.getElementById("password").value;
        const repassword = document.getElementById("repassword").value;

        const passError = document.getElementById("passError");
        const repassError = document.getElementById("repassError");

        const passRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}/;

        // Check if password is empty
        if (!password || password.trim() === "") {
            passError.textContent = "Vui lòng nhập mật khẩu!";
            return false;
        } else if (!passRegex.test(password)) {
            passError.textContent = "Mật khẩu không hợp lệ. Mật khẩu phải có ít nhất 8 ký tự, gồm chữ hoa, chữ thường, số và ký tự đặc biệt!";
            return false;
        } else {
            passError.textContent = "";
        }

        // Check if repassword is empty
        if (!repassword || repassword.trim() === "") {
            repassError.textContent = "Vui lòng nhập lại mật khẩu!";
            return false;
        } else if (password !== repassword) {
            repassError.textContent = "Mật khẩu không khớp. Xin vui lòng nhập lại!";
            return false;
        } else {
            repassError.textContent = "";
        }

        return true;
    }



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
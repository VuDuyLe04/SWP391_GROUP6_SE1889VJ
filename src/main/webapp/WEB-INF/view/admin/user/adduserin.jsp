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
                <h2><i class="fa fa-users mr-xs"></i> Tạo người dùng</h2>
                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Tạo người dùng</span></li>
                    </ol>
                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <div class="row">
                <div class="col-md-12">
                    <section class="panel panel-featured panel-featured-primary">
                        <form action="createuser" >
                            <!-- Phone -->
                            <label for="phone">Số điện thoại:</label>
                            <input
                                    type="text"
                                    id="phone"
                                    name="phone"
                                    placeholder="Nhập số điện thoại"

                                    value="${param.phone != null ? param.phone : ''}"
                                    onblur="checkPhone(this.value)"
                                    required
                            >

                       <p>
                           ${error}
                       </p>
                            <p id="phoneError" style="display:none"> "Số điện thoại không hợp lệ. Xin vui lòng nhập lại  "</p>
                            <!-- Password -->
                            <label for="password">Mật khẩu:</label>
                            <input
                                    type="password"
                                    id="password"
                                    name="password"
                                    placeholder="Nhập mật khẩu"
                                    onblur="checkPassword()"
                                    value="${param.password != null ? param.password : ''}"
                                    required
                            >
                            <label for="repassword">Nhập lại mật khẩu:</label>
                            <input
                                    type="password"
                                    id="repassword"
                                    name="repassword"
                                    placeholder="Nhập lại mật khẩu"
                                    onblur="checkPassword()"
                                    value="${param.repassword != null ? param.repassword : ''}"
                                    required
                            >
<p id="repassError" ></p>
                            <p id="passError" > </p>
                            <!-- Name -->
                            <label for="name">Tên:</label>
                            <input
                                    type="text"
                                    id="name"
                                    name="name"
                                    placeholder="Nhập tên"
                                    value="${param.name != null ? param.name : ''}"
                                    required
                            >

                            <!-- Role-based Active Status -->
                            <c:if test="${sessionScope.user.role.id == 1}">
                                <label for="active">Hoạt động:</label><br>

                                <input
                                        type="checkbox"
                                        id="active"
                                        name="active"
                                        value="true"
                                    ${param.active == 'true' ? 'checked' : ''}
                                >


                            </c:if>

                            <c:if test="${sessionScope.user.role.id == 2}">
                                <label for="active">Trạng thái :</label>
                                <select id="active" name="active" required>
                                    <option value="true" ${param.active == 'true' ? 'selected' : ''}>Hoạt động</option>
                                    <option value="false" ${param.active == 'false' ? 'selected' : ''}>Cấm</option>
                                </select>
                            </c:if>

                            <!-- Submit Button -->
                            <button type="submit" ${success != null ? 'disabled' : ''}>Tạo </button>
                            ${success}
                        </form>

                    </section>
                </div>
            </div>
        </section>
    </div>
</section>

<script>
    function checkPhone(phone) {
        const phoneRegex = /^[0-9]{10}$/;
        if ( phoneRegex.test(phone))
        window.location.href = "checkphone?phone=" + phone;
        else{
            document.getElementById("phoneError").style.display = "block";
            return fasle; // ngan ngua submit
        }
return true;
    }


    function checkPassword() {
        const password = document.getElementById("password").value;
        const repassword = document.getElementById("repassword").value;

        const passError = document.getElementById("passError");
        const repassError = document.getElementById("repassError");

        const passRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}/;

        if (password && password.trim() !== "" && !passRegex.test(password)) {
            passError.textContent = "Mật khẩu không hợp lệ. Mật khẩu phải có ít nhất 8 ký tự, gồm chữ hoa, chữ thường, số và ký tự đặc biệt.";
            return false;
        } else {
            passError.textContent = "";
        }

        if (repassword.trim() !== "" && password !== repassword) {
            repassError.textContent = "Mật khẩu không khớp. Xin vui lòng nhập lại.";
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
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="fixed">
<head>
    <!-- Basic -->
    <meta charset="UTF-8">
    <title>Chỉnh sửa thông tin cửa hàng</title>
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
                <h2>
                    <a href="/stores" style="color: inherit; text-decoration: none;">
                        <i class="fa fa-arrow-left mr-xs" style="cursor: pointer;"></i>
                    </a>
                    Chỉnh sửa cửa hàng
                </h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Tạo mới cửa hàng</span></li>
                    </ol>

                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <!-- start: page -->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="panel-actions"></div>
                            <h2 class="panel-title">Chỉnh sửa cửa hàng</h2>
                        </header>
                        <div class="panel-body">
                            <form:form id="add-form" action="/updatestore" method="post" modelAttribute="StoreDTO" class="form-horizontal form-bordered">
                                <form:input path="id" type="hidden" />


                                <div class="form-group">
                                    <label class="col-md-3 control-label">Tên cửa hàng</label>
                                    <div class="col-md-6">
                                        <form:input path="name" class="form-control" onblur="checkName(this.value)"/>
                                        <form:errors path="name" cssClass="text-danger"/>
                                        <span class="text-danger">${nameError}</span>
                                        <span class="text-danger" id="nameError"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Địa chỉ</label>
                                    <div class="col-md-6">
                                        <form:input path="address" class="form-control" onblur="checkAddress(this.value)"/>
                                        <form:errors path="address" cssClass="text-danger"/>
                                        <span class="text-danger" id="addressError"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Trạng thái</label>
                                    <div class="col-md-6">
                                        <form:select path="status" class="form-control">
                                            <form:option value="ACTIVE">Hoạt động</form:option>
                                            <form:option value="INACTIVE">Ngừng hoạt động</form:option>
                                        </form:select>
                                        <form:errors path="status" cssClass="text-danger"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <button type="submit" class="btn btn-primary" id="submitBtn">
                                            Lưu
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
            <!-- end: page -->
        </section>
    </div>
</section>

<script>
    function checkName(name) {
        const nameError = document.getElementById("nameError");
        const button = document.getElementById("submitBtn");

        if (name.length > 100) {
            nameError.textContent = "Tên cửa hàng không được vượt quá 100 ký tự";
            button.disabled = true;
        } else {
            nameError.textContent = "";
            button.disabled = false;
        }
    }

    function checkAddress(address) {
        const addressError = document.getElementById("addressError");
        const button = document.getElementById("submitBtn");

        if (address.length > 255) {
            addressError.textContent = "Địa chỉ không được vượt quá 255 ký tự";
            button.disabled = true;
        } else {
            addressError.textContent = "";
            button.disabled = false;
        }
    }

    document.getElementById("submitBtn").addEventListener("click", function(event) {
        let isValid = true;
        let name = document.getElementById("name").value.trim();
        let address = document.getElementById("address").value.trim();
        
        document.getElementById("nameError").textContent = "";
        document.getElementById("addressError").textContent = "";

        if (name === "") {
            document.getElementById("nameError").textContent = "Vui lòng nhập tên cửa hàng!";
            isValid = false;
        }
        
        if (address === "") {
            document.getElementById("addressError").textContent = "Vui lòng nhập địa chỉ cửa hàng!";
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



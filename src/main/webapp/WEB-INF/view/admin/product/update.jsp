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
                <h2>Cập nhật sản phẩm</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Cập nhật</span></li>
                    </ol>

                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <!-- start: page -->

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="#" class="fa fa-caret-down"></a>
                                <a href="#" class="fa fa-times"></a>
                            </div>

                            <h2 class="panel-title">Cập nhật</h2>
                        </header>
                        <div class="panel-body">

                            <c:if test="${not empty message}">
                                <div class="alert alert-success">
                                        ${message}
                                </div>
                            </c:if>

                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-error">
                                        ${errorMessage}
                                </div>
                            </c:if>

                            <form:form method="post" id="updateproduct" modelAttribute="product" action="/update">
                                <form:hidden path="storeId" id="hiddenStoreId"/>
                                <form:hidden path="id"/>

                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputDefault">Tên gạo</label>
                                    <div class="col-md-6">
                                        <form:input path="name" type="text" class="form-control" id="inputDefault" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Hình ảnh</label>
                                    <div class="col-md-6">
                                        <img id="imagePreview" src="${product.image}" alt="Ảnh sản phẩm" style="max-width: 200px; display: block;" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputPrice">Giá gạo</label>
                                    <div class="col-md-6">
                                        <form:input path="unitPrice" type="number" id="inputPrice" class="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputCategory">Loại gạo</label>
                                    <div class="col-md-6">
                                        <form:input path="category" type="text"  class="form-control" id="inputCategory"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputStorage">Trạng thái</label>
                                    <div class="col-md-6">
                                        <form:select path="storage" class="form-control" id="inputStorage">
                                            <form:option value="true">Hoạt động</form:option>
                                            <form:option value="false">Lưu trữ</form:option>
                                        </form:select>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputQuantity">Số lượng trong kho</label>
                                    <div class="col-md-6">
                                        <form:input path="totalQuantity" type="number"  class="form-control" id="inputQuantity" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputDescription">Mô tả</label>
                                    <div class="col-md-6">
                                        <form:input path="description" type="text"  class="form-control" id="inputDescription"/>
                                    </div>
                                </div>
<%--                                <div class="form-group">--%>
<%--                                    <label class="col-md-3 control-label" for="inputDescription">Cửa hàng</label>--%>
<%--                                    <div class="col-md-6">--%>
<%--                                        <select name="storeId" class="form-control" id="inputStore" onchange="filterWarehouse.call(this)">--%>
<%--                                            <option value="">-- Chọn cửa hàng --</option>--%>
<%--                                            <c:forEach items="${stores}" var="store">--%>
<%--                                                <option value="${store.id}" ${product.storeId == store.id ? 'selected' : ''}>--%>
<%--                                                        ${store.name}--%>
<%--                                                </option>--%>
<%--                                            </c:forEach>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <div class="form-group">--%>
<%--                                    <label class="col-md-3 control-label" for="inputWarehouse">Khu vực</label>--%>
<%--                                    <div class="col-md-6">--%>
<%--                                        <form:select path="warehouseId" cssClass="form-control" id="inputWarehouse" style="display: none;">--%>
<%--                                            <option value="">-- Chọn kho hàng --</option>--%>

<%--                                        </form:select>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputStore">Cửa hàng</label>
                                    <div class="col-md-6">
                                        <select id="inputStore" name="storeId" class="form-control" onchange="filterWarehouses()">
                                            <option value="">-- Chọn cửa hàng --</option>
                                            <c:forEach items="${stores}" var="store">
                                                <option value="${store.id}" ${product.storeId == store.id ? 'selected' : ''}>
                                                        ${store.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group" id="warehouseGroup" style="display: none;">
                                    <label class="col-md-3 control-label" for="inputWarehouse">Khu vực</label>
                                    <div class="col-md-6">
                                        <select id="inputWarehouse" name="warehouseId" class="form-control">
                                            <option value="">-- Chọn kho hàng --</option>
                                            <c:forEach items="${wareHouses}" var="warehouse">
                                                <option value="${warehouse.id}" data-store-id="${warehouse.store.id}">
                                                        ${warehouse.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>



                                <!-- Nút Create -->
                                <div class="form-group">
                                    <div class="col-md-12 text-center">
                                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                                        <button type="button" class="btn btn-warning" onclick="cancelAction()">Quay lại</button>
                                    </div>
                                </div>
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
    function previewImage(event) {
        var reader = new FileReader();
        reader.onload = function() {
            var output = document.getElementById('imagePreview');
            output.src = reader.result;
            output.style.display = 'block';
        }
        reader.readAsDataURL(event.target.files[0]);
    }

    function filterWarehouses() {
        var storeSelect = document.getElementById("inputStore");
        var warehouseSelect = document.getElementById("inputWarehouse");
        var warehouseGroup = document.getElementById("warehouseGroup");

        var selectedStoreId = storeSelect.value;

        if (!selectedStoreId) {
            warehouseGroup.style.display = "none";
            return;
        }

        warehouseGroup.style.display = "block";
        var options = warehouseSelect.options;
        for (var i = 0; i < options.length; i++) {
            var storeId = options[i].getAttribute("data-store-id");
            if (storeId === selectedStoreId || options[i].value === "") {
                options[i].style.display = "block";
            } else {
                options[i].style.display = "none";
            }
        }

        warehouseSelect.value = "";
    }




    function cancelAction() {
        window.location.href = "/product";
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
<script src="/client/auth/assets/javascripts/validation.js"></script>

</body>
</html>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="fixed">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>Cập nhật sản phẩm</title>
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

                            <form:form method="post" modelAttribute="product" action="/update">
                                <form:hidden path="storeId" id="hiddenStoreId"/>
                                <form:hidden path="id"/>

                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputDefault">Tên gạo</label>
                                    <div class="col-md-6">
                                        <form:input path="name" type="text" class="form-control" id="inputDefault" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputImage">Hình ảnh</label>
                                    <div class="col-md-6">
                                        <form:input path="image" class="form-control" id="inputImage" type="text" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputImage">Hình ảnh</label>
                                    <div class="col-md-6">
                                        <!-- Sử dụng EL để hiển thị hình ảnh -->
                                        <img src="/images/${product.image}" alt="Image" class="img-fluid" id="imagePreview"/>
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


<%--                                <div class="form-group">--%>
<%--                                    <label class="col-md-3 control-label" for="inputQuantity">Số lượng trong kho</label>--%>
<%--                                    <div class="col-md-6">--%>
<%--                                        <form:input path="totalQuantity" type="number"  class="form-control" id="inputQuantity" readonly="true"/>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputDescription">Mô tả</label>
                                    <div class="col-md-6">
                                        <form:input path="description" type="text"  class="form-control" id="inputDescription"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputDescription">Cửa hàng</label>
                                    <div class="col-md-6">
                                        <select name="storeId" class="form-control" id="inputStore" onchange="filterWarehouse.call(this)">
                                            <option value="">-- Chọn cửa hàng --</option>
                                            <c:forEach items="${stores}" var="store">
                                                <option value="${store.id}" ${product.storeId == store.id ? 'selected' : ''}>
                                                        ${store.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="inputWarehouse">Kho hàng</label>
                                    <div class="col-md-6">
                                        <form:select path="warehouseId" cssClass="form-control" id="inputWarehouse" style="display: none;">
                                            <option value="">-- Chọn kho hàng --</option>
                                            <!-- The warehouses will be populated here based on the selected store -->
                                        </form:select>
                                    </div>
                                </div>


                                <!-- Nút Create -->
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <button type="submit" class="btn btn-primary">Cập nhật</button>
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
    function filterWarehouse() {
        const selectElement = document.getElementById("inputStore");
        const id = selectElement.value;
        console.log("Selected store value:", id);
        document.getElementById("hiddenStoreId").value = id;

        const warehouseSelect = document.getElementById("inputWarehouse");
        warehouseSelect.innerHTML = '<option value="">-- Chọn kho hàng --</option>';

        if (id) {
            warehouseSelect.style.display = "block";

            const url = `http://localhost:8080/warehouse/` + id;
            console.log("Fetching from URL:", url);

            fetch(url)
                .then(response => response.json())
                .then(warehouses => {
                    console.log("Received warehouses:", warehouses);
                    if (warehouses && warehouses.length > 0) {
                        warehouses.forEach(function(warehouse) {
                            let option = document.createElement("option");
                            option.value = warehouse.id;
                            option.textContent = warehouse.name;
                            warehouseSelect.appendChild(option);
                        });
                    } else {
                        console.log("Không có kho hàng nào cho cửa hàng này");
                    }
                })
                .catch(error => {
                    console.error('Error fetching warehouses:', error);
                });
        } else {
            warehouseSelect.style.display = "none";
        }
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
</body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="fixed">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết khu vực</title>
    <link rel="stylesheet" href="/client/auth/assets/vendor/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="/client/auth/assets/stylesheets/theme.css" />
</head>
<body>

<section class="body">
    <jsp:include page="../layout/header.jsp" />
    <div class="inner-wrapper">
        <jsp:include page="../layout/sidebar.jsp" />
        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Chi tiết khu vực</h2>
            </header>
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <h2 class="panel-title">Thông tin khu vực</h2>
                        </header>
                        <div class="panel-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Tên khu vực:</label>
                                <div class="col-md-6">
                                    <p class="form-control-static">${warehouse.name}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Cửa hàng:</label>
                                <div class="col-md-6">
                                    <p class="form-control-static">${warehouse.store.name}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Danh sách gạo trong kho:</label>
                                <div class="col-md-5">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>Tên gạo</th>
                                            <th>Số lượng trong kho</th>                                    
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${productList}" var="product">
                                            <tr>
                                                <td>${product.name}</td>
                                                <td>${product.totalQuantity}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12 text-center">
                                    <a href="/fetch-all-warehouse" class="btn btn-default">Quay lại</a>
                                    <a href="/warehouse/update/${warehouse.id}" class="btn btn-warning">Cập nhật</a>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </div>
</section>

<script src="/client/auth/assets/vendor/jquery/jquery.js"></script>
<script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>
<script src="/client/auth/assets/javascripts/theme.js"></script>
</body>
</html>

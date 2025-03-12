<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="fixed">
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Sản Phẩm</title>

    <link rel="stylesheet" href="/client/auth/assets/vendor/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="/client/auth/assets/vendor/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" href="/client/auth/assets/stylesheets/theme.css" />
</head>
<body>
<section class="body">

    <jsp:include page="../layout/header.jsp" />
    <div class="inner-wrapper">
        <jsp:include page="../layout/sidebar.jsp" />

        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Chi Tiết Sản Phẩm</h2>
            </header>

            <section class="panel">
                <header class="panel-heading">
                    <h2 class="panel-title">${product.name}</h2>
                </header>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6">
                            <img src="${product.image}" class="img-fluid" alt="${product.name}">
                        </div>
                        <div class="col-md-6">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Mô tả</th>
                                    <td>${product.description}</td>
                                </tr>
                                <tr>
                                    <th>Số lượng trong kho</th>
                                    <td>${product.totalQuantity}</td>
                                </tr>
                                <tr>
                                    <th>Loại gạo</th>
                                    <td>${product.category}</td>
                                </tr>
<%--                                <tr>--%>
<%--                                    <th>Cửa hàng</th>--%>
<%--                                    <td>${product.store.name}</td>--%>
<%--                                </tr>--%>
                                <tr>
                                    <th>Kho hàng</th>
                                    <td>${product.warehouse.name}</td>
                                </tr>

                            </table>
                        </div>
                    </div>
                    <div class="text-center mt-3">
                        <a href="/product" class="btn btn-primary">Quay lại danh sách</a>
                        <a href="/product/update/${product.id}" class="btn btn-warning">Cập nhật</a>
                    </div>
                </div>
            </section>
        </section>
    </div>
</section>

<script src="/client/auth/assets/vendor/jquery/jquery.js"></script>
<script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>
</body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="fixed">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết khách hàng</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
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
                <h2>Chi tiết khách hàng</h2>
            </header>
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <h2 class="panel-title">Thông tin khách hàng</h2>
                        </header>
                        <div class="panel-body">
                            <table class="table table-bordered table-striped">
                                <tr><th>ID</th><td>${customer.id}</td></tr>
                                <tr><th>Tên</th><td>${customer.name}</td></tr>
                                <tr><th>Địa chỉ</th><td>${customer.address}</td></tr>
                                <tr><th>Số điện thoại</th><td>${customer.phone}</td></tr>
                                <tr><th>Số nợ</th><td>${customer.balance}</td></tr>
                                <tr><th>Ngày tạo</th><td>${customer.createdAt}</td></tr>
                                <tr><th>Người tạo</th><td>${customer.createdBy}</td></tr>
                                <tr><th>Ngày cập nhật</th><td>${customer.updatedAt}</td></tr>
                                <tr><th>Người cập nhật</th><td>${customer.updatedBy}</td></tr>
                                <tr><th>Cửa hàng</th><td>${customer.store.name}</td></tr>
                            </table>
                            <a href="/customer" class="btn btn-primary" style="background-color: #0099E6; border-color: #0099E6; color: white;">Quay lại danh sách</a>
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

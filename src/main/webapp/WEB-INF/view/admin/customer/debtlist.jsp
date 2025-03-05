<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="fixed">
<head>
    <meta charset="UTF-8">
    <title>Danh sách nợ của khách hàng</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/client/auth/assets/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="/client/auth/assets/stylesheets/theme.css"/>
</head>
<body>
<section class="body">
    <jsp:include page="../layout/header.jsp"/>
    <div class="inner-wrapper">
        <jsp:include page="../layout/sidebar.jsp"/>
        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Danh sách nợ của ${customer.name}</h2>
            </header>

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="/customer/debtlist" class="btn btn-success" style="display: inline-flex;
        justify-content: center;
        align-items: center;
        width: 120px;
        height: 40px;
        font-size: 14px;
        font-weight: bold;
        color: #ffffff;
        background: linear-gradient(90deg, #0093DD, #007ACC);
        border: none;
        border-radius: 5px;
        text-decoration: none;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;">Tạo phiếu nợ</a>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-3">
                                    <form method="GET" action="/customer/search" class="form-inline"
                                          style="margin-bottom: 20px;">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="name"
                                                   placeholder="Tìm kiếm " value="${param.name}"/>
                                            <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit"style="background-color: #0099E6; border-color: #0099E6; color: white;"style="background-color: #0099E6; border-color: #0099E6; color: white;">Tìm</button>
                    </span>
                                        </div>
                        </header>
                        <div class="panel-body">
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>

                                    <th>Mã nợ</th>
                                    <th>Số tiền</th>
                                    <th>Loại nợ</th>
                                    <th>Lý do</th>
                                    <th>Ngày tạo</th>
                                    <th>Người tạo</th>

                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${deptList}" var="dept" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>${dept.id}</td>
                                        <td>${dept.debtAmount}</td>
                                        <td th:text="${debt.debtType}"></td>
                                        <td>${dept.debtReason}</td>
                                        <td>${dept.createdAt}</td>
                                        <td>${dept.createdBy}</td>

                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <a href="/customer" class="btn btn-primary" style="background-color: #0099E6; border-color: #0099E6; color: white;">Quay lại danh sách</a>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </div>
</section>
</body>
</html>

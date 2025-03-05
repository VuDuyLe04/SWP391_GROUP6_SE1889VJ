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
                <h2>Danh sách nợ của khách hàng</h2>
            </header>

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="/dept/create" class="btn btn-success">Thêm mới</a>
                            </div>
                            <form method="GET" action="/dept/search" class="form-inline">
                                <input type="text" class="form-control" name="keyword" placeholder="Tìm kiếm..." value="${param.keyword}"/>
                                <button class="btn btn-primary" type="submit">Tìm</button>
                            </form>
                        </header>
                        <div class="panel-body">
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>

                                    <th>Mã nợ</th>
                                    <th>Số tiền</th>
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
                                        <td>${dept.debtReason}</td>
                                        <td>${dept.createdAt}</td>
                                        <td>${dept.createdBy}</td>

                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="pagination-container text-center">
                                <ul class="pagination">
                                    <c:if test="${currentPage > 0}">
                                        <li><a href="/dept/search?page=${currentPage - 1}">&laquo; Trước</a></li>
                                    </c:if>
                                    <c:forEach begin="0" end="${totalPages - 1}" var="i">
                                        <li class="${i == currentPage ? 'active' : ''}">
                                            <a href="/dept/search?page=${i}">${i + 1}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${currentPage < totalPages - 1}">
                                        <li><a href="/dept/search?page=${currentPage + 1}">Sau &raquo;</a></li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </div>
</section>
</body>
</html>

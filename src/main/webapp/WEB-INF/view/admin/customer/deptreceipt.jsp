<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="fixed">
<head>
    <meta charset="UTF-8">
    <title>Thêm phiếu nợ</title>
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
                <h2>Thêm phiếu nợ</h2>
            </header>
            <div class="row">
                <div class="col-lg-6">
                    <section class="panel">
                        <div class="panel-body">
                            <form action="/debt/save" method="post">
                                <div class="form-group">
                                    <label>Chọn loại phiếu nợ</label>
                                    <select name="debtType" class="form-control">
                                        <option value="ADD">Thêm nợ</option>
                                        <option value="PAY">Trả nợ</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Số tiền</label>
                                    <input type="number" name="debtAmount" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Lý do</label>
                                    <input type="text" name="debtReason" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Ngày tạo</label>
                                    <input type="date" name="createdAt" class="form-control" required>
                                </div>
                                <input type="hidden" name="customerId" value="${customer.id}">
                                <button type="submit" class="btn btn-success">Lưu</button>
                                <a href="/customer" class="btn btn-primary">Hủy</a>
                            </form>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </div>
</section>
</body>
</html>
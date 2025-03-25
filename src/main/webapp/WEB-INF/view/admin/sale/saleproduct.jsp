<%@ page import="com.se1889_jv.swp391.swpstart.domain.Customer" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POS System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/homepage/assets/css/sale.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

    </style>
</head>
<body>
<!-- Thêm vào ngay trước bill-section -->

<div class="container-fluid">
    <div class="row">
        <!-- Left Panel - Products -->
        <div class="col-md-8">
            <div class="top-bar">
                <div class="row d-flex align-items-center p-2">
                    <div class="dropdown col-md-2">
                        <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" id="transactionDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            Chọn loại
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="transactionDropdown">
                            <li><a class="dropdown-item" href="http://localhost:8080/saleproduct/${storeId}" data-value="banhang">Bán hàng</a></li>
                            <li><a class="dropdown-item" href="http://localhost:8080/importproduct/${storeId}" data-value="nhaphang">Nhập hàng</a></li>
                        </ul>
                    </div>
                    <div class="col-md-8 d-flex">
                        <div class="search-container col-md-10">
                            <i class="fas fa-search search-icon"></i>
                            <input type="text" id="searchInput" class="search-input" placeholder="Tìm kiếm sản phẩm...">

                        </div>
                        <button id="searchBut" class="btn btn-primary">Tìm</button>
                    </div>
                </div>
            </div>
            <div class="toast-container position-fixed top-0 end-0 p-3">
                <div id="toastMessage" class="toast align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="d-flex">
                        <div class="toast-body">
                            Thông báo từ hệ thống!
                        </div>
                        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <div class="bill-items-con">
                <div class="row fw-bold bg-light py-2 border-bottom">
                    <div class="col-2">Sản phẩm</div>
                    <div class="col-2 text-center">Số lượng</div>
                    <div class="col-2 text-center">Gía theo cân</div>
                    <div class="col-2 text-center">Giá thực</div>
                    <div class="col-3 text-center">Tổng</div>
                    <div class="col-1 text-center">Xóa</div>
                </div>
                <div id="bill-items">
                    <!-- Các sản phẩm trong hóa đơn sẽ được thêm vào đây -->
                </div>
            </div>

            <div class="product-grid d-block" id="product-list">
                <!-- Mẫu sản phẩm -->
<%--&lt;%&ndash;                <c:forEach var="product" items="${productList}" varStatus="status">&ndash;%&gt;--%>
<%--                    <div class="product-card product" data-id="${product.id}" data-name="${product.name}" data-price="${product.unitPrice}" data-category="${product.category}">--%>
<%--                        <div class="product-image"></div>--%>
<%--                        <div>--%>
<%--                            <h5 class="product-name">${product.name}</h5>--%>
<%--                            <p class="text-primary">${product.unitPrice}đ</p>--%>
<%--                        </div>--%>
<%--                        <div class="d-flex gap-2">--%>
<%--                            <!-- Nút mở modal xem chi tiết -->--%>
<%--                            <button class="btn btn-info btn-sm" data-bs-toggle="modal"--%>
<%--                                    data-bs-target="#viewProductModal${product.id}">--%>
<%--                                Chi tiết--%>
<%--                            </button>--%>
<%--                            <!-- Nút mở modal thêm vào đơn -->--%>
<%--                            <button class="btn btn-primary btn-sm" data-bs-toggle="modal"--%>
<%--                                    data-bs-target="#productModal${product.id}">--%>
<%--                                Thêm vào đơn--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--&lt;%&ndash;                </c:forEach>&ndash;%&gt;--%>
            </div>

            <!-- Container chứa tất cả modal -->
            <div id="modal-container">
<%--                <c:forEach var="product" items="${productList}" varStatus="status">--%>
<%--                    <!-- Modal Xem Chi Tiết -->--%>
<%--                    <div class="modal fade con-detail" id="viewProductModal${product.id}" tabindex="-1" aria-hidden="true">--%>
<%--                        <div class="modal-dialog">--%>
<%--                            <div class="modal-content">--%>
<%--                                <div class="modal-header">--%>
<%--                                    <h5 class="modal-title">Thông tin sản phẩm: ${product.name}</h5>--%>
<%--                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--                                </div>--%>
<%--                                <div class="modal-body">--%>
<%--                                    <img src="/asset/img/anh1.jpg" alt="" width="50px" height="50px" />--%>
<%--                                    <p><strong>Danh mục:</strong> ${product.category}</p>--%>
<%--                                    <p><strong>Mô tả:</strong> ${product.description}</p>--%>
<%--                                    <p id="listedPrice"><strong>Giá:</strong> ${product.unitPrice}</p>--%>
<%--                                    <p id="quantity-product"><strong>Số lượng:</strong> ${product.totalQuantity} kg</p>--%>
<%--                                    <p><strong>Vị trí:</strong> ${warehouse[status.index].name}</p>--%>
<%--                                </div>--%>
<%--                                <div class="modal-footer">--%>
<%--                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <!-- Modal Thêm vào đơn -->--%>
<%--                    <div class="modal fade con-add" id="productModal${product.id}" tabindex="-1" aria-hidden="true">--%>
<%--                        <div class="modal-dialog">--%>
<%--                            <div class="modal-content">--%>
<%--                                <div class="modal-header">--%>
<%--                                    <h5 class="modal-title">${product.name}</h5>--%>
<%--                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--                                </div>--%>
<%--                                <div class="modal-body">--%>
<%--                                    <!-- Số lượng -->--%>
<%--                                    <div class="mb-3">--%>
<%--                                        <label class="form-label">Số lượng:</label>--%>
<%--                                        <input type="number" class="form-control quantity-input" name="quantity" min="1" value="1" data-quantity="${product.totalQuantity}">--%>
<%--                                    </div>--%>
<%--                                    <div class="mb-3">--%>
<%--                                        <label class="form-label" hidden="hidden">Hidden</label>--%>
<%--                                        <input type="number" class="form-control listed-input" name="hide" min="1" value="${product.unitPrice}" data-listed="${product.unitPrice}">--%>
<%--                                    </div>--%>
<%--                                    <!-- Đóng gói -->--%>
<%--                                    <div class="mb-3">--%>
<%--                                        <label class="form-label">Loại đóng gói:</label>--%>
<%--                                        <select class="form-control" name="packaging" id="select-pack">--%>
<%--                                            <c:forEach var="pack" items="${packagingList[status.index]}">--%>
<%--                                                <option value="${pack.id}" data-additional="${pack.quantityPerPackage}" data-liftcost="${pack.liftCost}">${pack.packageType}</option>--%>
<%--                                            </c:forEach>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>

<%--                                    <!-- Giảm giá -->--%>
<%--                                    <div class="mb-3">--%>
<%--                                        <label class="form-label">Giảm giá:</label>--%>
<%--                                        <select class="form-control" name="discount">--%>

<%--                                            <option value="0">Không Giảm</option>--%>
<%--                                            <option value="100">Giảm 100đ</option>--%>
<%--                                            <option value="200">Giảm 200đ</option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="modal-footer">--%>
<%--                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>--%>
<%--                                    <button type="button" class="btn btn-primary add-bill-detail">Xác nhận</button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>
            </div>




        </div>

        <!-- Right Panel - Bill -->
        <div class="col-md-4">
            <div class="bill-section">
                <div hidden="hidden" id="storeId">${storeId}</div>
                <div class="bill-summary" style="height: 100%">
                    <div class="bill-header">
                        <h4>Hóa đơn #1234</h4>
                        <span class="text-muted">10:55 01/10/2022</span>
                    </div>
                    <div class="summary-row">
                        <span class="fw-bold">Khách cần trả</span>
                        <span class="fw-bold text-success total-need-pay">0đ</span>
                    </div>
                    <div class="mb-3 position-relative">
                    <label for="search-phone" class="form-label">Khách hàng</label>
                    <div class="d-flex">
                        <input name="customerInformation" type="text" class="form-control" id="search-phone" placeholder="Nhập số điện thoại">
                        <button id="add-customer-btn" class="btn btn-outline-primary ms-2" type="button" data-bs-toggle="modal" data-bs-target="#customerModal">
                            <i class="bi bi-plus-circle">+</i>
                        </button>
                    </div>
                    <div id="suggestion-box" class="border bg-white mt-1" style="display: none; position: absolute;"></div>
                </div>

                    <!-- Thẻ hiển thị số dư -->
                    <div id="debt-info" class="alert mt-2" style="display: none;"></div>

                    <textarea id="description" class="form-control mt-3" rows="2" placeholder="Ghi chú đơn hàng..."></textarea>
                    <div class="mt-4">
                        <div class="d-flex align-items-center">
                            <select class="form-select me-3" id="paymentOptions" style="width: 200px;">
                                <option selected disabled>Chọn hành động</option>

                                <option value="order">Trả đơn hàng</option>
                                <option value="all">Trả tất cả</option>
                                <option value="partial">Trả một phần</option>
                            </select>
                        </div>
                    </div>

                    <!-- Ô nhập tiền -->
                    <div id="paymentInputs" class="mt-3" style="display: none;">
                        <label for="amountDue" class="form-label">Số tiền phải trả</label>
                        <input type="text" class="form-control" id="amountDue" disabled>

                        <label for="customerPayment" class="form-label mt-2">Số tiền khách trả</label>
                        <input type="text" class="form-control" id="customerPayment">
                    </div>

                    <div class="modal fade" id="customerModal" tabindex="-1" aria-labelledby="customerModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="customerModalLabel">Thông tin khách hàng</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label for="customer-name" class="form-label">Tên khách hàng</label>
                                        <input name="cusName" type="text" class="form-control" id="customer-name" placeholder="Nhập tên khách hàng">
                                        <div id="name-error" class="error-message text-danger" hidden="hidden">Không được để trống tên!</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="customer-phone" class="form-label">Số điện thoại</label>
                                        <input name="cusPhone" type="text" class="form-control" id="customer-phone"
                                               placeholder="Nhập số điện thoại">
                                        <div id="phone-error" class="error-message text-danger" hidden="hidden">Số điện thoại không hợp lệ. Vui lòng nhập lại!</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="customer-address" class="form-label">Địa chỉ</label>
                                        <textarea name="cusAddress" class="form-control" id="customer-address" rows="2" placeholder="Nhập địa chỉ"></textarea>
                                        <div id="address-error" class="error-message text-danger" hidden="hidden">Không được để trống địa chỉ</div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div  class="btn btn-secondary" data-bs-dismiss="modal">Đóng</div>
                                    <div  class="btn btn-success" id="save-customer-button">Lưu thông tin khách hàng</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="payment-button" id="create-bill">
                        THANH TOÁN
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/client/homepage/assets/js/sale.js"></script>
<script src="${pageContext.request.contextPath}/client/homepage/assets/js/addsale.js"></script>
<script src="${pageContext.request.contextPath}/client/homepage/assets/js/renderdata.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>--%>
<script>



    const searchInputKey = document.getElementById("searchInput");
    const searchButton = document.getElementById("searchBut");
    searchButton.addEventListener("click", function () {
        const storeId = "<%= request.getAttribute("storeId") %>";
        const keyword = searchInput.value.trim();
            if (keyword) {
                searchProducts(keyword, storeId);
            } else {
                console.warn("Vui lòng nhập từ khóa tìm kiếm.");
            }
    });
    document.addEventListener("DOMContentLoaded", function () {
        let currentPath = window.location.pathname;
        let transactionDropdown = document.getElementById("transactionDropdown");

        if (currentPath.includes("/saleproduct/")) {
            transactionDropdown.textContent = "Bán hàng";
        } else if (currentPath.includes("/importproduct/")) {
            transactionDropdown.textContent = "Nhập hàng";
        }
    });


</script>
</body>
</html>
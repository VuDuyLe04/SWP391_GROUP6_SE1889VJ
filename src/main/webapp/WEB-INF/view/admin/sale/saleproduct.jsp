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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        :root {
            --primary-color: #4F46E5;
            --secondary-color: #F9FAFB;
            --success-color: #059669;
            --danger-color: #DC2626;
            --warning-color: #D97706;
            --info-color: #2563EB;
        }

        body {
            background: #F3F4F6;
            font-family: 'Segoe UI', sans-serif;
        }

        .top-bar {
            background: #fff;
            padding: 1rem;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .search-container {
            position: relative;
        }

        .search-input {
            padding: 0.75rem 1rem 0.75rem 2.5rem;
            border: 1px solid #E5E7EB;
            border-radius: 0.5rem;
            width: 100%;
            transition: all 0.3s;
        }

        .search-input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(79, 70, 229, 0.1);
            outline: none;
        }

        .search-icon {
            position: absolute;
            left: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            color: #9CA3AF;
        }

        .filter-section {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .filter-select {
            padding: 0.5rem;
            border: 1px solid #E5E7EB;
            border-radius: 0.5rem;
            background: white;
            min-width: 150px;
        }

        .checkbox-group {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .custom-checkbox {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 1rem;
            padding: 1rem;
        }

        .product-card {
            background: white;
            border-radius: 0.5rem;
            padding: 1rem;
            transition: all 0.3s;
            cursor: pointer;
        }

        .product-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .product-image {
            width: 100%;
            height: 150px;
            background: #F3F4F6;
            border-radius: 0.375rem;
            margin-bottom: 1rem;
        }

        .bill-section {
            background: white;
            border-radius: 0.5rem;
            padding: 1.5rem;
            height: calc(100vh - 2rem);
            margin: 1rem;
            display: flex;
            flex-direction: column;
        }

        .bill-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #E5E7EB;
        }

        .bill-items {
            flex: 1;
            overflow-y: auto;
        }

        .bill-item {
            display: grid;
            grid-template-columns: 3fr 2fr 2fr 2fr 1fr;
            gap: 1rem;
            padding: 0.75rem;
            border-bottom: 1px solid #E5E7EB;
            align-items: center;
        }

        .bill-summary {
            margin-top: auto;
            padding-top: 1rem;
            border-top: 1px solid #E5E7EB;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.5rem;
        }

        .modal {
            background: rgba(0,0,0,0.5);
        }

        .modal-content {
            border-radius: 0.5rem;
            border: none;
        }

        .custom-btn {
            padding: 0.75rem 1.5rem;
            border-radius: 0.375rem;
            border: none;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-primary {
            background: var(--primary-color);
        }

        .btn-primary:hover {
            background: #4338CA;
        }

        .btn-success {
            background: var(--success-color);
        }

        .btn-success:hover {
            background: #047857;
        }

        .customer-search {
            position: relative;
        }

        .suggestion-box {
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 0.375rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            z-index: 1000;
        }

        .suggestion-item {
            padding: 0.75rem;
            cursor: pointer;
            transition: background 0.2s;
        }

        .suggestion-item:hover {
            background: #F3F4F6;
        }

        .payment-button {
            background: var(--success-color);
            color: white;
            padding: 1rem;
            border-radius: 0.5rem;
            border: none;
            font-weight: 600;
            width: 100%;
            margin-top: 1rem;
            transition: all 0.3s;
        }

        .payment-button:hover {
            background: #047857;
        }

        /* Thêm animation */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .animated {
            animation: fadeIn 0.3s ease-in-out;
        }
        .hidden {
            display: none !important;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Left Panel - Products -->
        <div class="col-md-8">
            <div class="top-bar">
                <div class="row">
                    <div class="col-md-4 d-flex">
                        <div class="search-container">
                            <i class="fas fa-search search-icon"></i>
                            <input type="text" id="searchInput" class="search-input" placeholder="Tìm kiếm sản phẩm...">

                        </div>
                        <button id="searchBut" class="btn btn-primary">Tìm</button>
                    </div>
                    <div class="col-md-8">
                        <div class="filter-section">

                            <select class="filter-select" id="categorySelect">
                                <option value="all">All</option>
                                <c:forEach var="cate" items="${categoryList}">
                                    <option value="${cate}">${cate}</option>
                                </c:forEach>
                            </select>
                            <select class="filter-select" id="sortSelect">
                                <option value="asc">Giá tăng dần</option>
                                <option value="desc">Giá giảm dần</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <div class="product-grid" id="product-list">
                <!-- Mẫu sản phẩm -->
                <c:forEach var="product" items="${productList}" varStatus="status">
                    <div class="product-card product" data-id="${product.id}" data-name="${product.name}" data-price="${product.unitPrice}" data-category="${product.category}">
                        <div class="product-image"></div>
                        <div>
                            <h5 class="product-name">${product.name}</h5>
                            <p class="text-primary">${product.unitPrice}đ</p>
                        </div>
                        <div class="d-flex gap-2">
                            <!-- Nút mở modal xem chi tiết -->
                            <button class="btn btn-info btn-sm" data-bs-toggle="modal"
                                    data-bs-target="#viewProductModal${product.id}">
                                Chi tiết
                            </button>
                            <!-- Nút mở modal thêm vào đơn -->
                            <button class="btn btn-primary btn-sm" data-bs-toggle="modal"
                                    data-bs-target="#productModal${product.id}">
                                Thêm vào đơn
                            </button>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Container chứa tất cả modal -->
            <div id="modal-container">
                <c:forEach var="product" items="${productList}" varStatus="status">
                    <!-- Modal Xem Chi Tiết -->
                    <div class="modal fade con-detail" id="viewProductModal${product.id}" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Thông tin sản phẩm: ${product.name}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <img src="/asset/img/anh1.jpg" alt="" width="50px" height="50px" />
                                    <p><strong>Danh mục:</strong> ${product.category}</p>
                                    <p><strong>Mô tả:</strong> ${product.description}</p>
                                    <p id="listedPrice"><strong>Giá:</strong> ${product.unitPrice}</p>
                                    <p id="quantity-product"><strong>Số lượng:</strong> ${product.totalQuantity} kg</p>
                                    <p><strong>Vị trí:</strong> ${warehouse[status.index].name}</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal Thêm vào đơn -->
                    <div class="modal fade con-add" id="productModal${product.id}" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">${product.name}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- Số lượng -->
                                    <div class="mb-3">
                                        <label class="form-label">Số lượng:</label>
                                        <input type="number" class="form-control quantity-input" name="quantity" min="1" value="1" data-quantity="${product.totalQuantity}">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" hidden="hidden">Hidden</label>
                                        <input type="number" class="form-control listed-input" name="hide" min="1" value="${product.unitPrice}" data-listed="${product.unitPrice}">
                                    </div>
                                    <!-- Đóng gói -->
                                    <div class="mb-3">
                                        <label class="form-label">Loại đóng gói:</label>
                                        <select class="form-control" name="packaging" id="select-pack">
                                            <c:forEach var="pack" items="${packagingList[status.index]}">
                                                <option value="${pack.id}" data-additional="${pack.quantityPerPackage}" data-liftcost="${pack.liftCost}">${pack.packageType}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <!-- Giảm giá -->
                                    <div class="mb-3">
                                        <label class="form-label">Giảm giá:</label>
                                        <select class="form-control" name="discount">

                                            <option value="0">Không Giảm</option>
                                            <option value="100">Giảm 100đ</option>
                                            <option value="200">Giảm 200đ</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <button type="button" class="btn btn-primary add-bill-detail">Xác nhận</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
        </div>

        <!-- Right Panel - Bill -->
        <div class="col-md-4">
            <div class="bill-section">
                <div hidden="hidden" id="storeId">${storeId}</div>
                <div class="bill-header">
                    <h4>Hóa đơn #1234</h4>
                    <span class="text-muted">10:55 01/10/2022</span>
                </div>


                <div class="bill-items">
                    <!-- Mẫu item trong bill -->
<%--                    <div class="bill-item">--%>
<%--                        <div>--%>
<%--                            <h6 class="mb-0">Tên sản phẩm</h6>--%>
<%--                            <small class="text-muted">Loại: Standard</small>--%>
<%--                        </div>--%>
<%--                        <div>2 x 100,000đ</div>--%>
<%--                        <div>Giảm: 10,000đ</div>--%>
<%--                        <div class="text-end">190,000đ</div>--%>
<%--                        <button class="btn btn-danger btn-sm">--%>
<%--                            <i class="fas fa-times"></i>--%>
<%--                        </button>--%>
<%--                    </div>--%>
                </div>

                <div class="bill-summary">
                    <div class="summary-row">
                        <span>Tổng tiền hàng</span>
                        <span>200,000đ</span>
                    </div>
                    <div class="summary-row">
                        <span>Giảm giá</span>
                        <span class="text-danger">-10,000đ</span>
                    </div>
                    <div class="summary-row">
                        <span class="fw-bold">Khách cần trả</span>
                        <span class="fw-bold text-success">190,000đ</span>
                    </div>
                    <div class="mb-3 position-relative">
                        <label for="search-phone" class="form-label">Khách hàng</label>
                        <div class="d-flex">
                            <input name="customerInformation" type="text" class="form-control" id="search-phone" placeholder="Nhập số điện thoại" >
                            <button id="add-customer-btn" class="btn btn-outline-primary ms-2" type="button" data-bs-toggle="modal" data-bs-target="#customerModal">
                                <i class="bi bi-plus-circle">+</i>
                            </button>
                        </div>
                        <div id="suggestion-box" class="border bg-white mt-1" style="display: none; position: absolute;"></div>
                    </div>
                    <textarea class="form-control mt-3" rows="2" placeholder="Ghi chú đơn hàng..."></textarea>

                    <button class="payment-button">
                        THANH TOÁN
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>--%>
<script>
    // document.addEventListener("DOMContentLoaded", function () {
    //     document.querySelectorAll("[id^='viewProductModal']").forEach(modal => {
    //         let modalInstance = new bootstrap.Modal(modal);
    //         modal.addEventListener("show.bs.modal", function () {
    //             modalInstance.show();
    //         });
    //     });
    //
    //     document.querySelectorAll("[id^='productModal']").forEach(modal => {
    //         let modalInstance = new bootstrap.Modal(modal);
    //         modal.addEventListener("show.bs.modal", function () {
    //             modalInstance.show();
    //         });
    //     });
    //
    // });

    document.addEventListener("DOMContentLoaded", () => {
        const products = document.querySelectorAll('.product');
        const searchInput = document.getElementById("searchInput");
        const searchButton = document.getElementById("searchBut");
        const modals = document.querySelectorAll('.con-add');
        const modals2 = document.getElementById('con-detail');
        console.log(modals)
        searchButton.addEventListener('click', () => {
            const searchValue = searchInput.value.toLowerCase();
            if(searchValue.length !== 0 ){
                products.forEach(product => {

                    const productName = product.querySelector(".product-name").textContent.toLowerCase();
                    if (productName.includes(searchValue)) {
                        product.classList.remove("hidden");
                    } else {
                        product.classList.add("hidden");
                    }
                });
                searchInput.value = '';
            } else {
                products.forEach(product => {
                    product.classList.remove('hidden');
                })
            }

        })
        document.getElementById('sortSelect').addEventListener('change', function () {
            const sortOrder = this.value;
            const productList = document.getElementById('product-list');
            const products = Array.from(productList.getElementsByClassName('product-card'));

            products.sort((a, b) => {
                const priceA = parseFloat(a.getAttribute('data-price'));
                const priceB = parseFloat(b.getAttribute('data-price'));
                return sortOrder === 'asc' ? priceA - priceB : priceB - priceA;
            });

            productList.innerHTML = '';
            products.forEach(product => {
                productList.appendChild(product);
            });
        });



        const categorySelect = document.getElementById("categorySelect");
        categorySelect.addEventListener("change", () => {
            const selectedCategory = categorySelect.value.toLowerCase();
            products.forEach(product => {
                const productCategory = product.getAttribute("data-category").toLowerCase();
                if (selectedCategory === "all" || productCategory === selectedCategory) {
                    product.classList.remove("hidden");
                } else {
                    product.classList.add("hidden");
                }
            });
        });
    })


    const customerList = [
        <%
            for (int i = 0; i < ((List<Customer>) request.getAttribute("customerList")).size(); i++) {
                Customer customer = ((List<Customer>) request.getAttribute("customerList")).get(i);
                out.print("{");
                out.print("\"id\": \"" + customer.getId() + "\",");
                out.print("\"name\": \"" + customer.getName() + "\",");
                out.print("\"phone\": \"" + customer.getPhone() + "\"");
                out.print("}");
                if (i < ((List<Customer>) request.getAttribute("customerList")).size() - 1) {
                    out.print(",");
                }
            }
        %>
    ];
    console.log(customerList);

    document.getElementById('add-customer-btn').addEventListener('click', function() {

        document.getElementById('suggestion-box').style.display = 'none';
        document.getElementById('customer-form').style.display = 'block';
    });
    document.addEventListener("DOMContentLoaded", function () {
        const searchInput = document.getElementById("search-phone");
        const suggestionBox = document.getElementById("suggestion-box");

        searchInput.addEventListener("input", function () {
            const query = searchInput.value.trim().toLowerCase();
            suggestionBox.innerHTML = "";

            if (query.length > 0) {
                const suggestions = customerList.filter(customer =>
                    customer.phone.toLowerCase().includes(query)
                );

                if (suggestions.length > 0) {
                    suggestionBox.style.display = "block";
                    suggestions.forEach(cust => {
                        const suggestionItem = document.createElement("div");
                        suggestionItem.className = "suggestion-item";
                        suggestionItem.textContent = cust.name + ' - ' +cust.phone;
                        suggestionItem.addEventListener("click", function () {
                            searchInput.value = cust.name + ' - ' +cust.phone;
                            suggestionBox.style.display = "none";
                        });
                        suggestionBox.appendChild(suggestionItem);
                    });
                } else {
                    suggestionBox.style.display = "none";
                }
            } else {
                suggestionBox.style.display = "none";
            }
        });

        document.addEventListener("click", function (event) {
            if (!suggestionBox.contains(event.target) && event.target !== searchInput) {
                suggestionBox.style.display = "none";
            }
        });
    });
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".add-bill-detail").forEach(button => {
            button.addEventListener("click", async function () {
                let modal = this.closest(".modal");
                let productId = modal.id.replace("productModal", "");
                let quantity = modal.querySelector(".quantity-input").value;
                let packagingId = modal.querySelector("select[name='packaging']").value;
                let discount = modal.querySelector("select[name='discount']").value;
                let listed = modal.querySelector('.listed-input').value;
                let billId = localStorage.getItem("billId");
                console.log("AFTER: ", billId);
                const storeId = parseInt(document.getElementById("storeId").textContent);
                try{
                    if (!billId || billId === "undefined" || billId === "null") {
                        let billData = await fetch("/hello/addBill?storeId="+encodeURIComponent(storeId)).then(res => res.json());
                        if (!billData || billData.code !== 200) {
                            alert("Không thể tạo hóa đơn. Vui lòng thử lại!");
                            return;
                        }
                        console.log("Hóa đơn được tạo thành công:", billData);

                        billId = String(billData.data.id);

                        localStorage.setItem("billId", billId);

                    }
                    console.log("BEFORE: ", billId);
                    console.log(billId)
                    let requestData = {
                        billId: billId,
                        productId: productId,
                        quantity: quantity,
                        packagingId: packagingId,
                        discount: discount,
                        listedPrice: listed
                    };
                    console.log(requestData);
                    let detailResponse = await fetch("/hello/addBillDetail", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify(requestData)
                    });
                    let responseData = await detailResponse.json();
                    console.log(responseData);

                } catch (error){
                    console.error(error)
                }

            });
        });
    });

</script>
</body>
</html>
<%@ page import="com.se1889_jv.swp391.swpstart.domain.Customer" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="asset/themify-icons/themify-icons.css" />
    <link rel="stylesheet" href="asset/style.css" />
    <link rel="stylesheet" href="asset/img/" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .col-md-8 {
            max-height: 100vh;
            overflow-y: auto;
        }

        .bill {
            height: 90vh;
            overflow-y: auto;
        }
        .hidden {
            display: none !important;
        }
        #toast-container {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1050;
        }

        /* Toast default style */
        .toast {
            display: none; /* Ẩn ban đầu */
            max-width: 400px;
            padding: 20px 30px;
            background-color: #f8d7da;
            color: #721c24;
            font-size: 16px;
            font-weight: normal;
            border: 1px solid #f5c6cb;
            border-radius: 8px;
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.15);
            opacity: 0;
            transform: translateX(100%); /* Bắt đầu ngoài khung nhìn */
            transition: opacity 0.5s ease, transform 0.5s ease; /* Hiệu ứng mờ và dịch chuyển */
        }

        /* Khi hiển thị */
        .toast.show {
            display: block;
            opacity: 1;
            transform: translateX(0); /* Di chuyển vào khung nhìn */
        }


        .toast.hide {
            opacity: 0;
            transition: opacity 1s ease; /* Mờ dần */
        }


    </style>

    <title>Document</title>
</head>

<body>

<!-- start: header -->
<%--<jsp:include page="../layout/header.jsp" />--%>
<!-- end: header -->


<div class="row bg-primary p-2 align-items-center">
    <!-- Search Box -->
    <div class="col-md-3">
        <div class="input-group">
            <input
                    id="search-input"
                    type="text"
                    class="form-control"
                    placeholder="Product name"
                    aria-label="Recipient's username"
                    aria-describedby="basic-addon2"
            />
            <div class="input-group-append">
                <button class="btn btn-success search-btn" id="search-btn" type="button">Search</button>
            </div>
        </div>
    </div>

    <!-- Category Filter -->
    <div class="col-md-3">
        <select class="form-control" id="categorySelect">
            <option value="all">All</option>
            <c:forEach var="cate" items="${categoryList}">
                <option value="${cate}">${cate}</option>
            </c:forEach>
        </select>
    </div>

    <!-- Des Filter (Thom, Deo, Bui) -->
    <div class="col-md-3 d-flex align-items-center">
        <div class="form-check form-check-inline">
            <input
                    class="form-check-input"
                    type="checkbox"
                    id="filter1"
                    value="thom"
            />
            <label class="des form-check-label" for="filter1">Thom</label>
        </div>
        <div class="form-check form-check-inline">
            <input
                    class="form-check-input"
                    type="checkbox"
                    id="filter2"
                    value="deo"
            />
            <label class="des form-check-label" for="filter2">Deo</label>
        </div>
        <div class="form-check form-check-inline">
            <input
                    class="form-check-input"
                    type="checkbox"
                    id="filter3"
                    value="bui"
            />
            <label class="des form-check-label" for="filter3">Bui</label>
        </div>
    </div>

    <!-- Sort by Price -->
    <div class="col-md-3">
        <select class="form-control" id="sortSelect">
            <option value="asc">Sắp xếp tăng dần</option>
            <option value="desc">Sắp xếp giảm dần</option>
        </select>
    </div>
</div>
<div class="row bg-secondary">
    <div id="product-list" class="col-md-7 overflow-auto">
        <c:forEach var="product" items="${productList}" varStatus="status">
            <div class="product d-flex justify-content-around align-items-center mb-2 mt-2 bg-light p-1"
                 data-category="${product.category}"
                 data-description="${product.description}"
                 data-price="${product.unitPrice}">


                <div class="m-2 product-name">${product.name}</div>


                <!-- Nút mở modal "View" -->
                <button type="button" class="btn btn-info"
                        data-bs-toggle="modal"
                        data-bs-target="#viewProductModal${status.index}">
                    View
                </button>

                <!-- Nút mở modal "Chọn" -->
                <button type="button" class="btn btn-primary"
                        data-bs-toggle="modal"
                        data-bs-target="#productModal${status.index}">
                    Chọn
                </button>

                <!-- Modal "View" -->
                <div class="modal fade" id="viewProductModal${status.index}" tabindex="-1" aria-hidden="true">
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
                                <p><strong>Giá:</strong> ${product.unitPrice}</p>
                                <p><strong>Số lượng:</strong> ${product.totalQuantity} kg</p>
                                <p><strong>Vị trí:</strong> ${warehouse[status.index].name}</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal "Chọn" -->
                <div class="modal fade" id="productModal${status.index}" tabindex="-1" aria-hidden="true">
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
                                    <input type="number" class="form-control quantity-input" name="quantity" min="1" value="1" data-quantity="${product.totalQuantity}" >
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
                                        <option value="">Chọn giảm giá</option>
                                        <option value="0">Khong Giam</option>
                                        <option value="100">Giảm 100đ</option>
                                        <option value="200d">Giảm 200đ</option>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <button type="button" class="btn btn-primary"
                                        onclick="handleAddToBill(${status.index}, ${product.id},'${product.name}', ${product.unitPrice})">
                                    Xác nhận
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>

    <div class="col-md-5 mt-2 ">
        <div class="p-3 bg-light rounded bill">
            <form action="/createbill" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span>${user.name}</span>
                    <span>Time</span>
                </div>

                <ul class="nav nav-tabs mb-2">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Hóa đơn</a>
                    </li>
                </ul>
                <div class="list-product-bill" >
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="text-primary col-md-2 text-center">Sản phẩm</h5>
                        <h5 class="text-primary col-md-2 text-center">Loại</h5>
                        <h5 class="text-primary col-md-2 text-center">Số lượng</h5>
                        <h5 class="text-primary col-md-2 text-center">Gía</h5>
                        <h5 class="text-primary col-md-2 text-center">Giamr</h5>
                        <h5 class="text-primary col-md-2 text-center">Tổng</h5>
                    </div>
                    <div id="bill-list">

                    </div>

                </div>


                <div class="mb-3">
                    <div class="d-flex justify-content-between">
                        <span class="fw-semibold">Tổng tiền hàng</span>
                        <span id="total-price" class="fw-bold">0</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="fw-semibold">Giảm giá</span>
                        <span id="sale-price" class="text-danger">0</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="fw-semibold">Khách cần trả</span>
                        <span class="fw-bold text-success" id="price-payment" >0</span>
                    </div>
                    <hr />
                </div>

                <div class="mb-3">
        <textarea
                class="form-control"
                rows="2"
                placeholder="Ghi chú"
        ></textarea>
                </div>
                <input value="${storeId}" id="store-id" name="storeId" hidden="hidden">
                <div class="mb-3 position-relative">
                    <label for="search-phone" class="form-label">Khách hàng</label>
                    <div class="d-flex">
                        <input type="text" class="form-control" id="search-phone" placeholder="Nhập số điện thoại" >
                        <button id="add-customer-btn" class="btn btn-outline-primary ms-2" type="button" data-bs-toggle="modal" data-bs-target="#customerModal">
                            <i class="bi bi-plus-circle">+</i>
                        </button>
                    </div>
                    <div id="suggestion-box" class="border bg-white mt-1" style="display: none; position: absolute; z-index: 1000;"></div>
                </div>

                <!-- Modal Thêm Khách Hàng -->
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
                                    <input type="text" class="form-control" id="customer-name" placeholder="Nhập tên khách hàng" required>
                                </div>
                                <div class="mb-3">
                                    <label for="customer-phone" class="form-label">Số điện thoại</label>
                                    <input type="text" class="form-control" id="customer-phone" placeholder="Nhập số điện thoại" required>
                                </div>
                                <div class="mb-3">
                                    <label for="customer-address" class="form-label">Địa chỉ</label>
                                    <textarea class="form-control" id="customer-address" rows="2" placeholder="Nhập địa chỉ" required></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <button type="button" class="btn btn-success" id="save-customer-button">Lưu thông tin khách hàng</button>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-success btn-block" style="height: 50px">
                        Thanh toán
                    </button>
                </div>
            </form>

        </div>
    </div>
</div>
<div id="toast-container" style="position: fixed; top: 20px; right: 20px; z-index: 1050;">
    <div id="toast" class="toast">
        Không đủ số lượng sản phẩm trong kho!
    </div>
</div>

<script >


    const searchButton = document.getElementById("search-btn");
    const searchInput = document.getElementById("search-input");
    const products = document.querySelectorAll(".product");
    const categorySelect = document.getElementById("categorySelect");


    //search key
    searchButton.addEventListener('click', () => {
        const searchValue = searchInput.value.toLowerCase();
        console.log(searchInput.value);
        products.forEach(product => {

            const productName = product.querySelector(".product-name").textContent.toLowerCase();
            console.log(productName);
            if (productName.includes(searchValue)) {
                product.classList.remove("hidden");
            } else {
                product.classList.add("hidden");
            }
        });
        searchInput.value = '';
    })

    //search category
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

    //check-box
    const filter1 = document.getElementById('filter1');
    const filter2 = document.getElementById('filter2');
    const filter3 = document.getElementById('filter3');

    function filterProducts() {
        products.forEach(product => {
            const des = product.getAttribute('data-description');
            const option1 = des.includes(filter1.value) ;

            const option2 = des.includes(filter2.value);

            const option3 =des.includes(filter3.value);


            const showThom = filter1.checked ? option1 : true;
            const showDeo = filter2.checked ? option2 : true;
            const showBui = filter3.checked ? option3 : true;

            if (showThom && showDeo && showBui) {
                product.classList.remove("hidden");
            } else {
                product.classList.add("hidden");
            }
        });
    }
    filter1.addEventListener('change', filterProducts);
    filter2.addEventListener('change', filterProducts);
    filter3.addEventListener('change', filterProducts);

    filterProducts();

    //sort
    document.getElementById('sortSelect').addEventListener('change', function () {
        const sortOrder = this.value;
        const productList = document.getElementById('product-list');
        const products = Array.from(productList.getElementsByClassName('product'));


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

    //bill list after choose
    const billList = document.getElementById('bill-list');
    const listSender = [];

    function handleAddToBill(index, productId, name, price) {

        const modal = document.getElementById('productModal'+index);
        const quantityModel = modal.querySelector('input[name="quantity"]');
        const quantityOfProduct = modal.querySelector('input[name="quantity"]').getAttribute('data-quantity')

        const quantityString = quantityModel.value;
        const packaging = modal.querySelector('select[name="packaging"]').selectedOptions[0].getAttribute('value');
        const disCountString = modal.querySelector('select[name="discount"]').selectedOptions[0].getAttribute('value');
        const disCount = parseInt(disCountString);
        const packType = modal.querySelector('select[name="packaging"]').selectedOptions[0].textContent;
        const packPerUnit = modal.querySelector('select[name="packaging"]').selectedOptions[0].getAttribute('data-additional');
        const liftCost = modal.querySelector('select[name="packaging"]').selectedOptions[0].getAttribute('data-liftcost');
        const quantity = parseFloat(quantityString);
        if (packPerUnit * quantity > parseFloat(quantityOfProduct)) {


            const mess = 'Sản phẩm '+name+' chỉ còn lại '+quantityOfProduct+ ' sản phẩm !';
            showToast(mess)

            modal.querySelector('.btn-close').click();
            quantityModel.value = 1;
            return;
        }

        const billDetails = {
            product: {
                id: productId,
                name: name,
                unitPrice: price
            }
            ,packing:{
                packType: packType,
                packId: packaging,
                packPerUnit: packPerUnit,
                liftCost: liftCost
            }
            ,quantity
            ,disCount
        }
        console.log(billDetails);
        let found = false;
        for (let item of listSender) {
            if (billDetails.product.id === item.product.id && billDetails.packing.packId === item.packing.packId) {
                item.quantity += billDetails.quantity;
                found = true;
                break;
            }
        }

        if (!found) {
            listSender.push(billDetails);
        }

        console.log(listSender);
        quantityModel.value = 1;

        modal.querySelector('.btn-close').click();
        generate(listSender);

    }

    function generate(list) {
        let pay = 0;
        let totalPrice = 0;
        let sale = 0;
        let html = ``;
        for (let i = 0; i < list.length; i++) {
            const product = list[i];
            console.log("Product Object:", product);
            let productId = parseInt(product.product.id);
            let nameProduct = product.product?.name || "N/A";
            let packaging = product.packing.packType || "N/A";
            let quantity = product.quantity || 0;
            let unitPrice = product.product?.unitPrice || 0;
            let disCount = product.disCount || 0;
            let unitPer = parseFloat(product.packing.packPerUnit);
            let total = unitPrice * quantity * unitPer -  quantity* unitPer*disCount;
            let salePrice =quantity* unitPer*disCount;
            let liftTotal = quantity*product.packing.liftCost;
            totalPrice += unitPrice * quantity * unitPer
            pay += total;
            sale += quantity* unitPer*disCount;
            html += '<div >' +

                '<div class="d-flex justify-content-between align-items-center mb-3">' +
                '<input class="col-md-2 text-center" value="' + productId + '" readonly style="border: none;" hidden="hidden" name="billDetails['+ i +'].product.id">'+
                '<input class="col-md-2 text-center" value="' + nameProduct + '" readonly style="border: none;">' +
                '<input class="col-md-2 text-center" value="' + packaging + '" readonly style="border: none;" name="billDetails[' + i + '].packaging.packageType">' +
                '<input class="col-md-2 text-center" value="' + quantity + '" readonly style="border: none;" name="billDetails[' + i + '].quantity">' +
                '<input class="col-md-2 text-center" value="' + unitPrice + ' VND" readonly style="border: none;">' +
                '<input class="col-md-2 text-center" value="' + salePrice + ' VND" readonly style="border: none;">' +
                '<input class="col-md-2 text-center" value="' + total + '" readonly style="border: none;" name="billDetails[' + i + '].actualSellPrice">'+
                '<input class="col-md-2 text-center" value="' + liftTotal + '" readonly hidden="hidden"  style="border: none;" name="billDetails[' + i + '].liftPrice">'+
                '</div>' +
                '</div>'
                ;

        }


        totalPayment(totalPrice, sale, pay);
        billList.innerHTML= html;
    }
    function totalPayment(total, sale, pay){
        const totalPrice = document.getElementById('total-price');
        const salePrice = document.getElementById('sale-price');
        const payment = document.getElementById('price-payment');
       totalPrice.innerHTML = total;
        salePrice.innerHTML =sale;
        payment.innerHTML=pay;
    }

    function showToast(message) {
        const toast = document.getElementById('toast');


        toast.textContent = message;


        toast.classList.remove('hide');
        toast.classList.add('show');
        setTimeout(() => {
            toast.classList.remove('show');
            toast.classList.add('hide');
        }, 3000);
    }
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

    document.getElementById('add-customer-btn').addEventListener('click', function() {

        document.getElementById('suggestion-box').style.display = 'none';
        document.getElementById('customer-form').style.display = 'block';
    });

    // search customer
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
                        suggestionItem.textContent = cust.name + ' - ' + cust.phone;
                        suggestionItem.addEventListener("click", function () {
                            searchInput.value = cust.name;
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
    document.getElementById('save-customer-button').addEventListener('click', function () {
        const name = document.getElementById('customer-name').value;
        const phone = document.getElementById('customer-phone').value;
        const address = document.getElementById('customer-address').value;

        if (name && phone && address) {
            const searchPhoneInput = document.getElementById('search-phone');
            searchPhoneInput.value = name +'-'+ phone;

            var myModal = new bootstrap.Modal(document.getElementById('customerModal'));
            myModal.click();
        } else {
            alert("Vui lòng nhập đầy đủ thông tin: Tên, Số điện thoại và Địa chỉ.");
        }
    });




</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>

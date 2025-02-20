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
            transform: translateX(0);
        }


        .toast.hide {
            opacity: 0;
            transition: opacity 1s ease;
        }
        .error-message {
            color: red;
            font-size: 0.9em;
            display: none;
        }



        .popup {
            display: none; /* Mặc định ẩn */
            position: fixed;
            top: 20px; /* Căn trên */
            right: 20px; /* Căn phải */
            background: rgba(255, 0, 0, 0.9); /* Màu đỏ cảnh báo */
            color: white;
            padding: 15px 20px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            opacity: 0;
            transform: translateX(100px); /* Ẩn bên ngoài màn hình */
            transition: opacity 0.5s ease-in-out, transform 0.5s ease-in-out;
        }
        .fade-in {
            opacity: 1 !important;
            transform: translateX(0);
        }

        /* Hiệu ứng mờ dần */
        .fade-out {
            opacity: 0 !important;
            transform: translateX(100px);
        }



    </style>

    <title>Document</title>
</head>

<body>

<!-- start: header -->
<%--<jsp:include page="../layout/header.jsp" />--%>
<!-- end: header -->

<div id="popup-message" class="popup">
    <div class="popup-content">
        <p>Vui lòng chọn sản phẩm trước khi thanh toán!</p>
    </div>
</div>
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
            <div class="product d-flex justify-content-around align-items-center m-2 bg-light p-1 "
                 data-category="${product.category}"
                 data-description="${product.description}"
                 data-price="${product.unitPrice}">

                <div class="m-2 product-name col-md-3">${product.name}</div>


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
                                <p id="quantity-product"><strong>Số lượng:</strong> ${product.totalQuantity} kg</p>
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
            <form action="/createbill" method="post" id="form-sender">
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
                        <h5 class="text-primary col-md-2 text-center">Tên</h5>
                        <h5 class="text-primary col-md-2 text-center">Loại</h5>
                        <h5 class="text-primary col-md-2 text-center">Số lượng</h5>
                        <h5 class="text-primary col-md-2 text-center">Gía</h5>
                        <h5 class="text-primary col-md-2 text-center">Giảm</h5>
                        <h5 class="text-primary col-md-2 text-center">Tổng</h5>

                    </div>
                    <div id="bill-list">

                    </div>

                </div>


                <div class="mb-3">
                    <div class="d-flex justify-content-between">
                        <span class="fw-semibold">Tổng tiền hàng</span>
                        <input style="border: none; width: 100px"  id="total-price" class="fw-bold" value="0" readonly>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="fw-semibold">Giảm giá</span>
                        <input style="border: none; width: 100px"  id="sale-price" class="text-danger" value="0" readonly>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="fw-semibold">Khách cần trả</span>
                        <input name="totalPrice" style="border: none; width: 100px" class="fw-bold text-success" id="price-payment" value="0" readonly>
                    </div>
                    <div class="d-none justify-content-between" >
                        <span class="fw-semibold">Be hang</span>
                        <input name="totalLift" style="border: none; width: 100px" class="fw-bold text-success" id="total-lift" value="0" readonly>
                    </div>
                    <hr />
                </div>

                <div class="mb-3">
        <textarea name="des"
                class="form-control"
                rows="2"
                placeholder="Ghi chú"
        ></textarea>
                </div>
                <input value="${storeId}" id="store-id" name="storeId" hidden="hidden">
                <div class="mb-3 position-relative">
                    <label for="search-phone" class="form-label">Khách hàng</label>
                    <div class="d-flex">
                        <input name="customerInformation" type="text" class="form-control" id="search-phone" placeholder="Nhập số điện thoại" >
                        <button id="add-customer-btn" class="btn btn-outline-primary ms-2" type="button" data-bs-toggle="modal" data-bs-target="#customerModal">
                            <i class="bi bi-plus-circle">+</i>
                        </button>
                    </div>
                    <div id="suggestion-box" class="border bg-white mt-1" style="display: none; position: absolute; z-index: 1000;"></div>
                </div>
                <input id="cus-add" name="customerAddress" hidden="hidden">

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
                                    <input name="cusName" type="text" class="form-control" id="customer-name" placeholder="Nhập tên khách hàng">
                                </div>
                                <div class="mb-3">
                                    <label for="customer-phone" class="form-label">Số điện thoại</label>
                                    <input name="cusPhone" type="text" class="form-control" id="customer-phone"
                                           placeholder="Nhập số điện thoại">
                                    <div id="phone-error" class="error-message">Số điện thoại không hợp lệ. Vui lòng nhập lại!</div>
                                </div>
                                <div class="mb-3">
                                    <label for="customer-address" class="form-label">Địa chỉ</label>
                                    <textarea name="cusAddress" class="form-control" id="customer-address" rows="2" placeholder="Nhập địa chỉ"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div  class="btn btn-secondary" data-bs-dismiss="modal">Đóng</div>
                                <div  class="btn btn-success" id="save-customer-button">Lưu thông tin khách hàng</div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-success btn-block pay-button" id="submit-but" style="height: 50px">
                        Thanh toán
                    </button>
                </div>
            </form>

        </div>
    </div>
</div>

<script >
    //validate phone
    const phoneInput = document.getElementById("customer-phone");
    const errorDiv = document.getElementById("phone-error");

    phoneInput.addEventListener("input", function () {
        const phoneRegex = /^(\+84|0)\d{9,10}$/;
        if (phoneRegex.test(phoneInput.value)) {
            errorDiv.style.display = "none";
            phoneInput.style.borderColor = "green";
        } else {
            errorDiv.style.display = "block";
            phoneInput.style.borderColor = "red";
        }
    });

    const searchButton = document.getElementById("search-btn");
    const searchInput = document.getElementById("search-input");
    const products = document.querySelectorAll(".product");
    const categorySelect = document.getElementById("categorySelect");


    //search key
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
    function showAttention(name){
        //const mess = 'Sản phẩm '+name+' chỉ còn lại '+quantityOfProduct+ ' kg sản phẩm !';
        const mess = 'Sản phẩm '+name+' không đủ số lượng';
        showToast(mess)


    }
    function handleAddToBill(index, productId, name, price) {

        const modal = document.getElementById('productModal'+index);
        const viewModel = document.getElementById('viewProductModal'+index);
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

            showAttention(name)
            quantityModel.value = 1;
            modal.querySelector('.btn-close').click();
            return;
        }

        let quantityUpdate = parseFloat(quantityOfProduct) - packPerUnit * quantity;

        modal.querySelector('input[name="quantity"]').setAttribute('data-quantity', quantityUpdate);
        let maxQuantity = parseInt(quantityUpdate/packPerUnit);
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
            ,maxQuantity
        }
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
        console.log(billDetails.maxQuantity);
    }


    function generate(list) {
        let pay = 0;
        let totalPrice = 0;
        let sale = 0;
        let totalLift=0
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
            let salePrice =quantity*unitPer*disCount;
            let liftTotal = product.packing.liftCost;
            let actualSellPrice = parseFloat(unitPrice*unitPer - disCount*unitPer);
            let maxQuan = product.maxQuantity;
            totalPrice += unitPrice * quantity * unitPer
            pay += total;
            sale += quantity* unitPer*disCount;
            totalLift += liftTotal * quantity;
            html += '<div >' +

                '<div class="d-flex justify-content-between align-items-center mb-3">' +
                '<input class="col-md-2 text-center" value="' + parseInt(productId) + '" readonly style="border: none;" hidden="hidden" name="billDetails[' + i + '].product.id">' +
                '<input class="col-md-2 text-center" value="' + nameProduct + '" readonly style="border: none;">' +
                '<input class="col-md-2 text-center" value="' + packaging + '" readonly style="border: none;" name="billDetails[' + i + '].packaging.packageType">' +
                '<input class="col-md-2 text-center" id="input-quantity-' +i +'" value="' + quantity + '" ' +
                'style="border: none;" type="number" name="billDetails[' + i + '].quantity" ' +
                'max="' + maxQuan + '" ' +
                'oninput="if(this.value > ' + maxQuan + ') { showAttention(\'' + nameProduct + '\'); this.value = ' + quantity + '; } else {updateQuantity(' + i + ', this.value, ' + unitPer + ' ,' + quantity + ');}">' +
                '<input class="col-md-2 text-center" value="' + parseFloat(unitPrice * unitPer) + '" readonly style="border: none;" name="billDetails[' + i + '].listedPrice">' +
                '<input class="col-md-2 text-center" value="' + actualSellPrice + '" readonly style="border: none;" name="billDetails[' + i + '].actualSellPrice" hidden="hidden">' +
                '<input class="col-md-1 text-center" value="' + salePrice + '" readonly style="border: none;">' +
                '<input class="col-md-2 text-center" value="' + total + '" readonly style="border: none;" name="billDetails[' + i + '].actualSellPrice">' +
                '<input class="col-md-2 text-center" value="' + liftTotal + '" readonly hidden="hidden"  style="border: none;" name="billDetails[' + i + '].liftPrice">' +
                '<button type="button" class="col-md-1 btn btn-danger btn-sm d-flex align-items-center justify-content-center" style="width: 15px; height: 20px" onClick="removeFromBill('+i+', '+unitPer+')">x</button>'+
                '</div>' +

            '</div>'
            ;
        }


        totalPayment(totalPrice, sale, pay, totalLift);
        billList.innerHTML= html;
    }
    function removeFromBill(index, unitPer) {
        const inputQuanDelete = document.getElementById("input-quantity-"+index);
        console.log(typeof parseFloat(inputQuanDelete.value));
        const inputQuan = parseFloat(inputQuanDelete.value);
        const modal = document.getElementById('productModal'+index);
        let quantityOfProduct = modal.querySelector('input[name="quantity"]').getAttribute('data-quantity');
        let quantityUpdate = parseFloat(quantityOfProduct) + unitPer * inputQuan;
        modal.querySelector('input[name="quantity"]').setAttribute('data-quantity', quantityUpdate);
        let quantityOfProductNew = modal.querySelector('input[name="quantity"]').getAttribute('data-quantity');
        // console.log(quantityOfProduct);
            listSender.splice(index, 1);
            generate(listSender);
    }
    function totalPayment(total, sale, pay, lift){
        const totalPrice = document.getElementById('total-price');
        const salePrice = document.getElementById('sale-price');
        const payment = document.getElementById('price-payment');
        const totalLift = document.getElementById('total-lift')
       totalPrice.value = total;
        salePrice.value =sale;
        payment.value=pay;
        totalLift.value=lift;
    }
    function updateQuantity(index, newQuantity, unitPer, oldQuantity){
        const modal = document.getElementById('productModal'+index);
        let quantityOfProduct = modal.querySelector('input[name="quantity"]').getAttribute('data-quantity');
        let quantityUpdate = parseFloat(quantityOfProduct) + unitPer * oldQuantity - unitPer*newQuantity;

        modal.querySelector('input[name="quantity"]').setAttribute('data-quantity', quantityUpdate);
        let quantityOfProductNew = modal.querySelector('input[name="quantity"]').getAttribute('data-quantity');
        console.log(quantityOfProductNew);
        listSender[index].maxQuantity = parseInt(quantityOfProductNew/unitPer);
        listSender[index].quantity = parseInt(newQuantity);
        generate(listSender);
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
    console.log(customerList);

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
    document.getElementById('save-customer-button').addEventListener('click', function () {
        const name = document.getElementById('customer-name').value;
        const phone = document.getElementById('customer-phone').value;
        const address = document.getElementById('customer-address').value;
        const inputAddress = document.getElementById('cus-add');
        if (name && phone && address) {
            const searchPhoneInput = document.getElementById('search-phone');
            searchPhoneInput.value = name + ' - ' + phone;
            inputAddress.value = address;

            let myModal = bootstrap.Modal.getInstance(document.getElementById('customerModal'));
            myModal.hide();
        } else {
            alert("Vui lòng nhập đầy đủ thông tin: Tên, Số điện thoại và Địa chỉ.");
        }
    });

    // check all quantity before payment
    document.getElementById('submit-but').addEventListener('click', function (event) {
        const formSender = document.getElementById("form-sender");

        if (listSender.length === 0) {
            event.preventDefault(); // Ngăn form submit

            const popup = document.getElementById("popup-message");
            popup.style.display = "block";
            popup.classList.add("fade-in");

            setTimeout(() => {
                popup.classList.remove("fade-in");
                popup.classList.add("fade-out");

                setTimeout(() => {
                    popup.style.display = "none";
                    popup.classList.remove("fade-out");
                }, 1000);
            }, 3000);
        } else {
            formSender.submit();
        }
    });




</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>

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
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
    />
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

    </style>

    <title>Document</title>
</head>

<body>

<!-- start: header -->
<%--<jsp:include page="../layout/header.jsp" />--%>
<!-- end: header -->


<div class="row bg-primary p-2">
    <div class="input-group col-md-3">
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

    <div class="col-md-3">
        <select class="form-control" id="categorySelect">
            <option value="all">All</option>
            <c:forEach var="cate" items="${categoryList}">
                <option value="${cate}">${cate}</option>
            </c:forEach>


        </select>
    </div>

    <div class="col-md-3 d-flex align-items-center">

        <div class="form-check form-check-inline">
            <input
                    class="form-check-input"
                    type="checkbox"
                    id="filter1"
                    value="thom"
            />
            <label class="des form-check-label" for="filter1" >thom</label>
        </div>
        <div class="form-check form-check-inline">
            <input
                    class="form-check-input"
                    type="checkbox"
                    id="filter2"
                    value="deo"
            />
            <label class="des form-check-label" for="filter2">deo</label>
        </div>
        <div class="form-check form-check-inline">
            <input
                    class="form-check-input"
                    type="checkbox"
                    id="filter3"
                    value="bui"
            />
            <label class="des form-check-label" for="filter3">bui</label>
        </div>

    </div>
    <div class="col-md-3">
        <select class="form-control" id="sortSelect">
            <option value="asc">Sắp xếp tăng dần</option>
            <option value="desc">Sắp xếp giảm dần</option>
        </select>
    </div>
</div>

<div class="row bg-secondary">
    <div id="product-list" class="col-md-8 overflow-auto">
        <c:forEach var="product" items="${productList}" varStatus="status">
        <div
                class="product d-flex justify-content-between align-items-center mb-2 mt-2 bg-light p-1"
                data-category="${product.category}"
                data-description="${product.description}"
                data-price="${product.unitPrice}"
        >

                <img src="/asset/img/anh1.jpg" alt="" width="50px" height="50px" />

                <div class="m-2 product-name">${product.name}</div>
                <div class="m-2">
                    <select class="form-control" id="packing-option" data-locate="${status.index}">
                        <c:forEach var="pack" items="${packagingList[status.index]}">

                            <option value="${pack.id}"  id=`option-choice`  >${pack.packageType} </option>
                        </c:forEach>


                    </select>
                </div>
                <div class="m-2">
                    <select class="form-control">
                        <option value="giam100d">Giam 100d</option>
                        <option value="giam200d">Giam 200d</option>
                    </select>
                </div>
                <div class="m-2 text-danger">${product.unitPrice}</div>
                <input placeholder="quantity" type="number" id="quantity-input"/>
                <button class="btn btn-primary add-to-bill" data-dex="${status.index}">Chon </button>

        </div>
        </c:forEach>
    </div>
    <div class="col-md-4 mt-2 ">
        <div class="p-3 bg-light rounded bill">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <span>customer name</span>
                <span>Time</span>
            </div>

            <ul class="nav nav-tabs mb-2">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Hóa đơn</a>
                </li>
            </ul>
            <div class="list-product-bill" id="bill-list">
                <div>
                    <div class="d-flex justify-content-between align-items-center">
                        <div>name</div>
                        <div>type</div>
                        <div>quantity</div>
                        <div>price</div>
                        <div>total</div>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <div>gia giam</div>
                        <div>total gia giam</div>
                    </div>
                </div>
            </div>
            <div>
                <div class="d-flex justify-content-between">
                    <span>Tổng tiền hàng</span>
                    <span>1,925,000</span>
                </div>
                <div class="d-flex justify-content-between">
                    <span>Giảm giá</span>
                    <span>0</span>
                </div>
                <div class="d-flex justify-content-between">
                    <span>Khách cần trả</span>
                    <span class="font-weight-bold text-success">1,925,000</span>
                </div>
                <hr />
            </div>

            <div class="mt-2">
            <textarea
                    class="form-control"
                    rows="2"
                    placeholder="Ghi chú"
            ></textarea>
            </div>

            <div class="text-center mt-3">
                <button class="btn btn-success btn-block" style="height: 50px">
                    Thanh toán
                </button>
            </div>
        </div>
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


    function addToBill(product, id){
        const productName = product.querySelector('.product-name').textContent;
        const productPrice = product.getAttribute('data-price');
        const quantityInput = document.getElementById('quantity-input');
        const packingSelects = document.querySelectorAll('#packing-option');

        packingSelects.forEach(i => {

         if(i.getAttribute("data-locate") === id){
             console.log(i.value);
         }
        })




        // console.log(quantityInput.value);
        //
        // console.log(productName);
        // console.log(productPrice);
    }
    const lis =document.querySelectorAll('.add-to-bill');
    console.log(lis);
    document.querySelectorAll('.add-to-bill').forEach(button => {
        button.addEventListener('click',function (){
            const productIndex = this.getAttribute('data-dex');


            console.log('Product index:', productIndex);


            const product = this.closest('.product');
            addToBill(product, productIndex);
        })
    })


</script>
</body>
</html>

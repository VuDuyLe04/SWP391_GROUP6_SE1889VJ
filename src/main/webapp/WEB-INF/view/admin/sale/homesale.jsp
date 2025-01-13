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
    </style>

    <title>Document</title>
</head>

<body>
<div class="row bg-primary p-2">
    <div class="input-group col-md-4">
        <input
                type="text"
                class="form-control"
                placeholder="Product name"
                aria-label="Recipient's username"
                aria-describedby="basic-addon2"
        />
        <div class="input-group-append">
            <button class="btn btn-success" type="button">Search</button>
        </div>
    </div>

    <div class="col-md-3">
        <select class="form-control">
            <option value="all">All</option>
            <option value="nep">Gạo nếp</option>
            <option value="te">Gạo tẻ</option>
            <option value="nut">Gạo nứt</option>
            <option value="gaodo">Gạo đỏ</option>
        </select>
    </div>

    <div class="col-md-5 d-flex align-items-center">
        <div class="form-check form-check-inline">
            <input
                    class="form-check-input"
                    type="checkbox"
                    id="filter1"
                    value="filter1"
            />
            <label class="form-check-label" for="filter1">Thơm</label>
        </div>
        <div class="form-check form-check-inline">
            <input
                    class="form-check-input"
                    type="checkbox"
                    id="filter2"
                    value="filter2"
            />
            <label class="form-check-label" for="filter2">Dẻo</label>
        </div>
        <div class="form-check form-check-inline">
            <input
                    class="form-check-input"
                    type="checkbox"
                    id="filter3"
                    value="filter3"
            />
            <label class="form-check-label" for="filter3">Bùi</label>
        </div>
    </div>
</div>

<div class="row bg-secondary">
    <div class="col-md-8 overflow-auto">
        <div
                class="product d-flex justify-content-between align-items-center mb-2 mt-2 bg-light p-1"
        >
            <img src="/asset/img/anh1.jpg" alt="" width="50px" height="50px" />

            <div class="m-2">name</div>
            <div class="m-2">
                <select class="form-control">
                    <option value="kg">kg</option>
                    <option value="tui50kg">Túi 50kg</option>
                    <option value="tui25kg">Túi 25kg</option>
                </select>
            </div>
            <div class="m-2">
                <select class="form-control">
                    <option value="giam100d">Giam 100d</option>
                    <option value="giam200d">Giam 200d</option>
                </select>
            </div>
            <div class="m-2 text-danger">price</div>
            <input placeholder="quantity" type="number" />
            <button class="btn btn-primary">Chon</button>
        </div>
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
            <div class="list-product-bill">
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
</body>
</html>

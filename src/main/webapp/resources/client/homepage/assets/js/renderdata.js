function renderProducts(products) {
    const productList = document.getElementById("product-list");
    productList.innerHTML = ""; // Xóa nội dung cũ

    products.forEach(product => {
        const productCard = `
            <div class="product-card product" data-id="${product.id}" 
                data-name="${product.name}" data-price="${product.unitPrice}" 
                data-category="${product.category}">
                <div class="product-image"></div>
                <div>
                    <h5 class="product-name">${product.name}</h5>
                    <p class="text-primary">${product.unitPrice}đ</p>
                </div>
                <div class="d-flex gap-2">
                    <button class="btn btn-info btn-sm" data-bs-toggle="modal"
                            data-bs-target="#viewProductModal${product.id}">
                        Chi tiết
                    </button>
                    <button class="btn btn-primary btn-sm" data-bs-toggle="modal"
                            data-bs-target="#productModal${product.id}">
                        Thêm vào đơn
                    </button>
                </div>
            </div>
        `;
        productList.innerHTML += productCard;
    });
}
function renderModals(productList) {
    var modalContainer = document.getElementById('modal-container');
    modalContainer.innerHTML = '';

    productList.forEach(function(product, index) {
        var productPackagingList = productList[index].packagings;

        var packagingOptions = productPackagingList.map(function(pack) {
            return `<option value="${pack.id}" data-additional="${pack.quantityPerPackage}" data-liftcost="${pack.liftCost}">${pack.packageType}</option>`;
        }).join('');

        // Modal for Product Details
        var detailModal = `
            <div class="modal fade con-detail" id="viewProductModal${product.id}" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Thông tin sản phẩm: ${product.name}</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <img src="${product.imageUrl}" alt="${product.name}" width="50px" height="50px" />
                            <p><strong>Danh mục:</strong> ${product.category}</p>
                            <p><strong>Mô tả:</strong> ${product.description}</p>
                            <p id="listedPrice"><strong>Giá:</strong> ${product.unitPrice}</p>
                            <p id="quantity-product"><strong>Số lượng:</strong> ${product.totalQuantity} kg</p>
                            <p><strong>Vị trí:</strong> ${product.warehouseName}</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        `;

        // Modal for Adding Product to Cart
        var addModal = `
            <div class="modal fade con-add" id="productModal${product.id}" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">${product.name}</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- Quantity -->
                            <div class="mb-3">
                                <label class="form-label">Số lượng:</label>
                                <input type="number" class="form-control quantity-input" name="quantity" min="1" value="1" data-quantity="${product.totalQuantity}">
                            </div>
                            <div class="mb-3" hidden>
                                <label class="form-label">Hidden</label>
                                <input type="number" class="form-control listed-input" name="hide" min="1" value="${product.unitPrice}" data-listed="${product.unitPrice}">
                            </div>
                            <!-- Packaging -->
                            <div class="mb-3">
                                <label class="form-label">Loại đóng gói:</label>
                                <select class="form-control" name="packaging" id="select-pack-${product.id}">
                                    ${packagingOptions}
                                </select>
                            </div>
                            <!-- Discount -->
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
        `;

        // Append the modals to the container
        modalContainer.innerHTML += detailModal + addModal;
    });
}



function loadProducts(storeId) {
    fetch(`/api/getproducts?storeId=${storeId}`)
        .then(response => response.json())
        .then(data => {
            if (data.code === 200) {
                renderProducts(data.data);
                renderModals(data.data);
                attachEventListeners();
            } else {
                console.error("Lỗi khi lấy dữ liệu sản phẩm:", data.message);
            }
        })
        .catch(error => console.error("Lỗi kết nối API:", error));
}

function searchProducts(keyword, storeId) {
    console.log("dang xu li");
    fetch(`/api/searchproduct?key=${encodeURIComponent(keyword)}&storeId=${storeId}`)
        .then(response => response.json())
        .then(data => {
            if (data.code === 200) {
                renderProducts(data.data);
                renderModals(data.data);
                attachEventListeners();
            } else {
                console.error("Lỗi khi tìm kiếm sản phẩm:", data.message);
            }
        })
        .catch(error => console.error("Lỗi kết nối API:", error));
}





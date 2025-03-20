function renderProducts(products) {
    const productList = document.getElementById("product-list");
    productList.innerHTML = ""; // Xóa nội dung cũ

    const fragment = document.createDocumentFragment(); // Tạo một fragment để giảm thao tác DOM

    products.forEach(product => {
        // Tạo div chứa sản phẩm
        const productDiv = document.createElement("div");
        productDiv.classList.add("d-flex", "align-items-center", "gap-3", "border-bottom", "p-2", "product");
        productDiv.setAttribute("data-id", product.id);
        productDiv.setAttribute("data-name", product.name);
        productDiv.setAttribute("data-price", product.unitPrice);
        productDiv.setAttribute("data-category", product.category);

        // Ảnh sản phẩm
        const productImage = document.createElement("div");
        productImage.classList.add("product-image");
        productImage.style.width = "50px";
        productImage.style.height = "50px";
        productImage.style.backgroundColor = "#f1f1f1";

        // Thông tin sản phẩm
        const productInfo = document.createElement("div");
        productInfo.classList.add("flex-grow-1");
        productInfo.innerHTML = `
            <h5 class="product-name mb-1">${product.name}</h5>
            <p class="text-primary mb-0">${product.unitPrice}đ</p>
        `;

        // Nút "Chi tiết"
        const detailButton = document.createElement("button");
        detailButton.classList.add("btn", "btn-info", "btn-sm");
        detailButton.setAttribute("data-bs-toggle", "modal");
        detailButton.setAttribute("data-bs-target", `#viewProductModal${product.id}`);
        detailButton.textContent = "Chi tiết";

        // Nút "Thêm vào đơn"
        const addButton = document.createElement("button");
        addButton.classList.add("btn", "btn-primary", "btn-sm");
        addButton.setAttribute("data-bs-toggle", "modal");
        addButton.setAttribute("data-bs-target", `#productModal${product.id}`);
        addButton.textContent = "Thêm vào đơn";

        // Gộp các phần tử vào productDiv
        productDiv.appendChild(productImage);
        productDiv.appendChild(productInfo);
        productDiv.appendChild(detailButton);
        productDiv.appendChild(addButton);

        // Thêm vào fragment
        fragment.appendChild(productDiv);
    });

    // Gộp tất cả sản phẩm vào productList chỉ một lần (tăng hiệu suất)
    productList.appendChild(fragment);
}

function renderModals(productList) {
    var modalContainer = document.getElementById('modal-container');
    const pathCurrent = window.location.pathname;

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
        if(pathCurrent.includes('saleproduct')){
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
        } else if(pathCurrent.includes('importproduct')){
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
                            
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary add-bill-detail">Xác nhận</button>
                        </div>
                    </div>
                </div>
            </div>
        `;
        }
        // Modal for Adding Product to Cart


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
    const pathCurrent = window.location.pathname;
    fetch(`/api/searchproduct?key=${encodeURIComponent(keyword)}&storeId=${storeId}`)
        .then(response => response.json())
        .then(data => {
            if (data.code === 200) {
                renderProducts(data.data);
                renderModals(data.data);
                if(pathCurrent.includes('saleproduct')){
                    attachEventListeners();
                } else {
                    console.log("dang nhap hang");
                }

            } else {
                console.error("Lỗi khi tìm kiếm sản phẩm:", data.message);
            }
        })
        .catch(error => console.error("Lỗi kết nối API:", error));
}






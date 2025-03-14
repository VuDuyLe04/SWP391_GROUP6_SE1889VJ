function attachEventListeners() {
    document.querySelectorAll(".add-bill-detail").forEach(button => {
        button.removeEventListener("click", addBillDetail); // Xóa sự kiện cũ (nếu có)
        button.addEventListener("click", function () { addBillDetail(this); });
    });
}
document.addEventListener("DOMContentLoaded", async function () {
    await checkAndLoadBill();
});

async function checkAndLoadBill() {
    try {
        const storeId = parseInt(document.getElementById("storeId").textContent);
        let billCheckResponse = await fetch(`/api/getCurrentBill?storeId=${encodeURIComponent(storeId)}`);
        let billCheckData = await billCheckResponse.json();

        if (billCheckData.code === 200 && billCheckData.data) {
            console.log("Tìm thấy hóa đơn hiện tại:", billCheckData.data);
            await loadBillDetails();
        } else {
            console.warn("Không tìm thấy hóa đơn hiện tại.");
        }
    } catch (error) {
        console.error("Lỗi khi kiểm tra hóa đơn:", error);
    }
}

async function addBillDetail(button) {
    let modal = button.closest(".modal");
    let productId = modal.id.replace("productModal", "");
    let quantity = parseInt(modal.querySelector(".quantity-input").value);
    let packagingId = modal.querySelector("select[name='packaging']").value;
    let discount = parseFloat(modal.querySelector("select[name='discount']").value);
    let listed = parseFloat(modal.querySelector('.listed-input').value);
    const storeId = parseInt(document.getElementById("storeId").textContent);

    try {
        let billCheckResponse = await fetch(`/api/getCurrentBill?storeId=${encodeURIComponent(storeId)}`);
        let billData = await billCheckResponse.json();

        if (!billData || billData.code !== 200 || !billData.data) {
            let newBillResponse = await fetch(`/api/addBill?storeId=${encodeURIComponent(storeId)}`);
            let newBillData = await newBillResponse.json();

            if (!newBillData || newBillData.code !== 200) {
                alert("Không thể tạo hóa đơn. Vui lòng thử lại!");
                return;
            }
        }

        let requestData = {
            productId: productId,
            quantity: quantity,
            packagingId: packagingId,
            discount: discount,
            listedPrice: listed,
            actualSellPrice: listed - discount,
        };

        console.log("🚀 Gửi dữ liệu thêm chi tiết hóa đơn:", requestData);

        let detailResponse = await fetch("/api/addBillDetail", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(requestData)
        });

        let responseData = await detailResponse.json();
        console.log("📌 Kết quả thêm chi tiết hóa đơn:", responseData);

        if (responseData.code === 500 && responseData.message.includes("Not enough stock")) {
            alert("🚨 Sản phẩm không đủ số lượng trong kho!");
            return;
        }

        if (responseData.code === 200) {
            console.log("✅ Thêm chi tiết hóa đơn thành công! Chờ cập nhật...");
            showToast(responseData.message)
            await new Promise(resolve => setTimeout(resolve, 300));

            await loadBillDetails();
        } else {

            showToast(responseData.message, false)
        }

    } catch (error) {
        console.error("Lỗi khi thêm chi tiết hóa đơn:", error);
        alert("⚠️ Đã xảy ra lỗi. Vui lòng thử lại!");
    }
}



async function loadBillDetails() {
    try {
        let billDetailsResponse = await fetch("/api/getBillDetails");
        let billDetailsData = await billDetailsResponse.json();

        if (billDetailsData.code !== 200 || !billDetailsData.data) {
            console.warn("Không có chi tiết hóa đơn nào.");
            return;
        }

        console.log("Danh sách chi tiết hóa đơn:", billDetailsData.data);

        let billDetailsContainer = document.getElementById("bill-items");
        billDetailsContainer.innerHTML = ""; // Xóa nội dung cũ

        billDetailsData.data.forEach(detail => {
            let billItem = document.createElement("div");
            billItem.classList.add("bill-item", "d-flex", "justify-content-between", "align-items-center", "p-2", "border-bottom");

            billItem.innerHTML = `
        
        <div class="container">
    <div class="row align-items-center g-0 py-2 border-bottom">
        <!-- Tên sản phẩm -->
        <div class="col-4 overflow-hidden">
            <h6 class="mb-0 text-truncate">${detail.nameProduct}</h6>
            <small class="text-muted">Loại: ${detail.packageType}</small>
        </div>

        <!-- Số lượng & Giá -->
        <div class="col-3 d-flex align-items-center">
            <input type="number" class="form-control text-center me-2 flex-shrink-0" style="width: 60px;" value="${detail.quantity}" onchange="updateQuantity(${detail.id}, this.value,this, ${detail.quantity})" />
            <span class="text-nowrap">x ${detail.listedPrice}đ</span>
        </div>

        <!-- Giảm giá -->
        <div class="col-2 text-danger text-center">
            <span class="text-nowrap">Giảm: ${detail.discount}đ</span>
        </div>

        <!-- Tổng giá -->
        <div class="col-2 fw-bold text-end">
            ${detail.totalPrice ? detail.totalPrice + "đ" : "0đ"}
        </div>

        <!-- Nút xóa -->
        <div class="col-1 text-end">
            <button class="btn btn-danger btn-sm" onclick="removeBillDetail(${detail.id})">
                <i class="fas fa-times"></i>
            </button>
        </div>
    </div>
</div>


    `;

            billDetailsContainer.appendChild(billItem);
        });



    } catch (error) {
        console.error("Lỗi khi tải danh sách hóa đơn:", error);
    }
}
async function removeBillDetail(id) {
    try {
        let response = await fetch(`/api/deletebilldetail/${id}`, {
            method: "DELETE",
            headers: {
                "Content-Type": "application/json"
            }
        });

        let billData = await response.json();
        console.log(billData.data);

        if (billData.code === 200) {
            console.log("Xóa thành công");

            await new Promise(resolve => setTimeout(resolve, 300));

            await loadBillDetails();
        } else {
            alert(billData.message || "Có lỗi xảy ra khi xóa chi tiết hóa đơn.");
        }
    } catch (error) {
        console.error("Lỗi khi xóa chi tiết hóa đơn:", error);
        alert("Không thể kết nối đến máy chủ.");
    }
}

async function updateQuantity(billDetailId, newQuantity, inputElement, oldQuan) {

    console.log(oldQuan);
    // Kiểm tra số lượng hợp lệ
    if (newQuantity < 1) {
        showToast("Số lượng không hợp lệ!", false);
        inputElement.value = oldQuantity; // Khôi phục giá trị cũ
        return;
    }

    try {
        let response = await fetch(`/api/updatequantity/${billDetailId}?quantity=${newQuantity}`, {
            method: "PUT",
            headers: { "Content-Type": "application/json" }
        });

        let data = await response.json();

        if (data.code === 200) {
            showToast("Cập nhật thành công!", true);
            inputElement.dataset.oldValue = newQuantity;
            await loadBillDetails();
        } else {
            showToast("Cập nhật thất bại: " + data.message, false);
            inputElement.value = oldQuan;
        }
    } catch (error) {
        showToast("Lỗi kết nối! Hãy thử lại.", false);
        inputElement.value = oldQuantity;
        console.error("Lỗi kết nối khi cập nhật số lượng:", error);
    }
}



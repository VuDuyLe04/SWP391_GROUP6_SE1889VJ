function attachEventListeners() {
    document.querySelectorAll(".add-bill-detail").forEach(button => {
        button.removeEventListener("click", addBillDetail); // Xóa sự kiện cũ (nếu có)
        button.addEventListener("click", function () { addBillDetail(this); });
    });
}

async function addBillDetail(button) {
    let modal = button.closest(".modal");
    let productId = modal.id.replace("productModal", "");
    let quantity = modal.querySelector(".quantity-input").value;
    let packagingId = modal.querySelector("select[name='packaging']").value;
    let discount = modal.querySelector("select[name='discount']").value;
    let listed = modal.querySelector('.listed-input').value;
    const storeId = parseInt(document.getElementById("storeId").textContent);

    try {
        // Kiểm tra xem đã có hóa đơn hiện tại trong session chưa
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
            listedPrice: listed
        };

        console.log("Gửi dữ liệu thêm chi tiết hóa đơn:", requestData);

        let detailResponse = await fetch("/api/addBillDetail", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(requestData)
        });

        let responseData = await detailResponse.json();
        console.log("Kết quả thêm chi tiết hóa đơn:", responseData);

        if (responseData.code === 200) {
            console.log("Thêm chi tiết hóa đơn thành công! Chờ cập nhật cơ sở dữ liệu...");

            // Chờ 300ms để đảm bảo dữ liệu đã cập nhật
            await new Promise(resolve => setTimeout(resolve, 300));

            // Sau khi thêm thành công, gọi lại loadBillDetails()
            await loadBillDetails();
        } else {
            alert(responseData.message || "Có lỗi xảy ra khi thêm chi tiết hóa đơn.");
        }

    } catch (error) {
        console.error("Lỗi khi thêm chi tiết hóa đơn:", error);
        alert("Đã xảy ra lỗi. Vui lòng thử lại!");
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
        <div class="d-flex flex-column">
            <h6 class="mb-0">${detail.nameProduct}</h6>
            <small class="text-muted">Loại: ${detail.packagingName}</small>
        </div>
        <div>${detail.quantity} x ${detail.listedPrice}đ</div>
        <div class="text-danger">Giảm: ${detail.discount}đ</div>
        <div class="text-end fw-bold">đ</div>
        <button class="btn btn-danger btn-sm" onclick="removeBillDetail(${detail.id})">
            <i class="fas fa-times"></i>
        </button>
    `;

            billDetailsContainer.appendChild(billItem);
        });



    } catch (error) {
        console.error("Lỗi khi tải danh sách hóa đơn:", error);
    }
}

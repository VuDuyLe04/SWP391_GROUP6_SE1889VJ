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
    let billId = localStorage.getItem("billId");

    console.log("AFTER: ", billId);
    const storeId = parseInt(document.getElementById("storeId").textContent);
    try {
        if (!billId || billId === "undefined" || billId === "null") {
            let billData = await fetch(`/api/addBill?storeId=${encodeURIComponent(storeId)}`)
                .then(res => res.json());
            if (!billData || billData.code !== 200) {
                alert("Không thể tạo hóa đơn. Vui lòng thử lại!");
                return;
            }
            console.log("Hóa đơn được tạo thành công:", billData);
            billId = String(billData.data.id);
            localStorage.setItem("billId", billId);
        }

        let requestData = {
            billId: billId,
            productId: productId,
            quantity: quantity,
            packagingId: packagingId,
            discount: discount,
            listedPrice: listed
        };

        console.log(requestData);
        let detailResponse = await fetch("/api/addBillDetail", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(requestData)
        });

        let responseData = await detailResponse.json();
        console.log(responseData);

    } catch (error) {
        console.error(error);
    }
}

function attachEventListeners() {
    document.querySelectorAll(".add-bill-detail").forEach(button => {
        button.removeEventListener("click", addBillDetail);
        button.addEventListener("click", function () { addBillDetail(this); });
    });
}

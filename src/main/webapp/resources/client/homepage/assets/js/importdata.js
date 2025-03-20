function attackEventAddBillImportProduct() {
    document.querySelectorAll(".add-bill-detail").forEach(button => {
        button.removeEventListener("click", addBillDetailImport);
        button.addEventListener("click", function () { addBillDetailImport(this); });
    });
}
let billDetailsList = [];
async function addBillDetailImport(button) {
    let modal = button.closest(".modal");
    let productIdItem = modal.id.replace("productModal", "");
    let quantity = parseInt(modal.querySelector(".quantity-input").value);
    if(quantity< 0 ){
        showToast("Số lượng phải lớn hơn 0", false);

        return;
    }
    let listed = parseFloat(modal.querySelector('.listed-input').value);
    let productName = modal.querySelector('.modal-title').textContent;
    const storeId = parseInt(document.getElementById("storeId").textContent);

    let requestData = {
                productId: productIdItem,
                quantity: quantity,
                importPrice: listed,
                productName: productName
            };
    let existingItem = billDetailsList.find(item => item.productId === productIdItem);
    if (existingItem) {
        existingItem.quantity += quantity;
    } else {
        billDetailsList.push(requestData);
        console.log(billDetailsList);
    }
    renderBillDetails();

}

function updateBillDetail(input, oldValue) {
    let row = input.closest(".row");
    let productId = input.getAttribute("data-id");

    let quantityInput = row.querySelector(".quantity-input");
    let priceInput = row.querySelector(".listed-price-input");

    let quantity = parseInt(quantityInput.value);
    let listedPrice = parseFloat(priceInput.value) || 0;
    console.log(oldValue)
    if (isNaN(quantity) || quantity < 0) {
        showToast("Số lượng phải lớn hơn 0", false);
        quantityInput.value = oldValue;
        return;
    }

    let totalProductPrice = quantity * listedPrice;

    let totalPriceElement = row.querySelector(".price-detail");
    totalPriceElement.textContent = totalProductPrice.toLocaleString() + "đ";

    let billDetail = billDetailsList.find(detail => detail.id == productId);
    if (billDetail) {
        billDetail.quantity = quantity;
        billDetail.listedPrice = listedPrice;
        billDetail.totalProductPrice = totalProductPrice;
    }

    getBillDetailsAndCalculate();
}


function renderBillDetails() {
    let billDetailsContainer = document.getElementById("bill-items");
    billDetailsContainer.innerHTML = ""; // Xóa nội dung cũ

    if (billDetailsList.length === 0) {
        console.warn("Không có sản phẩm trong hóa đơn.");
        return;
    }

    billDetailsList.forEach(detail => {
        let totalProductPrice = detail.quantity * detail.importPrice;

        let billItem = document.createElement("div");
        billItem.classList.add("bill-item", "d-flex", "justify-content-between", "align-items-center", "p-2", "border-bottom");

        billItem.innerHTML = `
            <div class="container p-0 item-bill-details">
                <div class="row align-items-center g-0 py-2 border-bottom">
                    <div class="col-3 overflow-hidden">
                        <h6 class="mb-0 text-truncate">${detail.productName}</h6>
                    </div>
                    <div class="col-3 d-flex align-items-center">
                        <input type="number" class="form-control text-center me-2 flex-shrink-0 quantity-input" style="width: 60px;" 
                            value="${detail.quantity}" 
                            data-id="${detail.id}"
                            oninput="updateBillDetail(this, this.value)"/>
                        <span class="text-nowrap">x ${detail.importPrice}đ</span>
                    </div>
                    <div class="col-2 text-danger text-center">
                        <input type="number" class="form-control text-center me-2 flex-shrink-0 listed-price-input" style="width: 120px;" 
                            value="${detail.importPrice}" 
                            data-id="${detail.id}"
                            oninput="updateBillDetail(this, this.value)"/>
                    </div>
                    <div class="col-3 fw-bold text-center price-detail">
                        ${totalProductPrice.toLocaleString()}đ
                    </div>
                    <div class="col-1 text-end">
                        <button class="btn btn-danger btn-sm" onclick="removeBillItem(${detail.id})">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                </div>
            </div>
        `;
        billDetailsContainer.appendChild(billItem);
    });

    getBillDetailsAndCalculate();
}

function getBillDetailsAndCalculate() {
    let totalBill = 0;
    let billItems = document.querySelectorAll(".item-bill-details");

    billItems.forEach(item => {
        let totalPriceElement = item.querySelector(".price-detail");
        let totalPrice = parseFloat(totalPriceElement.textContent.replace("đ", "").replace(/\./g, "").trim()) || 0;
        totalBill += totalPrice;
    });

    let totalBillElement = document.querySelector(".total-need-pay");
    if (totalBillElement) {
        totalBillElement.textContent = totalBill.toLocaleString() + "đ";
    }
}

function removeBillItem(productId) {
    billDetailsList = billDetailsList.filter(detail => detail.id !== productId);
    renderBillDetails();
}
document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.getElementById("search-phone");
    const suggestionBox = document.getElementById("suggestion-box");
    const debtInfo = document.getElementById("debt-info");
    const paymentOptions = document.getElementById("paymentOptions");
    const paymentInputs = document.getElementById("paymentInputs");
    const amountDue = document.getElementById("amountDue");
    const customerPayment = document.getElementById("customerPayment");
    const billTotalElement = document.querySelector(".bill-summary .text-success");
    let customerBalance = 0;

    async function searchCustomer(phone) {
        if (phone.length < 3) {
            suggestionBox.style.display = "none";
            return;
        }
        try {
            const response = await fetch(`/api/customers/search?phone=${phone}`);
            if (!response.ok) throw new Error(`API trả về lỗi: ${response.status}`);
            const result = await response.json();
            console.log(result)
            if (!result.data || !Array.isArray(result.data)) {
                console.error("API không trả về danh sách khách hàng hợp lệ!", result);
                return;
            }
            showSuggestions(result.data);
        } catch (error) {
            console.error("Lỗi khi tìm khách hàng:", error);
        }
    }

    function showSuggestions(customers) {
        suggestionBox.innerHTML = "";
        if (customers.length === 0) {
            suggestionBox.style.display = "none";
            return;
        }
        customers.slice(0, 5).forEach(customer => {
            const option = document.createElement("div");
            option.classList.add("suggestion-item", "p-2", "border-bottom");
            option.textContent = `${customer.phone} - ${customer.name}`;
            option.style.cursor = "pointer";
            option.addEventListener("click", async () => {
                searchInput.value = `${customer.phone} - ${customer.name}`;
                suggestionBox.style.display = "none";
                console.log()
                await getCustomerBalance(customer.phone);
            });
            suggestionBox.appendChild(option);
        });
        suggestionBox.style.display = "block";
    }

    async function getCustomerBalance(phone) {
        try {
            const response = await fetch(`/api/getbalance?phone=${phone}`);
            if (!response.ok) throw new Error(`Lỗi API: ${response.status}`);
            const result = await response.json();
            if (typeof result.data !== "number") {
                console.error("API không trả về số dư hợp lệ!", result);
                return;
            }
            customerBalance = result.data;
            updateDebtInfo();
            updatePaymentOptions();
            updateAmountDue();
        } catch (error) {
            console.error("Lỗi khi lấy số dư khách hàng:", error);
        }
    }

    function updateDebtInfo() {
        if (customerBalance > 0) {
            debtInfo.textContent = `Khách còn nợ: ${customerBalance.toLocaleString()} VND`;
            debtInfo.className = "alert alert-danger";
        } else {
            debtInfo.textContent = "Không có nợ!";
            debtInfo.className = "alert alert-secondary";
        }
        debtInfo.style.display = "block";
    }
    function updatePaymentOptions() {
        paymentOptions.innerHTML = "";

        const defaultOption = document.createElement("option");
        defaultOption.textContent = "Chọn hành động";
        defaultOption.disabled = true;
        defaultOption.selected = true;
        paymentOptions.appendChild(defaultOption);

        const orderOption = document.createElement("option");
        orderOption.value = "order";
        orderOption.textContent = "Trả đơn hàng";
        paymentOptions.appendChild(orderOption);

        const partialOption = document.createElement("option");
        partialOption.value = "partial";
        partialOption.textContent = "Trả một phần";
        paymentOptions.appendChild(partialOption);

        if (searchInput.value.trim() !== "" && customerBalance !== 0) {
            const allOption = document.createElement("option");
            allOption.value = "all";
            allOption.textContent = "Trả tất cả";
            paymentOptions.appendChild(allOption);
        }
    }


    function updateAmountDue() {
        const selectedOption = paymentOptions.value;
        const billTotal = getAmount(billTotalElement);
        let amountToPay = 0;
        let allowInput = false;

        switch (selectedOption) {
            case "order":
                amountToPay = billTotal;
                break;
            case "all":
                amountToPay = billTotal + customerBalance;
                break;
            case "partial":
                amountToPay = billTotal;
                allowInput = true;
                break;
            default:
                paymentInputs.style.display = "none";
                return;
        }
        paymentInputs.style.display = "block";
        amountDue.value = formatCurrency(amountToPay);
        customerPayment.value = allowInput ? "" : formatCurrency(amountToPay);
        customerPayment.disabled = !allowInput;
    }

    function getAmount(element) {
        return element ? parseInt(element.textContent.replace(/[^\d]/g, ""), 10) || 0 : 0;
    }

    function formatCurrency(amount) {
        return amount.toLocaleString("vi-VN") + " VND";
    }

    searchInput.addEventListener("input", () => {
        searchCustomer(searchInput.value.trim());
    });
    paymentOptions.addEventListener("change", updateAmountDue);
    document.addEventListener("click", function (event) {
        if (!suggestionBox.contains(event.target) && event.target !== searchInput) {
            suggestionBox.style.display = "none";
        }
    });

    updatePaymentOptions();
});


function getBillRequest() {
    const descriptionInput = document.getElementById("description");
    const customerInput = document.getElementById("search-phone");
    const typeSelect = document.getElementById("paymentOptions");
    const totalNeedPayInput = document.getElementById("amountDue");
    const actualPayInput = document.getElementById("customerPayment");

    return {
        description: descriptionInput ? descriptionInput.value.trim() : "",
        customerInfor: customerInput ? customerInput.value.trim() : "",
        type: typeSelect ? typeSelect.value : "",
        createDebt: typeSelect && typeSelect.value !== "order",
        totalNeedPay: totalNeedPayInput ? parseInt(totalNeedPayInput.value.replace(/[^\d]/g, ""), 10) || 0 : 0,
        actualPay: actualPayInput ? parseInt(actualPayInput.value.replace(/[^\d]/g, ""), 10) || 0 : 0,
    };
}
function showToast(message, isSuccess = true) {
    let toastElement = document.getElementById("toastMessage");

    toastElement.querySelector(".toast-body").textContent = message;
    toastElement.classList.remove("bg-success", "bg-danger");
    toastElement.classList.add(isSuccess ? "bg-success" : "bg-danger");

    let toast = new bootstrap.Toast(toastElement);
    toast.show();
}


document.getElementById('create-bill').addEventListener('click', function (){
    const descriptionInput = document.getElementById("description");
    const customerInput = document.getElementById("search-phone");
    const typeSelect = document.getElementById("paymentOptions");
    const totalNeedPayInput = document.getElementById("amountDue");
    const actualPayInput = document.getElementById("customerPayment");
    const requestData = {
        description: descriptionInput ? descriptionInput.value.trim() : "",
        customerInfor: customerInput ? customerInput.value.trim() : "",
        type: typeSelect ? typeSelect.value : "",
        createDebt: typeSelect && typeSelect.value !== "order",
        totalNeedPay: totalNeedPayInput ? parseInt(totalNeedPayInput.value.replace(/[^\d]/g, ""), 10) || 0 : 0,
        actualPay: actualPayInput ? parseInt(actualPayInput.value.replace(/[^\d]/g, ""), 10) || 0 : 0,
        billDetailsList: billDetailsList,
    };

    console.log("Dữ liệu gửi đi:", requestData);

    // Gửi request đến server
    fetch("/api/importproduct", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(requestData)
    })
        .then(response => response.json())
        .then(data => {
            console.log("Phản hồi từ server:", data);
            if (data.code === 200) {
                showToast(data.message, true)
                setTimeout(() => {
                    location.reload();
                }, 1000);
            } else {
                showToast(data.message, false)
            }
        })
        .catch(error => {
            console.error("Lỗi khi gửi yêu cầu:", error);
            alert("Có lỗi xảy ra khi tạo hóa đơn. Vui lòng thử lại!");
        });
});




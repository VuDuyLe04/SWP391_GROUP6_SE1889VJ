function attackEventAddBillImportProduct() {
    document.querySelectorAll(".add-bill-detail").forEach(button => {
        button.removeEventListener("click", addBillDetailImport);
        button.addEventListener("click", function () { addBillDetailImport(this); });
    });
}
let billDetailsList = [];
function addBillDetailImport(button) {
    let modal = button.closest(".modal");
    let productIdItem = modal.id.replace("productModal", "");
    let quantity = parseInt(modal.querySelector(".quantity-input").value);
    if (isNaN(quantity) || quantity < 1) {
        showToast("Số lượng phải lớn hơn 0", false);
        return;
    }

    let listed = parseFloat(modal.querySelector('.listed-input').value);
    let productName = modal.querySelector('.modal-title').textContent;

    let existingItem = billDetailsList.find(item => item.productId === productIdItem);
    if (existingItem) {
        existingItem.quantity += quantity; // Cộng dồn số lượng
    } else {
        billDetailsList.push({
            productId: productIdItem,
            quantity: quantity,
            importPrice: listed,
            productName: productName
        });
    }
    console.log(billDetailsList)
    renderBillDetails();
}
function resetPaymentOptions() {
    let paymentOptions = document.getElementById("paymentOptions");
    let paymentInputs = document.getElementById("paymentInputs");

    if (paymentOptions) {
        paymentOptions.innerHTML = `
            <option disabled selected>Chọn hành động</option>
            <option value="order">Trả đơn hàng</option>
            <option value="partial">Trả một phần</option>
        `;

        if (customerBalance !== 0) {
            if (customerBalance < 0) {
                paymentOptions.innerHTML += `<option value="all">Trả tất cả</option>`;
            } else {
                paymentOptions.innerHTML += `<option value="deduct">Trả trừ nợ</option>`;
            }
        }

    }

    if (paymentInputs) {
        paymentInputs.style.display = "none"; // Ẩn các input nhập số tiền nếu có
    }
}
function updateQuantity(input) {
    let row = input.closest(".row");
    let productId = input.getAttribute("data-id");
    let oldValue = input.getAttribute("data-old-value");
    let quantity = parseInt(input.value);

    // Kiểm tra tính hợp lệ
    if (isNaN(quantity) || quantity <= 0) {
        showToast("Số lượng phải lớn hơn 0", false);
        // Reset về giá trị cũ
        input.value = oldValue;
        return;
    }

    // Cập nhật giá trị cũ
    input.setAttribute("data-old-value", input.value);

    // Tính toán giá tiền
    let priceInput = row.querySelector(".listed-price-input");
    let listedPrice = parseFloat(priceInput.value) || 0;
    let totalProductPrice = quantity * listedPrice;

    // Cập nhật UI
    let totalPriceElement = row.querySelector(".price-detail");
    totalPriceElement.textContent = totalProductPrice.toLocaleString() + "đ";

    // Cập nhật đối tượng billDetail
    let billDetail = billDetailsList.find(detail => detail.productId == productId);
    if (billDetail) {
        billDetail.quantity = quantity;
        billDetail.totalProductPrice = totalProductPrice;
    }

    getBillDetailsAndCalculate();
    resetPaymentOptions();
}

function updatePrice(input) {
    let row = input.closest(".row");
    let productId = input.getAttribute("data-id");
    let oldValue = input.getAttribute("data-old-value");
    let listedPrice = parseFloat(input.value) || 0;

    // Kiểm tra tính hợp lệ
    if (listedPrice < 0) {
        showToast("Giá phải lớn hơn hoặc bằng 0", false);
        // Reset về giá trị cũ
        input.value = oldValue;
        return;
    }

    // Cập nhật giá trị cũ
    input.setAttribute("data-old-value", input.value);

    // Tính toán giá tiền
    let quantityInput = row.querySelector(".quantity-input");
    let quantity = parseInt(quantityInput.value) || 0;
    let totalProductPrice = quantity * listedPrice;

    // Cập nhật UI
    let totalPriceElement = row.querySelector(".price-detail");
    totalPriceElement.textContent = totalProductPrice.toLocaleString() + "đ";

    // Cập nhật đối tượng billDetail
    let billDetail = billDetailsList.find(detail => detail.productId == productId);
    if (billDetail) {
        billDetail.listedPrice = listedPrice;
        billDetail.totalProductPrice = totalProductPrice;
    }

    getBillDetailsAndCalculate();
    resetPaymentOptions();
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
                    <div class="col-2 overflow-hidden">
                        <h6 class="mb-0 text-truncate">${detail.productName}</h6>
                    </div>
                    <div class="col-2 d-flex align-items-center justify-content-center">
    <input type="number" class="form-control text-center me-2 flex-shrink-0 quantity-input" 
           style="width: 120px;" 
           value="${detail.quantity}" 
           data-id="${detail.productId}" 
           data-old-value="${detail.quantity}"
           oninput="updateQuantity(this)" 
           id="quantity-in" />
</div>
<div class="col-2 d-flex align-items-center justify-content-center">
    <span class="text-nowrap">x ${detail.importPrice}đ</span>
</div>

                    <div class="col-2 text-danger text-center justify-content-center">
    <input type="number" class="form-control text-center me-2 flex-shrink-0 listed-price-input" 
           style="width: 120px;" 
           value="${detail.importPrice}" 
           data-id="${detail.productId}"
           data-old-value="${detail.importPrice}"
           oninput="updatePrice(this)"/>
</div>
                    <div class="col-3 fw-bold text-center price-detail">
                        ${totalProductPrice.toLocaleString()}đ
                    </div>
                    <div class="col-1 text-end">
                        <button class="btn btn-danger btn-sm" onclick="removeBillItem(${detail.productId})">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                </div>
            </div>
        `;
        billDetailsContainer.appendChild(billItem);
    });
    getBillDetailsAndCalculate();
    resetPaymentOptions()

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
        document.getElementById("total-bill").textContent = totalBill.toLocaleString() + "d";

    }
}

function removeBillItem(productId) {
    console.log("Product ID cần xóa:"+ typeof productId);
    console.log("Danh sách trước khi xóa:", billDetailsList);

    let index = billDetailsList.findIndex(detail => parseInt(detail.productId) === productId);
    console.log(index);
    if (index !== -1) {
        billDetailsList.splice(index, 1);
        console.log("Sản phẩm đã bị xóa:", productId);
    } else {
        console.warn("Không tìm thấy sản phẩm để xóa!");
    }

    console.log("Danh sách sau khi xóa:", billDetailsList);
    let totalBillElement = document.querySelector(".total-need-pay");
    if (totalBillElement) {
        totalBillElement.textContent =  "0đ";
    }
    renderBillDetails();
    resetPaymentOptions();
    getBillDetailsAndCalculate()
}
let customerBalance = 0;
document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.getElementById("search-phone");
    const suggestionBox = document.getElementById("suggestion-box");
    const debtInfo = document.getElementById("debt-info");
    const paymentOptions = document.getElementById("paymentOptions");
    const paymentInputs = document.getElementById("paymentInputs");
    const amountDue = document.getElementById("amountDue");
    const customerPayment = document.getElementById("customerPayment");
    const billTotalElement = document.querySelector(".bill-summary .text-success");


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
        } else if(customerBalance < 0){
            debtInfo.textContent = `Cửa hàng còn nợ: ${customerBalance*(-1).toLocaleString()} VND`;
            debtInfo.className = "alert alert-primary";
        } else{
            debtInfo.textContent = "Không có nợ!";
            debtInfo.className = "alert alert-secondary";
        }
        debtInfo.style.display = "block";
    }
    function hiddenDebt(){
        debtInfo.style.display = "none";
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

        if (customerBalance !== 0) {
            if (customerBalance < 0) {
                const allOption = document.createElement("option");
                allOption.value = "all";
                allOption.textContent = "Trả tất cả";
                paymentOptions.appendChild(allOption);
            } else {
                const deductOption = document.createElement("option");
                deductOption.value = "deduct";
                deductOption.textContent = "Trả trừ nợ";
                paymentOptions.appendChild(deductOption);
            }
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
                amountToPay = billTotal - customerBalance;

                break;
            case "partial":
                amountToPay = billTotal;
                allowInput = true;
                break;
            case "deduct":
                console.log(customerBalance * -1);
                if(customerBalance > billTotal){
                    amountToPay = 0;
                } else {
                    amountToPay = billTotal - customerBalance;
                }


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
        const trimmedValue = searchInput.value.trim();
        searchCustomer(trimmedValue);
        if (trimmedValue === "") {
            hiddenDebt();
            paymentOptions.style.display = "none";
            paymentInputs.style.display = "none";
        } else {
            paymentOptions.style.display = "block";
        }
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
    const quantityIn = document.getElementById("quantity-in");
    const liftInput = document.getElementById("bocVacCheckbox");

    return {
        description: descriptionInput ? descriptionInput.value.trim() : "",
        customerInfor: customerInput ? customerInput.value.trim() : "",
        type: typeSelect ? typeSelect.value : "",
        createDebt: typeSelect && typeSelect.value !== "order",
        totalNeedPay: totalNeedPayInput ? parseInt(totalNeedPayInput.value.replace(/[^\d]/g, ""), 10) || 0 : 0,
        actualPay: actualPayInput ? parseInt(actualPayInput.value.replace(/[^\d]/g, ""), 10) || 0 : 0,
        // loi o day
        quantity: parseFloat(quantityIn.value),
        liftInput: liftInput.checked
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
    const liftInput = document.getElementById("bocVacCheckbox");

    const requestData = {
        description: descriptionInput ? descriptionInput.value.trim() : "",
        customerInfor: customerInput ? customerInput.value.trim() : "",
        type: typeSelect ? typeSelect.value : "",
        createDebt: typeSelect && typeSelect.value !== "order",
        totalNeedPay: totalNeedPayInput ? parseInt(totalNeedPayInput.value.replace(/[^\d]/g, ""), 10) || 0 : 0,
        actualPay: actualPayInput ? parseInt(actualPayInput.value.replace(/[^\d]/g, ""), 10) || 0 : 0,
        billDetailsList: billDetailsList,
        liftInput: liftInput.checked
    };

    console.log("Dữ liệu gửi đi:", requestData);
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

async function addCustomer() {
    let customerData = {
        cusName: document.getElementById("customer-name").value.trim(),
        cusPhone: document.getElementById("customer-phone").value.trim(),
        cusAddress: document.getElementById("customer-address").value.trim()
    };

    console.log(customerData);
    try {
        let response = await fetch("/api/addcustomer", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(customerData)
        });

        let result = await response.json();

        if (response.ok) {
            showToast("Thêm khách hàng thành công!", true);
            let modal = bootstrap.Modal.getInstance(document.getElementById("customerModal"));
            modal.hide();
        } else {
            showToast("Lỗi: " + result.message, false);
        }
    } catch (error) {
        console.error("Lỗi khi gửi yêu cầu:", error);
        showToast("Có lỗi xảy ra, vui lòng thử lại!", false);
    }
}
const buttonAddCustomer = document.getElementById("save-customer-button");
buttonAddCustomer.addEventListener("click", function (event){
    if(!validateCustomerForm()){
        event.preventDefault();
    } else {
        addCustomer();
    }

});
function validateCustomerForm() {
    let isValid = true;

    let name = document.getElementById("customer-name").value.trim();
    let phone = document.getElementById("customer-phone").value.trim();
    let address = document.getElementById("customer-address").value.trim();

    let phoneError = document.getElementById("phone-error");
    let nameError = document.getElementById("name-error");
    let addressError = document.getElementById("address-error");

    // Kiểm tra tên
    if (name === "") {
        nameError.hidden = false;
        isValid = false;
    } else {
        nameError.hidden = true;  // Ẩn lỗi nếu nhập đúng
    }

    // Kiểm tra số điện thoại
    let phoneRegex = /^(0[2-9]{1}[0-9]{8,9})$/;
    if (!phoneRegex.test(phone)) {
        phoneError.hidden = false;
        isValid = false;
    } else {
        phoneError.hidden = true;
    }

    // Kiểm tra địa chỉ
    if (address === "") {
        addressError.hidden = false;
        isValid = false;
    } else {
        addressError.hidden = true;
    }

    return isValid;
}



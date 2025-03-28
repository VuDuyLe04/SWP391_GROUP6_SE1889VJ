document.addEventListener('DOMContentLoaded', function() {
    const tabList = document.querySelector('.tab-list');
    const tabAddBtn = document.querySelector('.tab-add-btn');
    let tabCounter = 1;

    // Lưu trữ dữ liệu hóa đơn cho mỗi tab
    const billsData = {};

    // Khởi tạo dữ liệu cho tab đầu tiên
    billsData[1] = createEmptyBill();

    let activeTabId = 1;

    function createEmptyBill() {
        return {
            items: [],
            totalAmount: '0đ',
            discount: '0đ',
            finalAmount: '0đ',
            customer: '',
            note: ''
        };
    }

    function saveCurrentBillState() {
        if (!billsData[activeTabId]) return;

        billsData[activeTabId] = {
            items: Array.from(document.querySelectorAll('.bill-items .bill-item')).map(item => item.outerHTML),
            totalAmount: document.querySelector('.summary-row:nth-child(1) span:last-child').textContent,
            discount: document.querySelector('.summary-row:nth-child(2) span:last-child').textContent,
            finalAmount: document.querySelector('.summary-row:nth-child(3) span:last-child').textContent,
            customer: document.getElementById('search-phone').value,
            note: document.querySelector('.bill-summary textarea').value
        };
    }

    function loadBillState(tabId) {
        if (!billsData[tabId]) return;

        const billData = billsData[tabId];

        document.querySelector('.bill-items').innerHTML = billData.items.join('');
        document.querySelector('.summary-row:nth-child(1) span:last-child').textContent = billData.totalAmount;
        document.querySelector('.summary-row:nth-child(2) span:last-child').textContent = billData.discount;
        document.querySelector('.summary-row:nth-child(3) span:last-child').textContent = billData.finalAmount;
        document.getElementById('search-phone').value = billData.customer;
        document.querySelector('.bill-summary textarea').value = billData.note;
        document.querySelector('.bill-header h4').textContent = `Hóa đơn #${tabId}`;

        attachDeleteButtonListeners();
    }

    function attachDeleteButtonListeners() {
        document.querySelectorAll('.bill-items .bill-item button').forEach(button => {
            button.addEventListener('click', function() {
                this.closest('.bill-item').remove();
                saveCurrentBillState();
            });
        });
    }

    function createNewTab() {
        saveCurrentBillState();

        tabCounter++;

        const newTab = document.createElement('div');
        newTab.classList.add('tab');
        newTab.dataset.tabId = tabCounter;
        newTab.innerHTML = `<span>Hóa đơn #${tabCounter}</span><button class="tab-close">&times;</button>`;

        tabAddBtn.insertAdjacentElement('beforebegin', newTab);

        newTab.addEventListener('click', function() {
            saveCurrentBillState();
            document.querySelectorAll('.tab').forEach(tab => tab.classList.remove('active'));
            newTab.classList.add('active');
            activeTabId = parseInt(newTab.dataset.tabId);
            loadBillState(activeTabId);
        });

        newTab.querySelector('.tab-close').addEventListener('click', function(e) {
            e.stopPropagation();
            if (newTab.classList.contains('active')) {
                const prevTab = newTab.previousElementSibling || newTab.nextElementSibling;
                if (prevTab && prevTab !== tabAddBtn) {
                    prevTab.click();
                }
            }
            delete billsData[newTab.dataset.tabId];
            newTab.remove();
        });

        billsData[tabCounter] = createEmptyBill();
        newTab.click();
    }

    const firstTab = document.querySelector('.tab');
    if (firstTab) {
        firstTab.addEventListener('click', function() {
            document.querySelectorAll('.tab').forEach(tab => tab.classList.remove('active'));
            this.classList.add('active');
            activeTabId = parseInt(this.dataset.tabId || 1);
            loadBillState(activeTabId);
        });

        firstTab.querySelector('.tab-close').addEventListener('click', function(e) {
            e.stopPropagation();
            alert('Không thể đóng tab đầu tiên');
        });

        firstTab.dataset.tabId = 1;
    }

    tabAddBtn.addEventListener('click', createNewTab);

    window.tabSystem = {
        getActiveTabId: () => activeTabId,
        saveCurrentBillState: saveCurrentBillState,
        loadBillState: loadBillState
    };
});




// add new customer
const buttonAddCustomer = document.getElementById("save-customer-button");
buttonAddCustomer.addEventListener("click", function (event){
    if(!validateCustomerForm()){
        event.preventDefault();
    } else {
        addCustomer();
    }

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


function showToast(message, isSuccess = true) {
    let toastElement = document.getElementById("toastMessage");

    toastElement.querySelector(".toast-body").textContent = message;
    toastElement.classList.remove("bg-success", "bg-danger");
    toastElement.classList.add(isSuccess ? "bg-success" : "bg-danger");

    let toast = new bootstrap.Toast(toastElement);
    toast.show();
}

//reset form
document.addEventListener("DOMContentLoaded", function () {
    let customerModal = document.getElementById("customerModal");

    customerModal.addEventListener("hidden.bs.modal", function () {
        document.getElementById("customer-name").value = "";
        document.getElementById("customer-phone").value = "";
        document.getElementById("customer-address").value = "";

        document.getElementById("name-error").hidden = true;
        document.getElementById("phone-error").hidden = true;
        document.getElementById("address-error").hidden = true;
    });
});
let customerBalance = 0;

//search customer by Phone
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
        if (phone.length < 1) {
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
    async function checkBillExistence(storeId) {
        try {
            let billCheckResponse = await fetch(`/api/getCurrentBill?storeId=${encodeURIComponent(storeId)}`);
            if (!billCheckResponse.ok) throw new Error(`Lỗi API: ${billCheckResponse.status}`);

            let billData = await billCheckResponse.json();

            // Kiểm tra xem billData có hợp lệ không
            return billData && Object.keys(billData).length > 0;
        } catch (error) {
            console.error("Lỗi khi kiểm tra hóa đơn:", error);
            return false; // Giả định là không có hóa đơn nếu có lỗi
        }
    }
    async function updatePaymentOptions() {
        paymentOptions.innerHTML = "";

        if (searchInput.value.trim() === "") {
            paymentOptions.style.display = "none";
            return;
        }

        // Kiểm tra xem có hóa đơn không
        let hasBill = await checkBillExistence(storeId);
        if (!hasBill) {
            paymentOptions.style.display = "none";
            console.warn("Không có hóa đơn hiện tại, vô hiệu hóa tùy chọn thanh toán.");
            return;
        }

        paymentOptions.style.display = "block";

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
            if (customerBalance > 0) {
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
        console.log(selectedOption)
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
            case "deduct":
                console.log(customerBalance * -1);
                if(billTotal == 0){
                    amountToPay = customerBalance * -1;
                } else if(billTotal < customerBalance *(-1)){
                    console.log("Số tiền phải trả: " + 0);
                    amountToPay = 0
                } else {
                    amountToPay = billTotal + customerBalance;

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
    const liftInput = document.getElementById("bocVacCheckbox");
    let customerInfor = customerInput ? customerInput.value.trim() : "";
    let type = typeSelect ? typeSelect.value : "";

    if (customerInfor === "") {
        type = "order";
    }

    return {
        description: descriptionInput ? descriptionInput.value.trim() : "",
        customerInfor: customerInfor,
        type: type,
        createDebt: customerInfor !== "" && type !== "order", // Nếu rỗng hoặc type = "order" thì false
        totalNeedPay: totalNeedPayInput ? parseInt(totalNeedPayInput.value.replace(/[^\d]/g, ""), 10) || 0 : 0,
        actualPay: actualPayInput ? parseInt(actualPayInput.value.replace(/[^\d]/g, ""), 10) || 0 : 0,
        liftInput: liftInput.checked
    };
}




// Ví dụ sử dụng
async function updateFinalBill() {
    // const billRequest = getBillRequest(); // Lấy dữ liệu từ giao diện
    // console.log(billRequest);
    try {
        const storeId = parseInt(document.getElementById("storeId").textContent);
        let billCheckResponse = await fetch(`/api/getCurrentBill?storeId=${encodeURIComponent(storeId)}`);
        let billCheckData = await billCheckResponse.json();

        if (!billCheckData.data) {
            showToast("Hãy thêm sản phẩm vào hóa đơn", false);
            return;
        }

        const billRequest = getBillRequest(); // Lấy dữ liệu từ giao diện
        console.log(billRequest);

        const response = await fetch("/api/updatefinalbill", {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(billRequest),
        });
        const result = await response.json();
        console.log(result);
        if (response.ok) {
            if(result.code != 200){
                showToast(result.message, false)
            } else {
                showToast("Hoàn tất đơn hàng", true);
                setTimeout(() => {
                    location.reload();
                }, 1500);
            }

        } else {
            showToast("Lỗi cập nhật hóa đơn: " + result.message, false);
        }
    } catch (error) {
        console.error("Lỗi khi gửi yêu cầu cập nhật hóa đơn:", error);
        showToast("Hãy chọn sản phẩm vào đơn hàng", false);
    }
}


// Gọi hàm khi nhấn nút cập nhật
document.getElementById("create-bill").addEventListener("click", updateFinalBill);









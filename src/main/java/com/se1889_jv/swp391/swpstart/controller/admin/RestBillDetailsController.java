package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.config.RabbitMQConfig;
import com.se1889_jv.swp391.swpstart.domain.*;
import com.se1889_jv.swp391.swpstart.domain.dto.*;
import com.se1889_jv.swp391.swpstart.exception.AppException;
import com.se1889_jv.swp391.swpstart.exception.ErrorException;
import com.se1889_jv.swp391.swpstart.repository.BillDetailRepository;
import com.se1889_jv.swp391.swpstart.service.implementservice.*;
import com.se1889_jv.swp391.swpstart.util.Utility;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.AmqpException;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
@Slf4j
public class RestBillDetailsController {
    @Autowired
    CustomerService customerService;
    @Autowired
    BillService billService;
    @Autowired
    StoreService storeService;
    @Autowired
    BillDetailService billDetailService;
    @Autowired
    RabbitTemplate rabbitTemplate;
    @Autowired
    ProductService productService;
    @Autowired
    private UserService userService;
    @Autowired
    private DebtReceiptService debtReceiptService;
    @PostMapping("/addBillDetail")
    public ApiResponse<String> addBillDetail(@RequestBody BillDetailRequest billDetail, HttpSession session) {
        Long billId = (Long) session.getAttribute("currentBillId");
        if (billId == null) {
            return new ApiResponse<>(400, "No active bill found", null);
        }
        billDetail.setBillId(billId);

        // Gửi vào RabbitMQ và chờ phản hồi từ consumer
        ApiResponse<String> response = (ApiResponse<String>) rabbitTemplate.convertSendAndReceive(
                RabbitMQConfig.BILL_QUEUE, billDetail
        );

        if (response == null) {
            return new ApiResponse<>(202, "Request is being processed...", null);
        }

        return response;
    }



    @GetMapping("/getCurrentBill")
    public ApiResponse<Map<String, Long>> getCurrentBill(HttpSession session) {
        ApiResponse<Map<String, Long>> response = new ApiResponse<>();
        Long billId = (Long) session.getAttribute("currentBillId");

        if (billId != null) {
            Map<String, Long> data = new HashMap<>();
            data.put("id", billId);
            response.setData(data);
            response.setCode(200);
            response.setMessage("Success");
        } else {
            response.setCode(404);
            response.setMessage("No active bill found");
        }

        return response;
    }
    @GetMapping("/addBill")
    public ApiResponse<Bill> addBill(@RequestParam("storeId") Long storeId, HttpSession session) {
        ApiResponse<Bill> bill = new ApiResponse<>();
        Bill billRequest = new Bill();
        billRequest.setStore(storeService.findStoreById(storeId));
        Bill createdBill = billService.createBillForFirstDetail(billRequest);

        // Lưu billId vào session
        session.setAttribute("currentBillId", createdBill.getId());
        bill.setData(createdBill);
        bill.setCode(200);
        bill.setMessage("Success");
        return bill;
    }
    @GetMapping("/getproducts")
    public ApiResponse<List<ProductResponse>> getProduct(@RequestParam("storeId") Long storeId){
        Pageable pageable = PageRequest.of(0,8);
        ApiResponse<List<ProductResponse>> response = new ApiResponse<>();
        response.setCode(200);
        response.setMessage("Success");
        response.setData(productService.getAllProductForSale(storeId, pageable));
        return response;
    }
    @GetMapping("/searchproduct")
    public ApiResponse<List<ProductResponse>> searchProduct(
            @RequestParam("key") String key,
            @RequestParam("storeId") Long storeId) {

        Pageable pageable = PageRequest.of(0, 8);
        ApiResponse<List<ProductResponse>> response = new ApiResponse<>();
        response.setCode(200);
        response.setMessage("Success");

        if (key == null || key.trim().isEmpty()) {
            response.setData(productService.getAllProductForSale(storeId, pageable));
        } else {
            response.setData(productService.getProductBySearchKeyword(key, pageable, storeId));
        }

        return response;
    }
    @PostMapping("/addcustomer")
    public ApiResponse<CustomerResponse> addCustomer(@RequestBody CustomerRequest customerRequest) {
        ApiResponse<CustomerResponse> response = new ApiResponse<>();
        response.setCode(200);
        response.setMessage("Success");
        response.setData(customerService.createCustomer(customerRequest));
        return response;
    }
    @GetMapping("/customers/search")
    public ApiResponse<List<CustomerResponse>> searchCustomerByPhone(@RequestParam("phone") String phone) {
        Pageable pageable = PageRequest.of(0,4);
        ApiResponse<List<CustomerResponse>> response = new ApiResponse<>();
        response.setCode(200);
        response.setMessage("Success");
        response.setData(customerService.recomendedCustomer(phone, pageable));
        return response;
    }
    @DeleteMapping("/deletebilldetail/{id}")
    public ApiResponse<String> deleteBillDetail(@PathVariable("id") Long billId) {
        ApiResponse<String> response = new ApiResponse<>();
        billDetailService.deleteBillDetail(billId);
        response.setCode(200);
        response.setMessage("Success");
        response.setData("Xóa thành công");
        return response;
    }
    @GetMapping("/getBillDetails")
    public ApiResponse<List<BillDetailResponse>> getBillDetails(HttpSession session) {
        ApiResponse<List<BillDetailResponse>> response = new ApiResponse<>();

        // Lấy Bill từ session
        Long billId = (Long) session.getAttribute("currentBillId");
        Bill currentBill = billService.findBillById(billId);

        if (currentBill == null) {
            response.setCode(404);
            response.setMessage("Không tìm thấy hóa đơn trong session.");
            response.setData(Collections.emptyList());
            return response;
        }

        try {
            List<BillDetailResponse> billDetailResponses = billDetailService.getBillDetails(currentBill.getId());
            response.setCode(200);
            response.setMessage("Lấy danh sách chi tiết hóa đơn thành công.");
            response.setData(billDetailResponses);
        } catch (AppException e) {
            response.setCode(500);
            response.setMessage(e.getMessage());
            response.setData(Collections.emptyList());
        }

        return response;
    }
    @PutMapping("/updatequantity/{id}")
    public ApiResponse<String> updateQuantity(@PathVariable("id") Long billId, @RequestParam Double quantity) {
        UpdateQuantityRequest updateRequest = new UpdateQuantityRequest(billId, quantity);

        // Gửi vào queue để xử lý
        ApiResponse<String> response = (ApiResponse<String>) rabbitTemplate.convertSendAndReceive(
                RabbitMQConfig.BILL_QUEUE, updateRequest
        );

        if (response == null) {
            return new ApiResponse<>(202, "Request is being processed...", null);
        }

        return response;
    }

    @GetMapping("gettotalprice/{id}")
    public ApiResponse<Double> getTotalPrice(@PathVariable("id") Long billId) {
        ApiResponse<Double> response = new ApiResponse<>();
        response.setCode(200);
        response.setMessage("Success");
        response.setData(billDetailService.getTotalPrice(billId));
        return response;
    }
    @GetMapping("getbalance")
    public ApiResponse<Double> getBalance(@RequestParam String phone) {
        ApiResponse<Double> response = new ApiResponse<>();
        response.setCode(200);
        response.setMessage("Success");
        response.setData(userService.getBalanceFromUser(phone));
        return response;
    }
    @PutMapping("/updatefinalbill")
    public ApiResponse<Bill> updateBill(@RequestBody BillRequest request, HttpSession session) {
        Long billId = (Long) session.getAttribute("currentBillId");
        if (billId == null) {
            return new ApiResponse<>(400, "Bill ID is missing in session", null);
        }

        ApiResponse<Bill> response = new ApiResponse<>();
        response.setCode(200);
        response.setMessage("Success");

        try {
            if (request.isCreateDebt()) {
                if(request.getCustomerInfor().isEmpty() || request.getCustomerInfor() == null) {
                    throw new AppException(ErrorException.DEBT_DONT_HAVE_CUSTOMER);
                }
                // Tạo DebtReceipt
                DebtReceipt debtReceipt = debtReceiptService.createDebtReceiption(request, Utility.getUserInSession());
                log.info("Tạo hóa đơn nợ: {}", debtReceipt.toString());

                // Tạo DebtRequest để gửi đến RabbitMQ
                DebtRequest debtRequest = new DebtRequest(debtReceipt.getId());
                log.info("Gửi DebtRequest đến RabbitMQ: {}", debtRequest);

                rabbitTemplate.convertAndSend(RabbitMQConfig.DEBT_QUEUE, debtRequest);
                log.info("Đã gửi DebtRequest vào RabbitMQ queue");

            }

            // Cập nhật hóa đơn
            Bill updatedBill = billService.updateBill(request, billId);
            response.setData(updatedBill);

            // Xóa billId khỏi session sau khi xử lý xong
            session.removeAttribute("currentBillId");

            return response;

        } catch (AmqpException e) {
            log.error("Lỗi RabbitMQ khi gửi DebtRequest", e);
            return new ApiResponse<>(500, "Lỗi khi gửi yêu cầu xử lý nợ: " + e.getMessage(), null);
        } catch (Exception e) {
            log.error("Lỗi khi xử lý cập nhật hóa đơn", e);
            return new ApiResponse<>(500, "Lỗi hệ thống: " + e.getMessage(), null);
        }
    }
    @PutMapping("/updateactual/{id}")
    public ApiResponse<BillDetailResponse> updateActual(@PathVariable("id") Long billDetailId,@RequestParam  Double actualPrice) {
        ApiResponse<BillDetailResponse> response = new ApiResponse<>();
        response.setCode(200);
        response.setMessage("Success");
        response.setData(billDetailService.updateActualPrice(billDetailId, actualPrice));
        return response;
    }




}

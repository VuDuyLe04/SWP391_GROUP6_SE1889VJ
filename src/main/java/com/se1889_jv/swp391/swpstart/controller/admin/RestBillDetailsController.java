package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.config.RabbitMQConfig;
import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.BillDetail;
import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.domain.dto.*;
import com.se1889_jv.swp391.swpstart.repository.BillDetailRepository;
import com.se1889_jv.swp391.swpstart.service.implementservice.*;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
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
    @GetMapping("")
    public String hello() {
        return "Hello World";
    }
    @PostMapping("/addBillDetail")
    public ApiResponse<String> addBillDetail(@RequestBody BillDetailRequest billDetail) {
        rabbitTemplate.convertAndSend(RabbitMQConfig.QUEUE_NAME, billDetail);
        ApiResponse<String> response = new ApiResponse<>();
        response.setCode(200);
        response.setMessage("Request received, processing...");
        response.setData("BillDetail is being processed in queue");
        return response;
    }
    @GetMapping("/addBill")
    public ApiResponse<Bill> addBill(@RequestParam("storeId") Long storeId) {
        ApiResponse<Bill> bill = new ApiResponse<>();
        Bill billRequest = new Bill();
        billRequest.setStore(storeService.findStoreById(storeId));
        bill.setData(billService.createBillForFirstDetail(billRequest));
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
    public ApiResponse<List<ProductResponse>> searchProduct(@RequestParam("key") String key, @RequestParam("storeId") Long storeId){
        Pageable pageable = PageRequest.of(0,8);
        ApiResponse<List<ProductResponse>> response = new ApiResponse<>();
        response.setCode(200);
        response.setMessage("Success");
        response.setData(productService.getProductBySearchKeyword(key, pageable, storeId));
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

}

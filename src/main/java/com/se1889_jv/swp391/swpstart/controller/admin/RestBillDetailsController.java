package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.BillDetail;
import com.se1889_jv.swp391.swpstart.domain.dto.ApiResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailResponse;
import com.se1889_jv.swp391.swpstart.repository.BillDetailRepository;
import com.se1889_jv.swp391.swpstart.service.implementservice.BillDetailService;
import com.se1889_jv.swp391.swpstart.service.implementservice.BillService;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/hello")
public class RestBillDetailsController {
    @Autowired
    BillService billService;
    @Autowired
    StoreService storeService;
    @Autowired
    BillDetailService billDetailService;


    @GetMapping("")
    public String hello() {
        return "Hello World";
    }
    @PostMapping("/addBillDetail")
    public ApiResponse<BillDetailResponse> addBillDetail(@RequestBody BillDetailRequest billDetail) {
        ApiResponse<BillDetailResponse> billDetailApiResponse = new ApiResponse<>();
        billDetailApiResponse.setCode(200);
        billDetailApiResponse.setMessage("Success");
        billDetailApiResponse.setData(billDetailService.createBillDetail2(billDetail));
        return billDetailApiResponse;
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
}

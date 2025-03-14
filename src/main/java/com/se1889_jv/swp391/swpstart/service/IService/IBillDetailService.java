package com.se1889_jv.swp391.swpstart.service.IService;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.BillDetail;
import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailResponse;

import java.util.List;

public interface IBillDetailService {
    public BillDetail createBillDetail(BillDetail billDetail, Bill bill , Long productId);
    BillDetail createBillDetail1(BillDetailRequest request) throws JsonProcessingException;
    BillDetailResponse createBillDetail2(BillDetailRequest request);
    void deleteBillDetail(Long id);
    List<BillDetailResponse> getBillDetails(Long billId);
    double getTotalPrice(Long billId);
}

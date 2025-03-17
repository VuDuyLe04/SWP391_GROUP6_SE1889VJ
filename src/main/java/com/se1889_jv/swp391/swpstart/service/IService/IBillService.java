package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDTO;
import com.se1889_jv.swp391.swpstart.domain.dto.BillRequest;

public interface IBillService {
    Bill createBill(BillDTO bill);
    Bill createBillForFirstDetail(Bill bill);
    void updateTotalPriceBill(double totalPrice, Long billId);
    double getTotalPriceBill(Long billId);
    Bill updateBill(BillRequest request, Long billId);
}

package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDTO;

public interface IBillService {
    Bill createBill(BillDTO bill);
    Bill createBillForFirstDetail(Bill bill);
}

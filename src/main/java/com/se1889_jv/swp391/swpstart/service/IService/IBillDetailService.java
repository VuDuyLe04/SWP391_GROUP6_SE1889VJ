package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.BillDetail;
import com.se1889_jv.swp391.swpstart.domain.Product;

public interface IBillDetailService {
    public BillDetail createBillDetail(BillDetail billDetail, Bill bill , Long productId);
}

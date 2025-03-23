package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDTO;
import com.se1889_jv.swp391.swpstart.domain.dto.BillRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.ImportRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import java.time.Instant;
import java.util.List;

public interface IBillService {
    Bill createBill(BillDTO bill);
    Bill createBillForFirstDetail(Bill bill);
    void updateTotalPriceBill(double totalPrice, Long billId);
    double getTotalPriceBill(Long billId);
    Bill updateBill(BillRequest request, Long billId);
    Page<Bill> getBillsByAllStore(List<Store> stors, Pageable pageable);
    Bill createBillForImport(ImportRequest request);

    Page<Bill> filterBills(
            @Param("startDate") Instant startDate,
            @Param("endDate") Instant endDate,
            @Param("minAmount") Double minAmount,
            @Param("maxAmount") Double maxAmount,
            @Param("input") String input,
            @Param("storeId") Long storeId,
            Pageable pageable
    );
}

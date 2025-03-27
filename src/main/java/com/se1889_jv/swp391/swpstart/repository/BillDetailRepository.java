package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.BillDetail;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BillDetailRepository extends JpaRepository<BillDetail, Long> {
    List<BillDetail> findAllByBillId(Long billId);
    BillDetail findByBillIdAndProductIdAndPackagingId(Long billId, Long ProductId, Long packagingId);
    List<BillDetail> getAllByBillId(Long billId);

}

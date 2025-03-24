package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.DebtReceipt;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DebtReceiptRepository extends JpaRepository<DebtReceipt, Long>, JpaSpecificationExecutor<DebtReceipt> {
    List<DebtReceipt> findByCustomer(Customer customer);
    Page<DebtReceipt> findByCustomer(Customer customer, Pageable pageable);
}

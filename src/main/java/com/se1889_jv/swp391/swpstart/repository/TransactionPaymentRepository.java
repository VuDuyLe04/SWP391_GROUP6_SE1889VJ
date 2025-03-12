package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.TransactionPayment;
import com.se1889_jv.swp391.swpstart.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface TransactionPaymentRepository extends JpaRepository<TransactionPayment, Long>, JpaSpecificationExecutor<TransactionPayment> {


    Optional<TransactionPayment> findByTransactionId(String transactionId);

    Page<TransactionPayment> findByUser(User user, Pageable pageable);
}

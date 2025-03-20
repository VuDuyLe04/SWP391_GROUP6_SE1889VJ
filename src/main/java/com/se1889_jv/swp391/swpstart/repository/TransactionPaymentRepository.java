package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.TransactionPayment;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.util.constant.TransactionStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.Optional;

@Repository
public interface TransactionPaymentRepository extends JpaRepository<TransactionPayment, Long>, JpaSpecificationExecutor<TransactionPayment> {
    @Query("SELECT t FROM TransactionPayment t " +
            "WHERE (:startDate IS NULL OR t.date >= :startDate) " +
            "AND (:endDate IS NULL OR t.date <= :endDate) " +
            "AND (:minAmount IS NULL OR t.amount >= :minAmount) " +
            "AND (:maxAmount IS NULL OR t.amount <= :maxAmount) " +
            "AND (:status IS NULL OR t.transactionStatus = :status) " )
    Page<TransactionPayment> filterTransactions(
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate,
            @Param("minAmount") Double minAmount,
            @Param("maxAmount") Double maxAmount,
            @Param("status") TransactionStatus status,
            Pageable pageable
    );
    Page<TransactionPayment> findByTransactionStatus(TransactionStatus transactionStatus, Pageable pageable);
    Optional<TransactionPayment> findByTransactionId(String transactionId);
    Page<TransactionPayment> findByUser(User user, Pageable pageable);
    Page<TransactionPayment> findAll(Pageable pageable);
    Page<TransactionPayment> findByTransactionIdContainingOrUser_PhoneContaining(String transactionId, String phone, Pageable pageable);



}

package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.TransactionPayment;
import com.se1889_jv.swp391.swpstart.domain.TransactionService;
import com.se1889_jv.swp391.swpstart.util.constant.TransactionStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;

public interface TransactionServiceRepository extends JpaRepository<TransactionService, Integer> {
    @Query("SELECT t FROM TransactionService t JOIN t.user u " +
            "WHERE (:startDate IS NULL OR t.transactionDate >= :startDate) " +
            "AND (:endDate IS NULL OR t.transactionDate <= :endDate) " +
            "AND (:minAmount IS NULL OR t.amount >= :minAmount) " +
            "AND (:maxAmount IS NULL OR t.amount <= :maxAmount) " +
            "AND (:status IS NULL OR t.transactionStatus = :status) " +
            "AND (:serviceName IS NULL OR LOWER(t.serviceName) LIKE LOWER(CONCAT('%', :serviceName, '%'))) " + // Thêm space ở cuối
            "AND (:phone IS NULL OR (u.phone IS NOT NULL AND u.phone LIKE CONCAT('%', :phone, '%'))) ") // Đóng đúng 2 ngoặc và thêm space
    Page<TransactionService> filterTransactions(
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate,
            @Param("minAmount") Double minAmount,
            @Param("maxAmount") Double maxAmount,
            @Param("status") TransactionStatus status,
            @Param("serviceName") String serviceName,
            @Param("phone") String phone,
            Pageable pageable
    );

}

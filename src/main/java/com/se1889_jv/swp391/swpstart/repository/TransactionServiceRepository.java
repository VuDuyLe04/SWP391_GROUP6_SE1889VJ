package com.se1889_jv.swp391.swpstart.repository;


import com.se1889_jv.swp391.swpstart.domain.TransactionService;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.util.constant.TransactionStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface TransactionServiceRepository extends JpaRepository<TransactionService, Long> {
    @Query("SELECT t FROM TransactionService t JOIN t.user u " +
            "WHERE (:startDate IS NULL OR t.transactionDate >= :startDate) " +
            "AND (:endDate IS NULL OR t.transactionDate <= :endDate) " +
            "AND (:minAmount IS NULL OR t.amount >= :minAmount) " +
            "AND (:maxAmount IS NULL OR t.amount <= :maxAmount) " +
            "AND (:status IS NULL OR t.transactionStatus = :status) " +
            "AND (:userId IS NULL OR u.id = :userId) " +  // Thêm điều kiện lọc theo userId
            "AND (:input IS NULL OR " +
            "LOWER(t.serviceName) LIKE LOWER(CONCAT('%', :input, '%')) OR " +
            "LOWER(u.phone) LIKE LOWER(CONCAT('%', :input, '%'))) ")
    Page<TransactionService> filterTransactions(
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate,
            @Param("minAmount") Double minAmount,
            @Param("maxAmount") Double maxAmount,
            @Param("status") TransactionStatus status,
            @Param("userId") Long userId,  // Thêm tham số userId
            @Param("input") String input,
            Pageable pageable
    );



    Page<TransactionService> findByUser(User user, Pageable pageable);

    @Query("SELECT t FROM TransactionService t WHERE t.transactionStatus = :status " +
            "AND t.transactionDate >= :startDate AND t.transactionDate <= :endDate ")
    List<TransactionService> findByStatusAndDateRange(
            @Param("status") TransactionStatus status,
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate);

}

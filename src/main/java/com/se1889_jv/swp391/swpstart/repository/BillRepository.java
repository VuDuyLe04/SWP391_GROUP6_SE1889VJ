package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.Store;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.Instant;
import java.util.List;

@Repository
public interface BillRepository extends JpaRepository<Bill, Long> {
    Page<Bill> findAllByStoreIn(List<Store> store, Pageable pageable);

    @Query("SELECT b FROM Bill b " +
            "WHERE (:startDate IS NULL OR b.createdAt >= :startDate) " +
            "AND (:endDate IS NULL OR b.createdAt <= :endDate) " +
            "AND (:minAmount IS NULL OR b.totalBillPrice >= :minAmount) " +
            "AND (:maxAmount IS NULL OR b.totalBillPrice <= :maxAmount) " +
            "AND (:input IS NULL OR LOWER(b.store.name) LIKE LOWER(CONCAT('%', :input, '%'))) " +
            "AND (:input IS NULL OR b.customer.phone LIKE CONCAT('%', :input, '%')) " +
            "ORDER BY b.createdAt DESC")
    Page<Bill> filterBills(
            @Param("startDate") Instant startDate,
            @Param("endDate") Instant endDate,
            @Param("minAmount") Double minAmount,
            @Param("maxAmount") Double maxAmount,
            @Param("input") String input,
            Pageable pageable
    );




}

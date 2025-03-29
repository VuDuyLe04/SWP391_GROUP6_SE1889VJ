package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.util.constant.BillTypeEnum;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.Instant;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface BillRepository extends JpaRepository<Bill, Long> {
    Page<Bill> findAllByStoreIn(List<Store> store, Pageable pageable);

    @Query("SELECT b FROM Bill b " +
            "LEFT JOIN b.customer c " +
            "WHERE (:startDate IS NULL OR b.createdAt >= :startDate) " +
            "AND (:endDate IS NULL OR b.createdAt <= :endDate) " +
            "AND (:minAmount IS NULL OR b.totalBillPrice >= :minAmount) " +
            "AND (:maxAmount IS NULL OR b.totalBillPrice <= :maxAmount) " +
            "AND (:input IS NULL OR " +
            "(c IS NOT NULL AND LOWER(c.phone) LIKE LOWER(CONCAT('%', :input, '%'))) " +
            "OR (:input IS NOT NULL AND c IS NULL)) " +
            "AND (:storeId IS NULL OR b.store.id = :storeId) " +
            "AND (:storeIds IS NULL OR b.store.id IN :storeIds) " +
            "AND (:billType IS NULL OR b.billType = :billType) " +
            "AND b.billType IS NOT NULL")
    Page<Bill> filterBills(
            @Param("startDate") Instant startDate,
            @Param("endDate") Instant endDate,
            @Param("minAmount") Double minAmount,
            @Param("maxAmount") Double maxAmount,
            @Param("input") String input,
            @Param("storeId") Long storeId,
            @Param("storeIds") List<Long> storeIds,
            @Param("billType") BillTypeEnum billType,
            Pageable pageable
    );


    @Query("SELECT b FROM Bill b WHERE b.store = :store AND b.createdAt >= :start AND b.createdAt <= :end")
    List<Bill> findByStoreAndCreatedAt(Store store, LocalDateTime start, LocalDateTime end);

}

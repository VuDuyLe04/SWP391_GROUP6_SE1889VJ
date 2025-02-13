package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Packaging;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PackagingRepository extends JpaRepository<Packaging, Long> {
    @Query(value = "SELECT * FROM packaings p WHERE p.quantity_per_package <= :quantity AND p.store_id = :storeId AND p.storage = 1", nativeQuery = true)
    List<Packaging> findAllPackingForProduct(@Param(("quantity")) double quantity, @Param("storeId") Long storeId);
    Packaging getPackagingByPackageType(String packageType);
    List<Packaging> findPackagingByStoreId(Long storeId);
    Page<Packaging> findAllByStoreId(Long storeId, Pageable pageable);
    Page<Packaging> findAllByStorageIsTrue(Pageable pageable);
    Page<Packaging> findAllByStorageIsFalse(Pageable pageable);
    Page<Packaging> findAllByPackageTypeContaining(String input, Pageable pageable);
    boolean existsByPackageType(String packageType);
    Page<Packaging> findAllByStoreIdIn(List<Long> storeId, Pageable pageable);
    List<Packaging> findAllByStoreIdIn(List<Long> storeId);
    Page<Packaging> findAllByStoreIdAndStorageIsTrue(Long storeId, Pageable pageable);
    Page<Packaging> findAllByStoreIdAndStorageIsFalse(Long storeId, Pageable pageable);
    Page<Packaging> findAllByStoreIdInAndStorageIsTrue(List<Long> storeId, Pageable pageable);
    Page<Packaging> findAllByStoreIdInAndStorageIsFalse(List<Long> storeId, Pageable pageable);
}

package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Product;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
    @Query("SELECT DISTINCT p.category FROM Product p")
    List<String> findDistinctCategories();

    List<Product> findAllByStoreIdAndStorageIsTrue(Long storeId);

    //List<Product> findByNameContainingIgnoreCase(String name);
    Page<Product> findAllByStoreId(Long storeId, Pageable pageable);
    Page<Product> findAllByNameContainingIgnoreCase(String input, Pageable pageable);
    List<Product> findAllByWarehouseId(Long warehouseId);
    //san pham cua chu cua hang
    @Query("SELECT p FROM Product p WHERE p.store.id IN :storeIds")
    Page<Product> findByStoreIdIn(@Param("storeIds") List<Long> storeIds, Pageable pageable);


}
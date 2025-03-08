package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Product;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
    @Query("SELECT DISTINCT p.category FROM Product p")
    List<String> findDistinctCategories();

    Page<Product> findAllByStoreIdAndStorageIsTrue(Long storeId, Pageable pageable);

    List<Product> findByNameContainingIgnoreCase(String name);
    Page<Product> findAllByStoreId(Long storeId, Pageable pageable);
    Page<Product> findAllByNameContainingIgnoreCase(String input, Pageable pageable);
    Page<Product> findAllByStoreIdAndNameContainingIgnoreCase(Long storeId, String name, Pageable pageable);
}

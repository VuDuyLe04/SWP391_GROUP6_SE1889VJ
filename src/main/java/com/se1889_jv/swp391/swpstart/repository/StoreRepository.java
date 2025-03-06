package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.domain.Store;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import javax.swing.text.html.Option;
import java.util.Optional;

@Repository
public interface StoreRepository extends JpaRepository<Store, Long>, JpaSpecificationExecutor<Product> {
    Page<Store> findByCreatedBy(String createdBy, Pageable pageable);
    Page<Store> findByCreatedByAndNameContainingOrCreatedByAndAddressContaining(
            String createdBy, String name,
            String createdBy2, String address,
            Pageable pageable);

}

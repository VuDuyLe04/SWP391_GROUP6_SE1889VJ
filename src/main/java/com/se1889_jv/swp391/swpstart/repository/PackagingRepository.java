package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Packaging;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PackagingRepository extends JpaRepository<Packaging, Long> {
    @Query(value = "SELECT * FROM packaings p WHERE p.quantity_per_package <= :quantity", nativeQuery = true)
    List<Packaging> findAllPackingForProduct(@Param(("quantity")) double quantity);
}

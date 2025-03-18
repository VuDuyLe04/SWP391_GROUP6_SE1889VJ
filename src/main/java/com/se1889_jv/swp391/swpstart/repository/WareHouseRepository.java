package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.WareHouse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WareHouseRepository extends JpaRepository<WareHouse, Long> {
    List<WareHouse> findByStore(Store store);
    boolean existsByNameAndStore(String name, Store store);
    List<WareHouse> findAllByStoreIn(List<Store> stores);
    Page<WareHouse> findByStore(Store store, Pageable pageable);
    List<WareHouse> findByNameContaining(String name);
}

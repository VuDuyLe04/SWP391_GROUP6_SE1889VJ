package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.TransactionService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TransactionServiceRepository extends JpaRepository<TransactionService, Integer> {
    Page<TransactionService> findAll(Pageable pageable);
}

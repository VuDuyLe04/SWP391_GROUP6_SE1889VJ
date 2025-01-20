package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.Store;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    List<Customer> findByStore(Store store);

}

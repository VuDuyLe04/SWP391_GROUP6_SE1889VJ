package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.Store;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    List<Customer> findByStore(Store store);
//    @Query("SELECT c from Customer c WHERE c.name LIKE %?1%")
//    List<Customer> searchCustomer(String keyword);
List<Customer> findByNameContainingIgnoreCase(String name);
List<Customer> findByPhoneContainingIgnoreCase(String email);
    List<Customer> getCustomersByStoreId(Long storeId);
    Customer getCustomersByNameAndPhone(String name, String phone);

    //All customer role owner
    Page<Customer> findByStoreIn(List<Store> stores, Pageable pageable);
    //All customer role staff
    Page<Customer> findByStore(Store store, Pageable pageable);
    //check khách hàng tồn tại trong cửa hàng
    boolean existsByPhoneAndStore(String phone, Store store);
}

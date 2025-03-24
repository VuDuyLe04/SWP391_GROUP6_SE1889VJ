package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.Store;
import jakarta.persistence.LockModeType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long>, JpaSpecificationExecutor<Customer> {
    List<Customer> findByStore(Store store);
//    @Query("SELECT c from Customer c WHERE c.name LIKE %?1%")
//    List<Customer> searchCustomer(String keyword);

    //Role Owner
    Page<Customer> findByNameContainingIgnoreCaseAndStoreIn(String name,List<Store> stores, Pageable pageable);
    Page<Customer> findByPhoneContainingIgnoreCaseAndStoreIn(String email,List<Store> stores, Pageable pageable);
    //Role Staff
    Page<Customer> findByNameContainingIgnoreCaseAndStore(String name,Store store, Pageable pageable);
    Page<Customer> findByPhoneContainingIgnoreCaseAndStore(String email,Store store, Pageable pageable);
    //
    List<Customer> getCustomersByStoreId(Long storeId);
    Customer getCustomersByNameAndPhone(String name, String phone);

    //All customer role owner
    Page<Customer> findByStoreIn(List<Store> stores, Pageable pageable);
    //All customer role staff
    Page<Customer> findByStore(Store store, Pageable pageable);

    boolean existsByPhoneAndCreatedBy(String phone, String createdBy);

    boolean existsCustomerByNameAndPhone(String name, String phone);



    @Query("SELECT CASE WHEN COUNT(c) > 0 THEN true ELSE false END " +
            "FROM Customer c " +
            "WHERE c.phone = :newPhone " +
            "AND c.store = :store " +
            "AND c.phone != :oldPhone")
    boolean existsByPhoneAndStoreExcludingOldPhone(@Param("newPhone") String newPhone,
                                                   @Param("oldPhone") String oldPhone,
                                                   @Param("store") Store store);

    Page<Customer> findAllByCreatedBy(Specification<Customer> specification,String createdBy, Pageable pageable);
    Page<Customer> findAllByCreatedBy(String createdBy, Pageable pageable);

    @Lock(LockModeType.PESSIMISTIC_WRITE)
    @Query("SELECT c FROM Customer c WHERE c.id = :customerId")
    Optional<Customer> findByIdWithLock(@Param("customerId") Long customerId);
}

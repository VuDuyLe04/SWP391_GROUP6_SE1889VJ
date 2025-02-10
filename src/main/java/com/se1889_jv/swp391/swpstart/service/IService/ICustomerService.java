package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.repository.CustomerRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;


public interface ICustomerService {
    Customer createCustomer(Customer customer, Store store);
    List<Customer> getAllCustomers(Store store);
    Customer getCustomerById(long id);
    void updateCustomer(Customer customer);
public List<Customer> getAllCustomers();
    public default List<Customer> searchCustomersByName(String name) {

        CustomerRepository customerRepository = null;
        return customerRepository.findByNameContainingIgnoreCase(name);
    }
    public default List<Customer> searchCustomersByPhone(String phone) {

        CustomerRepository customerRepository = null;
        return customerRepository.findByPhoneContainingIgnoreCase(phone);
    }
    Page<Customer> getAllCustomers(Pageable pageable);
    List<Customer> getCustomersByStoreId(Long storeId);
    Customer getCustomerByNameAndPhone(String infor);
}

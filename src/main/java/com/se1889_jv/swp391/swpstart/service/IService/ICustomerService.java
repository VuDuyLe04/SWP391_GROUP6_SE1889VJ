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
//    List<Customer> searchCustomer(String keyword);
//    List<Customer> getAll();
public List<Customer> getAllProducts();
    public default List<Customer> searchProductsByName(String name) {

        CustomerRepository customerRepository = null;
        return customerRepository.findByNameContainingIgnoreCase(name);
    }
    Page<Customer> getAllProducts(Pageable pageable);
}

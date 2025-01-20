package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.Store;

import java.util.List;

public interface ICustomerService {
    Customer createCustomer(Customer customer, Store store);
    List<Customer> getAllCustomers(Store store);
    Customer getCustomerById(long id);
    void updateCustomer(Customer customer);
}

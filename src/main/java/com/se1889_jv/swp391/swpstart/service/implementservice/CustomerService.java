package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.repository.CustomerRepository;
import com.se1889_jv.swp391.swpstart.service.IService.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService implements ICustomerService {
    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public Customer createCustomer(Customer customer) {
        return this.customerRepository.save(customer);
    }

    @Override
    public List<Customer> getAllCustomers() {
        return this.customerRepository.findAll();
    }
}

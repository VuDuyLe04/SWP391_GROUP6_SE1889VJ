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

    public Customer getCustomerById(Long id) {
        return customerRepository.findById(id).orElseThrow(() -> new RuntimeException("Customer not found"));
    }

    public void updateCustomer(Customer customer) {
        Customer customer1 = customerRepository.findById(customer.getId()).orElseThrow(() -> new RuntimeException("Customer not found"));
        if(customer1 != null){
            customer1.setName(customer1.getName());
            customer1.setPhone(customer1.getPhone());
            customer1.setAddress(customer1.getAddress());
        }
        customerRepository.save(customer);
    }
}

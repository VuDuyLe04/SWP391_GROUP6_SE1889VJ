package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.repository.CustomerRepository;
import com.se1889_jv.swp391.swpstart.service.IService.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.util.List;
import java.util.Optional;


@Service
public class CustomerService implements ICustomerService {
    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public Customer createCustomer(Customer customer, Store store) {
        customer.setStore(store);
        return this.customerRepository.save(customer);
    }

    @Override
    public List<Customer> getAllCustomers(Store store) {
        return this.customerRepository.findByStore(store);
    }

    @Override
    public Customer getCustomerById(long id) {
        Optional<Customer> customer = this.customerRepository.findById(id);
        if (customer.isPresent()) {
            return customer.get();
        }
        return null;
    }
    @Override
    public void updateCustomer(Customer customer) {
        Customer customer1 = getCustomerById(customer.getId());
        if(customer1 != null){

            customer1.setName(customer.getName());
            customer1.setPhone(customer.getPhone());
            customer1.setAddress(customer.getAddress());

        }

        customerRepository.save(customer1);
    }
    public List<Customer> searchCustomersByName(String name) {
        return customerRepository.findByNameContainingIgnoreCase(name);
    }
    public List<Customer> searchCustomersByPhone(String phone) {
        return customerRepository.findByPhoneContainingIgnoreCase(phone);
    }

    @Override
    public Page<Customer> getAllCustomers(Pageable pageable) {
        return customerRepository.findAll(pageable);
    }

    @Override
    public List<Customer> getAllCustomers() {
        return customerRepository.findAll();
    }

    @Override
    public List<Customer> getCustomersByStoreId(Long storeId) {
        return customerRepository.getCustomersByStoreId(storeId);
    }

    @Override
    public Customer getCustomerByNameAndPhone(String infor) {
        String [] part  = infor.split(" - ");
        String name = part[0].trim();
        String phone = part[1].trim();
        return customerRepository.getCustomersByNameAndPhone(name,phone);
    }

    @Override
    public boolean existsCustomerByNameAndPhone(String infor) {
        String [] part  = infor.split(" - ");
        String name = part[0].trim();
        String phone = part[1].trim();
        return customerRepository.existsCustomerByNameAndPhone(name,phone);
    }

}

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
    CustomerRepository customerRepository;
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

}

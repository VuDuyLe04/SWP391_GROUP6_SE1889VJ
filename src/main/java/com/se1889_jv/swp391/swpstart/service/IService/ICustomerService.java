package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> getCustomersByStoreId(Long storeId);
}

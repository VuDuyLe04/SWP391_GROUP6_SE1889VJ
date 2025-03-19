package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.dto.CustomerCriteriaDTO;
import com.se1889_jv.swp391.swpstart.repository.CustomerRepository;
import com.se1889_jv.swp391.swpstart.service.IService.ICustomerService;
import com.se1889_jv.swp391.swpstart.service.specification.CustomerSpecs;
import com.se1889_jv.swp391.swpstart.service.specification.ServiceSpecs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
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
    public Customer createCustomer(Customer customer) {
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

    public Page<Customer> searchCustomersByNameRoleOwner(String name ,List<Store> stores, Pageable pageable) {
        return customerRepository.findByNameContainingIgnoreCaseAndStoreIn(name,stores, pageable);
    }

    public Page<Customer> searchCustomersByPhoneRoleOwner(String phone ,List<Store> stores, Pageable pageable) {
        return customerRepository.findByPhoneContainingIgnoreCaseAndStoreIn(phone,stores, pageable);
    }

    public Page<Customer> searchCustomersByNameRoleStaff(String name ,Store store, Pageable pageable) {
        return customerRepository.findByNameContainingIgnoreCaseAndStore(name,store, pageable);
    }

    public Page<Customer> searchCustomersByPhoneRoleStaff(String phone ,Store store, Pageable pageable) {
        return customerRepository.findByPhoneContainingIgnoreCaseAndStore(phone,store, pageable);
    }

    @Override
    public Page<Customer> getAllCustomersRoleOwner(List<Store> stores, Pageable pageable) {
        return this.customerRepository.findByStoreIn(stores, pageable);
    }

    @Override
    public Page<Customer> getAllCustomersRoleStafff(Store store, Pageable pageable) {
        return this.customerRepository.findByStore(store, pageable);
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
    public boolean checkCustomerExistsOfOwnerByPhone(String phone, String createdBy) {
        return this.customerRepository.existsByPhoneAndCreatedBy(phone,createdBy);
    }

    @Override
    public boolean existsCustomerByNameAndPhone(String infor) {
        String [] part  = infor.split(" - ");
        String name = part[0].trim();
        String phone = part[1].trim();
        return customerRepository.existsCustomerByNameAndPhone(name,phone);
    }

    @Override
    public Page<Customer> getAllCustomerOfOwner(String createdBy, Pageable pageable, CustomerCriteriaDTO customerCriteriaDTO) {

        // When nameOrPhone is not provided, use the simpler method
        if (customerCriteriaDTO.getName() == null) {
            return this.customerRepository.findAllByCreatedBy(createdBy, pageable);
        }
        Specification<Customer> combined = Specification.where(null);

        if ( customerCriteriaDTO.getName() != null && customerCriteriaDTO.getName().isPresent()) {
            Specification<Customer> currentSpecs = CustomerSpecs.nameOrPhoneLike(customerCriteriaDTO.getName().get());
            combined = combined.and(currentSpecs);
        }

        // Pass the specification along with createdBy and pageable
        return this.customerRepository.findAllByCreatedBy(combined, createdBy, pageable);
    }

}

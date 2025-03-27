package com.se1889_jv.swp391.swpstart.service.implementservice;


import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.dto.CustomerCriteriaDTO;
import com.se1889_jv.swp391.swpstart.domain.dto.response.PageResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.CustomerRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.CustomerResponse;
import com.se1889_jv.swp391.swpstart.exception.AppException;
import com.se1889_jv.swp391.swpstart.exception.ErrorException;
import com.se1889_jv.swp391.swpstart.repository.CustomerRepository;
import com.se1889_jv.swp391.swpstart.repository.DebtReceiptRepository;
import com.se1889_jv.swp391.swpstart.service.IService.ICustomerService;

import com.se1889_jv.swp391.swpstart.service.specification.CustomerSpecs;
import com.se1889_jv.swp391.swpstart.service.specification.ServiceSpecs;
import com.se1889_jv.swp391.swpstart.util.Utility;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CustomerService implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private DebtReceiptRepository debtReceiptRepository;

    @Autowired
    private ModelMapper modelMapper;
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
    public CustomerResponse createCustomer(CustomerRequest customerRequest) {
        User user = Utility.getUserInSession();
        String createdBy = "";
        if (user.getRole().getName().equals("OWNER")) {
            createdBy = Long.toString(user.getId());
        } else {
            createdBy = user.getCreatedBy();
        }
        Store store = Utility.getStoreInSession();
        if(customerRequest.getCusPhone() == null || customerRequest.getCusName() == null || customerRequest.getCusAddress() == null){
            throw new AppException(ErrorException.NOT_NULL);
        }

        if(customerRepository.existsByPhoneAndCreatedBy(customerRequest.getCusPhone(), createdBy)){
            throw new AppException(ErrorException.CUSTOMER_EXITED);
        }
        Customer customer = new Customer();
        customer.setStore(store);
        customer.setName(customerRequest.getCusName());
        customer.setPhone(customerRequest.getCusPhone());
        customer.setAddress(customerRequest.getCusAddress());
        Customer saveCustomer =customerRepository.save(customer);
        CustomerResponse customerResponse = modelMapper.map(saveCustomer, CustomerResponse.class);
        return customerResponse;
    }

    @Override
    public List<Customer> getCustomersByStoreId(Long storeId) {
        return customerRepository.getCustomersByStoreId(storeId);
    }

    @Override
    public Customer getCustomerByNameAndPhone(String infor) {
        String [] part  = infor.split(" - ");
        String phone = part[0].trim();
        String name = part[1].trim();
        return customerRepository.getCustomersByPhoneAndName(phone,name);
    }

    @Override
    public boolean checkCustomerExistsOfOwnerByPhone(String phone, String createdBy) {
        return this.customerRepository.existsByPhoneAndCreatedBy(phone,createdBy);
    }

    @Override
    public boolean existsCustomerByNameAndPhone(String infor) {
        String[] part = infor.split(" - ");
        String name = part[0].trim();
        String phone = part[1].trim();
        return customerRepository.existsCustomerByNameAndPhone(name, phone);
    }

    @Override
    public Page<Customer> getAllCustomerOfOwner(String createdBy, Pageable pageable, CustomerCriteriaDTO customerCriteriaDTO) {
        if (customerCriteriaDTO.getName() == null) {
            return this.customerRepository.findAllByCreatedBy(createdBy, pageable);
        }
        Specification<Customer> combined = Specification.where(null);

        if ( customerCriteriaDTO.getName() != null && customerCriteriaDTO.getName().isPresent()) {
            Specification<Customer> currentSpecs = CustomerSpecs.nameOrPhoneLike(customerCriteriaDTO.getName().get());
            combined = combined.and(currentSpecs);
        }
        return this.customerRepository.findAllByCreatedBy(combined, createdBy, pageable);
    }

    @Override
    public List<CustomerResponse> recomendedCustomer(String phone, Pageable pageable) {
        User user = Utility.getUserInSession();
        String createdBy = "";
        if (user.getRole().getName().equals("OWNER")) {
            createdBy = Long.toString(user.getId());
        } else {
            createdBy = user.getCreatedBy();
        }

        Store store = Utility.getStoreInSession();
        List<Customer> pageCustomer = customerRepository.findAllByPhoneContainingAndCreatedBy(phone, createdBy, pageable).getContent();
        List<CustomerResponse> customerResponses = pageCustomer.stream()
                .map(customer -> modelMapper.map(customer, CustomerResponse.class))
                .collect(Collectors.toList());
        return customerResponses;
    }

    @Transactional
    public void updateBalance(Customer customer, double balance) {
        customer.setBalance(balance);
        customerRepository.save(customer);
    }
}

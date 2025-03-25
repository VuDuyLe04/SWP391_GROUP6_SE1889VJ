package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.dto.CustomerRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.CustomerResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.response.PageResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.CustomerCriteriaDTO;
import com.se1889_jv.swp391.swpstart.repository.CustomerRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;


public interface ICustomerService {
    Customer createCustomer(Customer customer);
    List<Customer> getAllCustomers(Store store);
    Customer getCustomerById(long id);
    void updateCustomer(Customer customer);
    public List<Customer> getAllCustomers();
    CustomerResponse createCustomer(CustomerRequest customerRequest);

    //Search owner
    public default Page<Customer> searchCustomersByNameRoleOwner(String name ,List<Store> stores, Pageable pageable) {

        CustomerRepository customerRepository = null;
        return customerRepository.findByNameContainingIgnoreCaseAndStoreIn(name,stores, pageable);
    }
    public default Page<Customer> searchCustomersByPhoneRoleOwner(String phone,List<Store> stores, Pageable pageable) {

        CustomerRepository customerRepository = null;
        return customerRepository.findByPhoneContainingIgnoreCaseAndStoreIn(phone,stores, pageable);
    }
    //Search staff
    public default Page<Customer> searchCustomersByNameRoleStaff(String name ,Store store, Pageable pageable) {

        CustomerRepository customerRepository = null;
        return customerRepository.findByNameContainingIgnoreCaseAndStore(name,store, pageable);
    }
    public default Page<Customer> searchCustomersByPhoneRoleStaff(String phone,Store store, Pageable pageable) {

        CustomerRepository customerRepository = null;
        return customerRepository.findByPhoneContainingIgnoreCaseAndStore(phone,store, pageable);
    }


    //Lấy tất cẩ customer trong tất cả các cửa hàng của Owner
    Page<Customer> getAllCustomersRoleOwner(List<Store> stores,Pageable pageable);
    //Lấy tất cả các customer trong cửa hàng mà Staff chọn quản lý
    Page<Customer> getAllCustomersRoleStafff(Store store,Pageable pageable);

    List<Customer> getCustomersByStoreId(Long storeId);
    Customer getCustomerByNameAndPhone(String infor);


    boolean checkCustomerExistsOfOwnerByPhone(String phone, String createdBy);


    boolean existsCustomerByNameAndPhone(String infor);
    List<CustomerResponse> recomendedCustomer(String phone, Pageable pageable);

    Page<Customer> getAllCustomerOfOwner(String createdBy, Pageable pageable, CustomerCriteriaDTO customerCriteriaDTO);


}

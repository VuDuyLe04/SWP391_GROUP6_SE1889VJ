package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDTO;
import com.se1889_jv.swp391.swpstart.repository.BillRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IBillService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDateTime;

@Service
public class BillService implements IBillService {

    @Autowired
    private BillRepository billRepository;
    @Autowired
    private StoreService storeService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService userService;
    @Override
    public Bill createBill(BillDTO billDTO) {
        User userInSession = Utility.getUserInSession();
        User user = this.userService.findById(userInSession.getId());
        Bill bill = new Bill();
        bill.setNote(billDTO.getDes());
        bill.setStore(storeService.findStoreById(billDTO.getStoreId()));
        bill.setTotalBillPrice(billDTO.getTotalPrice());
        bill.setTotalLiftPrice(billDTO.getTotalLift());
        bill.setCreatedAt(LocalDateTime.now());
        if(billDTO.getCustomerInformation().isEmpty()){
            bill.setCustomer(null);
        } else {
            if(customerService.existsCustomerByNameAndPhone(billDTO.getCustomerInformation())){
                bill.setCustomer(customerService.getCustomerByNameAndPhone(billDTO.getCustomerInformation()));
            } else {
                Customer customer = new Customer();
                customer.setAddress(billDTO.getCustomerAddress());
                String [] part  = billDTO.getCustomerInformation().split(" - ");
                String name = part[0].trim();
                String phone = part[1].trim();
                customer.setName(name);
                customer.setPhone(phone);
                if (user.getRole().getName().equals("STAFF")) {
                    customer.setCreatedBy(user.getCreatedBy());
                } else {
                    customer.setCreatedBy(String.valueOf(user.getId()));
                }
                Customer cus = customerService.createCustomer(customer);
                bill.setCustomer(cus);
            }

        }
        return billRepository.save(bill);
    }
}

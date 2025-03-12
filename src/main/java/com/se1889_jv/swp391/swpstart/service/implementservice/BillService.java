package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDTO;
import com.se1889_jv.swp391.swpstart.exception.AppException;
import com.se1889_jv.swp391.swpstart.exception.ErrorException;
import com.se1889_jv.swp391.swpstart.repository.BillRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Instant;

@Service
public class BillService implements IBillService {

    @Autowired
    private BillRepository billRepository;
    @Autowired
    private StoreService storeService;
    @Autowired
    private CustomerService customerService;
    @Override
    public Bill createBill(BillDTO billDTO) {
        Bill bill = new Bill();
        bill.setNote(billDTO.getDes());
        bill.setStore(storeService.findStoreById(billDTO.getStoreId()));
        bill.setTotalBillPrice(billDTO.getTotalPrice());
        bill.setTotalLiftPrice(billDTO.getTotalLift());
        bill.setCreatedAt(Instant.now());
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
                Customer cus = customerService.createCustomer(customer, storeService.findStoreById(billDTO.getStoreId()));
                bill.setCustomer(cus);
            }
        }
        return billRepository.save(bill);
    }

    @Override
    public Bill createBillForFirstDetail(Bill bill) {
        return billRepository.save(bill);
    }
    public Bill findBillById(Long id) {
        return billRepository.findById(id).orElseThrow(() ->  new AppException(ErrorException.BILL_NOT_FOUND));
    }
}

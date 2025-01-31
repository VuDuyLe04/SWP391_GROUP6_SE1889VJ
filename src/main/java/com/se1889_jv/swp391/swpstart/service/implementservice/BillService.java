package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDTO;
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
            bill.setCustomer(customerService.getCustomerByNameAndPhone(billDTO.getCustomerInformation()));
        }
        return billRepository.save(bill);
    }
}

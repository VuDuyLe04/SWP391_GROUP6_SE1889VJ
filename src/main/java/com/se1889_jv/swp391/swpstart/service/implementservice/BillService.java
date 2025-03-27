package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.BillDetail;
import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDTO;
import com.se1889_jv.swp391.swpstart.domain.dto.BillRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.ImportRequest;
import com.se1889_jv.swp391.swpstart.exception.AppException;
import com.se1889_jv.swp391.swpstart.exception.ErrorException;
import com.se1889_jv.swp391.swpstart.repository.BillDetailRepository;
import com.se1889_jv.swp391.swpstart.repository.BillRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IBillService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import com.se1889_jv.swp391.swpstart.util.constant.BillTypeEnum;
import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class BillService implements IBillService {

    @Autowired
    private BillRepository billRepository;
    @Autowired
    private StoreService storeService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private BillDetailRepository billDetailRepository;
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
                Customer cus = customerService.createCustomer(customer);
                bill.setCustomer(cus);
            }
        }
        return billRepository.save(bill);
    }

    @Override
    public Bill createBillForFirstDetail(Bill bill) {
        return billRepository.save(bill);
    }

    @Override
    public void updateTotalPriceBill(double totalPrice, Long billId) {
        Optional<Bill> bill = billRepository.findById(billId);
        if (bill.isPresent()) {
            Bill b = bill.get();
            b.setTotalBillPrice(totalPrice);
            billRepository.save(b);
        } else {
            throw new AppException(ErrorException.BILL_NOT_FOUND);
        }
    }

    @Override
    public double getTotalPriceBill(Long billId) {
        return billDetailRepository.findAllByBillId(billId).stream().map(BillDetail::getTotalProductPrice).reduce(0.0, Double::sum);
    }

    @Override
    @Transactional
    public Bill updateBill(BillRequest request, Long billId) {
        Optional<Bill> bill = billRepository.findById(billId);

        if (bill.isPresent()) {

            Bill b = bill.get();
            if(b.getBillDetails().isEmpty()){
                log.info(b.getBillDetails().toString());
                throw new AppException(ErrorException.DONT_HAVE_BILL_DETAIL);
            }
            b.setNote(request.getDescription());
            if(request.getCustomerInfor().isEmpty()){
                b.setCustomer(null);
            } else {
                Customer c = customerService.getCustomerByNameAndPhone(request.getCustomerInfor());
                b.setCustomer(c);
            }
            b.setTotalBillPrice(getTotalPriceBill(billId));
            if(request.getActualPay() > b.getTotalBillPrice()){
                b.setPaid(b.getTotalBillPrice());
            } else {
                b.setPaid(request.getActualPay());
            }

            if(b.getTotalBillPrice() > request.getActualPay()){
                b.setInDebt(b.getTotalBillPrice() - request.getActualPay());
            } else {
                b.setInDebt(0);
            }
            b.setBillType(BillTypeEnum.EXPORT);
            return billRepository.save(b);
        } else {
            throw new AppException(ErrorException.BILL_NOT_FOUND);
        }
    }

    @Override
    public Page<Bill> getBillsByAllStore(List<Store> stores, Pageable pageable) {
        return billRepository.findAllByStoreIn(stores, pageable);
    }

    @Override
    public Bill createBillForImport(ImportRequest request) {
        Bill b = new Bill();
        b.setNote(request.getDescription());
        if(request.getCustomerInfor().isEmpty() || request.getCustomerInfor() == null){
            throw new AppException(ErrorException.CUSTOMER_INFOR_IS_NULL);
        } else {
            Customer cus = customerService.getCustomerByNameAndPhone(request.getCustomerInfor());
            b.setCustomer(cus);
        }
        b.setBillType(BillTypeEnum.IMPORT);
        b.setStore(Utility.getStoreInSession());
        return billRepository.save(b);
    }


    @Override
    public Page<Bill> filterBills(Instant startDate, Instant endDate, Double minAmount, Double maxAmount, String input,Long storeId,List<Long> storeIds, BillTypeEnum billType  , Pageable pageable) {
        return billRepository.filterBills(startDate, endDate, minAmount, maxAmount, input,storeId,storeIds,billType, pageable);
    }
    // sai logic ở đây về quantity
    public Bill updateImportBill(Long billId, ImportRequest request) {
        Optional<Bill> bill = billRepository.findById(billId);
        if (bill.isPresent()) {
            Bill b = bill.get();
            b.setTotalBillPrice(getTotalPriceBill(billId));
            if(request.getActualPay() > b.getTotalBillPrice()){
                b.setPaid(b.getTotalBillPrice());
            } else {
                b.setPaid(request.getActualPay());
            }
            if(b.getTotalBillPrice() > request.getActualPay()){
                b.setInDebt(b.getTotalBillPrice() - request.getActualPay());
            } else {
                b.setInDebt(0);
            }
            return billRepository.save(b);
        } else {
            throw new AppException(ErrorException.BILL_NOT_FOUND);
        }

    }

    public Bill findBillById(Long id) {
        return billRepository.findById(id).orElseThrow(() ->  new AppException(ErrorException.BILL_NOT_FOUND));
    }

}

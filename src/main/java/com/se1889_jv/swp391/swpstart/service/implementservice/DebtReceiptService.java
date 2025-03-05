package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.DebtReceipt;
import com.se1889_jv.swp391.swpstart.repository.DebtReceiptRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IDebtReceiptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DebtReceiptService implements IDebtReceiptService {

    @Autowired
    private DebtReceiptRepository debtReceiptRepository;

    @Override
    public List<DebtReceipt> getDebtsByCustomer(Customer customer) {
        return debtReceiptRepository.findByCustomer(customer);
    }
}

package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.DebtReceipt;

import java.util.List;

public interface IDebtReceiptService {
    List<DebtReceipt> getDebtsByCustomer(Customer customer);
}

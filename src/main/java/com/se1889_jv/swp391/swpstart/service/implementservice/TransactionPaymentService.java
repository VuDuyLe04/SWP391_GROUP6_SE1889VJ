package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.TransactionPayment;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.repository.TransactionPaymentRepository;
import com.se1889_jv.swp391.swpstart.service.IService.ITransactionPaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class TransactionPaymentService implements ITransactionPaymentService {
    @Autowired
    private TransactionPaymentRepository transactionPaymentRepository;
    @Override
    public Page<TransactionPayment> findAllByUser(User user, Pageable pageable) {
        return this.transactionPaymentRepository.findByUser(user, pageable);
    }
}

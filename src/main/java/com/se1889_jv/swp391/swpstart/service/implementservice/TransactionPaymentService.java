package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.TransactionPayment;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.repository.TransactionPaymentRepository;
import com.se1889_jv.swp391.swpstart.service.IService.ITransactionPaymentService;
import com.se1889_jv.swp391.swpstart.util.constant.TransactionStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class TransactionPaymentService implements ITransactionPaymentService {
    @Autowired
    private TransactionPaymentRepository transactionPaymentRepository;

    @Override
    public Page<TransactionPayment> findByTransactionStatus(TransactionStatus transactionStatus, Pageable pageable) {
      return   transactionPaymentRepository.findByTransactionStatus(transactionStatus, pageable);
    }

    @Override
    public Page<TransactionPayment> findAllByUser(User user, Pageable pageable) {
        return this.transactionPaymentRepository.findByUser(user, pageable);
    }

    @Override
    public Page<TransactionPayment> findAll(Pageable pageable) {
      return transactionPaymentRepository.findAll(pageable);

    }

    @Override
    public Page<TransactionPayment> findByTransactionIdOrUserPhone(String transactionId, String userPhone, Pageable pageable) {
        return transactionPaymentRepository.findByTransactionIdContainingOrUser_PhoneContaining(transactionId, userPhone, pageable);
    }

    @Override
    public Page<TransactionPayment> filterTransactions(LocalDateTime startDate, LocalDateTime endDate, Integer minAmount, Integer maxAmount, TransactionStatus status, Pageable pageable) {
        return transactionPaymentRepository.filterTransactions(startDate, endDate, minAmount, maxAmount, status, pageable);
    }
}

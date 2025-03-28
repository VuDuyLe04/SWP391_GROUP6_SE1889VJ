package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.TransactionService;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.repository.TransactionServiceRepository;
import com.se1889_jv.swp391.swpstart.service.IService.ITransactionServiceService;
import com.se1889_jv.swp391.swpstart.util.constant.TransactionStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class TransactionServiceService implements ITransactionServiceService {
    @Autowired
   private TransactionServiceRepository transactionServiceRepository;

    @Override
    public Page<TransactionService> getAllTransactionsService(Pageable pageable) {
          return transactionServiceRepository.findAll(pageable);
    }

    @Override
    public Page<TransactionService> filterTransactions(LocalDateTime startDate, LocalDateTime endDate, Double minAmount, Double maxAmount, TransactionStatus status,Long userId, String input, Pageable pageable) {
        return transactionServiceRepository.filterTransactions(startDate, endDate, minAmount, maxAmount, status, userId,input, pageable);
    }

    @Override
    public Page<TransactionService> allTransactionsServiceOfUser(User user, Pageable pageable) {
        return this.transactionServiceRepository.findByUser(user, pageable);
    }


}

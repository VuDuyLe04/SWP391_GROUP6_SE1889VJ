package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.TransactionService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ITransactionServiceService {
    Page<TransactionService> getAllTransactionsService(Pageable pageable);
}

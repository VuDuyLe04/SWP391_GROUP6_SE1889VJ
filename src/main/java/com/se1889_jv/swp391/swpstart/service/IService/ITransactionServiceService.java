package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.TransactionPayment;
import com.se1889_jv.swp391.swpstart.domain.TransactionService;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.util.constant.TransactionStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;

public interface ITransactionServiceService {
    Page<TransactionService> getAllTransactionsService(Pageable pageable);

    Page<TransactionService> filterTransactions(
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate,
            @Param("minAmount") Double minAmount,
            @Param("maxAmount") Double maxAmount,
            @Param("status") TransactionStatus status,
            @Param("userId") Long userId,  // Thêm tham số userId
            @Param("input") String input,
            Pageable pageable
    );

    Page<TransactionService> allTransactionsServiceOfUser(User user, Pageable pageable);
}

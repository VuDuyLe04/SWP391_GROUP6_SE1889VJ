package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.TransactionPayment;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.util.constant.TransactionStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;

public interface ITransactionPaymentService {

    Page<TransactionPayment> findByTransactionStatus(TransactionStatus transactionStatus, Pageable pageable);
    Page<TransactionPayment> findAllByUser(User user, Pageable pageable);
    Page<TransactionPayment> findAll(Pageable pageable);
    Page<TransactionPayment> findByTransactionIdOrUserPhone(String transactionId, String userPhone, Pageable pageable);
    Page<TransactionPayment> filterTransactions(
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate,
            @Param("minAmount") Double minAmount,
            @Param("maxAmount") Double  maxAmount,
            @Param("status") TransactionStatus status,
            Pageable pageable

    );
}

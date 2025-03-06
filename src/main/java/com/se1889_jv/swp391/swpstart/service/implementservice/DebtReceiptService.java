package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.DebtReceipt;
import com.se1889_jv.swp391.swpstart.domain.dto.request.DebtReceiptCreationRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.response.DebtReceiptCreationResponse;
import com.se1889_jv.swp391.swpstart.repository.CustomerRepository;
import com.se1889_jv.swp391.swpstart.repository.DebtReceiptRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IDebtReceiptService;
import com.se1889_jv.swp391.swpstart.util.constant.DebtTypeEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

@Service
@Slf4j
public class DebtReceiptService implements IDebtReceiptService {

    @Autowired
    private DebtReceiptRepository debtReceiptRepository;
    @Autowired
    private CustomerRepository customerRepository;
    @Override
    public List<DebtReceipt> getDebtsByCustomer(Customer customer) {
        return debtReceiptRepository.findByCustomer(customer);
    }

    public DebtReceiptCreationResponse createDebtReceipt(DebtReceiptCreationRequest request) {

        Customer customer = customerRepository.findById(request.getCustomerId()).orElseThrow(()->new RuntimeException("Customer not found"));
        if(request.getDebtType() == DebtTypeEnum.DEBIT) {
            // 1. lấy ra đơn nợ by mã nợ-> đơn nợ

            // 2. cập nhập lại so no -> đơn no.getAmount - request.getAmount -> số tiền còn lại

            //3. Cập nhập database

            //4. Tính tong so tien con lai phai thanh toan
            long sum = debtReceiptRepository.findByCustomer(customer)
                    .stream().mapToLong(DebtReceipt::getDebtAmount)
                    .sum();

            // 5. Trả về dữ lieu

        }
        // 1. get data tu request gan vao doi tuong deptReceipt
        DebtReceipt debtReceipt =  DebtReceipt.builder()
                .debtType(request.getDebtType())
                .amount(request.getAmount())
                .debtReason(request.getDebtReason())
                .createdAt(Instant.now())
                .customer(customer)
                .createdBy("ADMIN")
                .build();
        //2. luu xuong database
        debtReceiptRepository.save(debtReceipt);

        long sum = debtReceiptRepository.findByCustomer(customer)
                .stream().mapToLong(DebtReceipt::getDebtAmount)
                .sum();

        log.info("Debt receipt created: {}", sum);

        return DebtReceiptCreationResponse.builder()
                .id(debtReceipt.getId())
                .amount(debtReceipt.getAmount())
                .debtAmount(sum)
                .debtReason(debtReceipt.getDebtReason())
                .createdAt(debtReceipt.getCreatedAt())
                .createdBy(debtReceipt.getCreatedBy())
                .build();
    }

}

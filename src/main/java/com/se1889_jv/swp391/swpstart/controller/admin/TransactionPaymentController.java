package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.TransactionPayment;
import com.se1889_jv.swp391.swpstart.domain.TransactionService;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.service.implementservice.TransactionPaymentService;
import com.se1889_jv.swp391.swpstart.service.implementservice.TransactionServiceSerivice;
import com.se1889_jv.swp391.swpstart.util.constant.TransactionStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
public class TransactionPaymentController {
    @Autowired
    private TransactionPaymentService transactionPaymentService;
//    /transpayments
@GetMapping("/transpayments")
public String transpayments(
        @RequestParam(value = "startDate", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
        @RequestParam(value = "endDate", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
        @RequestParam(value = "minAmount", required = false) Integer minAmount,
        @RequestParam(value = "maxAmount", required = false) Integer maxAmount,
        @RequestParam(value = "status", required = false, defaultValue = "ALL") String status,
        @RequestParam(value = "input", required = false) String input,
        @RequestParam(value = "page", required = false, defaultValue = "0") int page,
        Model model
) {
    Sort sort = Sort.by(Sort.Direction.DESC, "date");
    Pageable pageable = PageRequest.of(page, 2, sort);
    Page<TransactionPayment> list = transactionPaymentService.findAll(pageable);

    if (input != null && !input.trim().isEmpty()) {
        model.addAttribute("input", input);
        list = transactionPaymentService.findByTransactionIdOrUserPhone(input.trim(), input.trim(), pageable);
    } else {
        LocalDateTime startDateTime = (startDate != null) ? startDate.atStartOfDay() : null;
        LocalDateTime endDateTime = (endDate != null) ? endDate.atTime(23, 59, 59) : null;

        TransactionStatus transactionStatus = null;
        if (!"ALL".equalsIgnoreCase(status)) {
            try {
                transactionStatus = TransactionStatus.valueOf(status);
            } catch (IllegalArgumentException e) {
                model.addAttribute("errorMessage", "Trạng thái không hợp lệ!");
            }
        }

        list = transactionPaymentService.filterTransactions(
                startDateTime, endDateTime, minAmount, maxAmount, transactionStatus, pageable
        );


    }

    if (list.hasContent()) {
        model.addAttribute("transactions", list);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("minAmount", minAmount);
        model.addAttribute("maxAmount", maxAmount);
        model.addAttribute("status", status);
    } else {
        model.addAttribute("emptyList", "Không có giao dịch nào được tìm thấy!");
    }

    return "admin/transactionpayment/transpayments";
}

}

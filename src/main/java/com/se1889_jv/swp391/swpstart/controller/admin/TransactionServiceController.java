package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.TransactionService;
import com.se1889_jv.swp391.swpstart.service.implementservice.TransactionServiceService;
import com.se1889_jv.swp391.swpstart.util.constant.TransactionStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Controller
public class TransactionServiceController {
    @Autowired
    private TransactionServiceService transactionServiceSerivice;
    @GetMapping("/transervices")
    public String transpayments(
            @RequestParam(value = "startDate", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam(value = "endDate", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
            @RequestParam(value = "minAmount", required = false) Double minAmount,
            @RequestParam(value = "maxAmount", required = false) Double maxAmount,
            @RequestParam(value = "status", required = false, defaultValue = "ALL") String status,
            @RequestParam(value = "input", required = false) String input,
            @RequestParam(value = "page", required = false, defaultValue = "0") int page,
            Model model
    ) {
        Sort sort = Sort.by(Sort.Direction.DESC, "transactionDate");
        Pageable pageable = PageRequest.of(page, 5, sort);
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

        if(input != null && !input.isEmpty()) {
            input = input.trim();
        }
        Page<TransactionService> list = transactionServiceSerivice.filterTransactions(
            startDateTime,
            endDateTime,
            minAmount,
            maxAmount,
            transactionStatus,
            input,
            pageable
        );
        if (list.hasContent()) {
            model.addAttribute("transactions", list);


        } else {
            model.addAttribute("emptyList", "Không có giao dịch nào được tìm thấy!");
        }
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("minAmount", minAmount);
        model.addAttribute("maxAmount", maxAmount);
        model.addAttribute("status", status);
        model.addAttribute("input", input);

        return "admin/transactionservice/transervices";
    }

}

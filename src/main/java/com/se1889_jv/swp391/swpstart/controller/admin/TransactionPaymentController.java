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
    public String transpayments( @RequestParam(value = "startDate", required = false) String startDate,
                                 @RequestParam(value = "endDate", required = false) String endDate,
                                 @RequestParam(value = "minAmount", required = false) Integer minAmount,
                                 @RequestParam(value = "maxAmount", required = false) Integer maxAmount,
                                 @RequestParam(value = "status", required = false, defaultValue = "ALL") String status,
                                 @RequestParam(value="input", required = false) String input,
                                 @RequestParam(value="page", required = false,defaultValue = "0") String page,
                                    Model model
                                ) {
        Sort sort = Sort.by(Sort.Direction.DESC, "date");
        Pageable pageable = PageRequest.of(Integer.parseInt(page), 5, sort);
        Page< TransactionPayment> list;
        if(input!=null) {
            model.addAttribute("input", input);
            list = transactionPaymentService.findByTransactionIdOrUserPhone(input.trim(),input.trim(),pageable);
        }
        else if ((startDate != null && !startDate.isEmpty()) ||
                (endDate != null && !endDate.isEmpty()) ||
                minAmount != null || maxAmount != null || status != null) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            if (startDate != null && !startDate.isEmpty()) {
                LocalDate parsedStartDate = LocalDate.parse(startDate, DateTimeFormatter.ofPattern("MM/dd/yyyy"));
                model.addAttribute("startDate", parsedStartDate.format(formatter));
            }

            if (endDate != null && !endDate.isEmpty()) {
                LocalDate parsedEndDate = LocalDate.parse(endDate, DateTimeFormatter.ofPattern("MM/dd/yyyy"));
                model.addAttribute("endDate", parsedEndDate.format(formatter));
            }
            list = transactionPaymentService.filterTransactions(
                    (startDate != null && !startDate.isEmpty()) ? LocalDateTime.parse(startDate, formatter) : null,
                    (endDate != null && !endDate.isEmpty()) ? LocalDateTime.parse(endDate, formatter) : null,
                    minAmount,
                    maxAmount,
                    ("ALL".equals(status) || status == null) ? null : TransactionStatus.valueOf(status),
                    pageable
            );
            model.addAttribute("startDate", startDate);
            model.addAttribute("endDate", endDate);
            model.addAttribute("minAmount", minAmount);
            model.addAttribute("maxAmount", maxAmount);
            model.addAttribute("status", status);

        }
        else{
            list = transactionPaymentService.findAll(pageable);
        }
        if(list.hasContent()) {
            model.addAttribute("transactions", list);
        }
        else
            model.addAttribute("emptyList", "Không có giao dịch nào được tìm thấy!");

        return "admin/transactionpayment/transpayments";
    }

}

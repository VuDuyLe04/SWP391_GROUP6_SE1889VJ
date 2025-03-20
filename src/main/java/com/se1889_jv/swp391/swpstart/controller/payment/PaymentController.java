package com.se1889_jv.swp391.swpstart.controller.payment;

import com.se1889_jv.swp391.swpstart.domain.TransactionPayment;
import com.se1889_jv.swp391.swpstart.domain.TransactionService;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.dto.PaymentDTO;
import com.se1889_jv.swp391.swpstart.service.implementservice.TransactionPaymentService;
import com.se1889_jv.swp391.swpstart.service.implementservice.TransactionServiceService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import com.se1889_jv.swp391.swpstart.util.constant.TransactionStatus;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.LocalDateTime;


@Controller
public class PaymentController {
    @Autowired
    private UserService userService;

    @Autowired
    private TransactionPaymentService transactionPaymentService;

    @Autowired
    private TransactionServiceService transactionServiceService;
    @GetMapping("/payment")
    public String paymentPage(Model model) {


        PaymentDTO paymentDTO = new PaymentDTO();
        paymentDTO.setAmount(50000);
        paymentDTO.setGate("MBBANK");
        model.addAttribute("paymentDTO", paymentDTO);

        return "admin/payment/payment";
    }

    @PostMapping("/payment")
    public String paymentQR(
            Model model,
            @Valid @ModelAttribute("paymentDTO") PaymentDTO paymentDTO,
            BindingResult bindingResult
    ) {
        if (!paymentDTO.getGate().equals("MBBANK")) {
            bindingResult.rejectValue("gate", "gate", "Xin lỗi cổng thanh toán này hiện không khả dụng, vui lòng chọn cổng khác");
        }
        if (paymentDTO.getAmount() != null) {
            if (paymentDTO.getAmount() < 50000 || paymentDTO.getAmount() % 5000 != 0) {
                bindingResult.rejectValue("amount", "amount", "Số tiền phải lớn hơn 50.000đ và là bội của 5000");
            }
        }

        if (bindingResult.hasErrors()) {
            return "admin/payment/payment";
        }
        //logic
        User user = Utility.getUserInSession();
        paymentDTO.setContent("RCK");
        model.addAttribute("paymentDTO", paymentDTO);

        //
        return "admin/payment/qr";
    }

    @GetMapping("/owner/payment/history")
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


        Sort sort = Sort.by(Sort.Direction.DESC, "date");
        Pageable pageable = PageRequest.of(page, 5, sort);
        User userInSession = Utility.getUserInSession();
        User user = this.userService.findById(userInSession.getId());
        Page<TransactionPayment> list = this.transactionPaymentService.findAllByUser(user, pageable);

        if (input != null && !input.trim().isEmpty()) {
            model.addAttribute("input", input);
            list = transactionPaymentService.findByTransactionIdContainingAndUser(input,user,pageable);
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
                    startDateTime, endDateTime, minAmount, maxAmount, transactionStatus, user.getId(), pageable
            );


        }

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

        return "admin/payment/history";
    }


//    public String historyPayemtPage(Model model,
//                              @RequestParam(defaultValue = "0") int page) {
//        Pageable pageable = PageRequest.of(page, 5);
//        User userInSession = Utility.getUserInSession();
//        User user = this.userService.findById(userInSession.getId());
//        Page<TransactionPayment> transactionPaymentPage = this.transactionPaymentService.findAllByUser(user, pageable);
//        model.addAttribute("currentPage", page);
//        model.addAttribute("totalPages", transactionPaymentPage.getTotalPages());
//        model.addAttribute("listTransactionPayment", transactionPaymentPage.getContent());
//        return "admin/payment/history";
//
//    }

    @GetMapping("/owner/service/history")
    public String transervices(
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
        User userInSession = Utility.getUserInSession();
        User user = this.userService.findById(userInSession.getId());
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
        Page<TransactionService> list = transactionServiceService.filterTransactions(
                startDateTime,
                endDateTime,
                minAmount,
                maxAmount,
                transactionStatus,
                user.getId(),
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

        return "admin/service/history";
    }

}

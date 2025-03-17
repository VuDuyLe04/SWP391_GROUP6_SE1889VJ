package com.se1889_jv.swp391.swpstart.controller.payment;

import com.se1889_jv.swp391.swpstart.domain.TransactionPayment;
import com.se1889_jv.swp391.swpstart.domain.TransactionService;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.dto.PaymentDTO;
import com.se1889_jv.swp391.swpstart.service.PaymentService;
import com.se1889_jv.swp391.swpstart.service.implementservice.TransactionPaymentService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
public class PaymentController {
    @Autowired
    private UserService userService;

    @Autowired
    private TransactionPaymentService transactionPaymentService;

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

    @GetMapping("/payment/history")
    public String historyPage(Model model,
                              @RequestParam(defaultValue = "0") int page) {
        Pageable pageable = PageRequest.of(page, 5);
        User userInSession = Utility.getUserInSession();
        User user = this.userService.findById(userInSession.getId());
        Page<TransactionPayment> transactionPaymentPage = this.transactionPaymentService.findAllByUser(user, pageable);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", transactionPaymentPage.getTotalPages());
        model.addAttribute("listTransactionPayment", transactionPaymentPage.getContent());
        return "admin/payment/history";

    }
}

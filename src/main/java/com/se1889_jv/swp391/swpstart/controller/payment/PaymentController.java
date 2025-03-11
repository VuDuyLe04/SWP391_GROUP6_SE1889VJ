package com.se1889_jv.swp391.swpstart.controller.payment;

import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.dto.PaymentDTO;
import com.se1889_jv.swp391.swpstart.util.Utility;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class PaymentController {

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
}

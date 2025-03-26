package com.se1889_jv.swp391.swpstart.controller.sms;

import com.se1889_jv.swp391.swpstart.domain.sms.ResponseView;
import com.se1889_jv.swp391.swpstart.domain.sms.SendSmsModel;
import com.se1889_jv.swp391.swpstart.service.SmsService;

import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SmsController {
    @Autowired
    private UserService userService;

    private final SmsService smsService;

    public SmsController(SmsService smsService) {
        this.smsService = smsService;
    }

    @GetMapping("/reset/password")
    public String resetPasword(Model model) {
        return "client/auth/reset-password";
    }

    @PostMapping("/reset/password")
    public String sendSms(@RequestParam(value = "phoneNumber") String phoneNumber, Model model) {
        String phoneRegex = "^0[0-9]{9}$";

        if (!phoneNumber.matches(phoneRegex)) {
            model.addAttribute("error", "Số điện thoại không hợp lệ. Vui lòng nhập lại");
            model.addAttribute("phoneNumber", phoneNumber);
            return "client/auth/reset-password";
        }

        if (!userService.checkPhoneExist(phoneNumber)) {
            model.addAttribute("error", "Tài khoản không tồn tại. Vui lòng nhập lại");
            model.addAttribute("phoneNumber", phoneNumber);
            return "client/auth/reset-password";
        }

        try {
            ResponseView response = smsService.sendSms(phoneNumber);

            return "redirect:/reset/password/otp";  // trả về tên view (thường là một trang HTML hoặc JSP)
        } catch (Exception e) {
            e.printStackTrace();  // Log error for debugging
            // Return a specific error response with a BAD_REQUEST status
            ResponseView errorResponse = new ResponseView();
            errorResponse.setHasError(true);
            errorResponse.setErrorCode(500);
            model.addAttribute("response", errorResponse);
            return "client/auth/reset-password";  // trả về trang lỗi
        }
    }

    @GetMapping("/reset/password/otp")
    public String otp(Model model) {
        return "client/auth/otp-confirm";
    }
}

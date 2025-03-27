package com.se1889_jv.swp391.swpstart.controller.sms;

import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.sms.ResponseView;
import com.se1889_jv.swp391.swpstart.domain.sms.SendSmsModel;
import com.se1889_jv.swp391.swpstart.repository.UserRepository;
import com.se1889_jv.swp391.swpstart.service.SmsService;

import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.Duration;
import java.time.Instant;

@Controller
public class SmsController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    private final SmsService smsService;

    public SmsController(SmsService smsService) {
        this.smsService = smsService;
    }

    @GetMapping("/reset/password")
    public String resetPasword(Model model) {
        return "client/auth/reset-password";
    }

    @PostMapping("/reset/password")
    public String sendSms(@RequestParam(value = "phoneNumber") String phoneNumber, Model model, HttpSession session) {
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

        if (this.userRepository.findByPhone(phoneNumber).isReset() == false) {
            Duration duration = Duration.between(this.userRepository.findByPhone(phoneNumber).getResetExpiryTime(), Instant.now());
            int s = (int) duration.getSeconds();
            model.addAttribute("error", "Vui lòng thử lại sau " + s + " giây." );
            model.addAttribute("phoneNumber", phoneNumber);
            return "client/auth/reset-password";
        }

        try {

            ResponseView response = smsService.sendSms(phoneNumber,SmsService.generateRandomPassword(10) );
            session.setAttribute("message", "Hệ thống đã gửi mật khẩu reset đến số điện thoại: " + phoneNumber);
            return "redirect:/login";
        } catch (Exception e) {
            e.printStackTrace();  // Log error for debugging
            // Return a specific error response with a BAD_REQUEST status
            ResponseView errorResponse = new ResponseView();
            errorResponse.setHasError(true);
            errorResponse.setErrorCode(500);
            model.addAttribute("error", "Có lỗi xảy ra, vui lòng thử lại");
            return "client/auth/reset-password";  // trả về trang lỗi
        }
    }

//    @GetMapping("/reset/password/otp")
//    public String otp(Model model) {
//        return "client/auth/otp-confirm";
//    }

//    @PostMapping("/reset/password/otp")
//    public String confirmOtp(
//            @RequestParam(value = "phoneNumber", required = true) String phoneNumber,
//            @RequestParam(value = "otp", required = false) String otp,
//            Model model) {
//
//        if (otp == null || otp.isEmpty()) {
//            model.addAttribute("error", "Vui lòng nhập mã OTP");
//            model.addAttribute("phoneNumber", phoneNumber);
//            return "client/auth/otp-confirm";
//        }
//        User user = this.userRepository.findByPhone(phoneNumber);
//
//        if (user == null) {
//            model.addAttribute("error", "Có lỗi xảy ra");
//            model.addAttribute("phoneNumber", phoneNumber);
//            return "client/auth/otp-confirm";
//        }
//        if (user != null && user.getOtp().equals(otp)) {
//
//        }
//
//    }
}

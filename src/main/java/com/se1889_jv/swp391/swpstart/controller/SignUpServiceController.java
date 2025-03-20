package com.se1889_jv.swp391.swpstart.controller;

import com.se1889_jv.swp391.swpstart.domain.Service;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.service.implementservice.ServiceService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class SignUpServiceController {
    @Autowired
    private UserService userService;

    @Autowired
    private ServiceService serviceService;

    @PostMapping("/signupservice")
    public String signUpService(
            @RequestParam(value = "id")Long id,
            Model model,
            HttpSession session) {
        User us = Utility.getUserInSession();
        if (us == null) {
            session.setAttribute("message", "Vui lòng đăng nhập để sử dụng dịch vụ");
            return "redirect:/#services";
        }

        User user = userService.findById(us.getId());
        if (user.getRole().getName().equals("STAFF") || user.getRole().getName().equals("ADMIN")) {
            session.setAttribute("message", "Tài khoản bạn không được phép mua dịch vụ");
            return "redirect:/#services";
        }

        List<Store> stores = Utility.getListStoreOfOwner(user);
        List<User> users = this.userService.getAllUserByStoreIn(stores);
        Service service1 = this.serviceService.findServiceById(id);

        if (service1 != null) {
            if (user.getBalance() >= service1.getPrice()) {
                User u = this.userService.handleBuyService(user, users, service1);
                session.setAttribute("user", u);
                session.setAttribute("service", service1);
                session.setAttribute("message","Mua dịch vụ thành công");
            }
            else {
                session.setAttribute("message","Bạn không đủ tiền để mua dịch vụ, vui lòng nạp thêm tiền");
            }
    }

        return "redirect:/owner/service/history";
    }


}

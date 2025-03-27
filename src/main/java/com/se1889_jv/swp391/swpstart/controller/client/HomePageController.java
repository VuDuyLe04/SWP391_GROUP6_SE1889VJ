package com.se1889_jv.swp391.swpstart.controller.client;

import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.dto.RegisterDTO;
import com.se1889_jv.swp391.swpstart.service.implementservice.ServiceService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomePageController {
    @Autowired
    private ServiceService serviceService;

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    public HomePageController(final UserService userService, final PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        model.addAttribute("services", this.serviceService.findAllServicesForHomePage());

        return "client/homepage/show";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {

        return "client/auth/login";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }
    @PostMapping("/register")
    public String handleRegister(
            @ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult,
            HttpSession session) {
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.registerDTOtoUser(registerDTO);

        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("OWNER"));
//        user.setReset(true);
        // save
        this.userService.createUser(user);
        session.setAttribute("message", "Đăng ký tài khoản thành công.");
        return "redirect:/login";

    }

    @GetMapping("/access-deny")
    public String getDenyPage(Model model) {

        return "client/auth/deny";
    }
}

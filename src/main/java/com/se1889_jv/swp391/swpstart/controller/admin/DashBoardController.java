package com.se1889_jv.swp391.swpstart.controller.admin;

import ch.qos.logback.core.model.Model;
import com.se1889_jv.swp391.swpstart.domain.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardController {
    @GetMapping("/dashboard")
    public String getDashboardPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }
        return "admin/dashboard/show";
    }
}

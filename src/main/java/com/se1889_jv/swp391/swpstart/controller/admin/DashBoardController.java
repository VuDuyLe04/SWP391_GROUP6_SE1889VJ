package com.se1889_jv.swp391.swpstart.controller.admin;

import ch.qos.logback.core.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardController {
    @GetMapping("/dashboard")
    public String getDashboardPage(Model model) {
        return "admin/dashboard/show";
    }

}

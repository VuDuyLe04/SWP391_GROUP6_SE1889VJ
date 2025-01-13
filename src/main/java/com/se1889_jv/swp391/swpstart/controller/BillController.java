package com.se1889_jv.swp391.swpstart.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BillController {
    @RequestMapping("/hello")
    public String bill(Model model) {
        model.addAttribute("mess", "Hello");
        return "/nam";
    }
}

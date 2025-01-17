package com.se1889_jv.swp391.swpstart.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {

    @GetMapping("/product")
    public String getListProductPage(Model model) {

        return "admin/product/table";
    }

}

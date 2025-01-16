package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import com.se1889_jv.swp391.swpstart.service.implementservice.ProductService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserStoreService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class BillController {
    @Autowired
    private ProductService productService;
    @Autowired
    private UserStoreService userStoreService;
    @GetMapping("/homesale")
    public String homeSale(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if( user != null){
            UserStore us = userStoreService.findUserStore(user.getId());
            us.getStore();

            model.addAttribute("user", "bo m day");

        } else {
            return "redirect:/access-deny";
        }


        return "admin/sale/homesale";
    }

}

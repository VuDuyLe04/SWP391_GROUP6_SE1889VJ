package com.se1889_jv.swp391.swpstart.controller;


import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import com.se1889_jv.swp391.swpstart.service.implementservice.ProductService;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserStoreService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@Controller
public class BillController {
    @Autowired
    private ProductService productService;
    @Autowired
    private UserStoreService userStoreService;
    @Autowired
    private UserService userService;
    @Autowired
    private StoreService storeService;


    @GetMapping("/homesale")
    public String homeSale(HttpSession session, Model model) {
        long storeId = (long) session.getAttribute("storeId");
        User user = userService.findUserById( (int) session.getAttribute("userId"));
        if(user != null){
            UserStore us = userStoreService.findUserStoreByUserIdAndStoreId(user.getId(),storeId);
            Store store = storeService.findStoreById(storeId);

            model.addAttribute("user", "bo m day");

        } else {
            return "redirect:/errorPage";
        }
        return "admin/sale/homesale";
    }
    //refer into errorPage
    @GetMapping("/errorPage")
    public String errorPage() {
        return "client/handleerror/errorPage";
    }
}

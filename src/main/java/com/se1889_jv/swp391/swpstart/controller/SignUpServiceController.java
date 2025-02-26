package com.se1889_jv.swp391.swpstart.controller;

import com.se1889_jv.swp391.swpstart.domain.Service;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class SignUpServiceController {
    @Autowired
    private UserService userService;

//    @PostMapping
//    public String signUpService(@ModelAttribute("service") Service service) {
//        User user = Utility.getUserInSession();
//        List<Store> stores = Utility.getListStoreOfOwner(user);
//
//        List<User> users = this.userService.getAllUserByStoreIn(stores);
//
//
//
//    }


}

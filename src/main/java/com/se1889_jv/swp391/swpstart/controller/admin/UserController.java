package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    StoreService storeService;

    @GetMapping("/usermanagement")
    public String getAllUser(@RequestParam(value = "input", required = false) String input,
                             @RequestParam(value = "role", required = false, defaultValue = "-1") String roleId,
                             @RequestParam(value = "active", required = false, defaultValue = "-1") String active,
                             Model model) {
        List<User> users = userService.getAll();
        if (!(input == null)) {
            users = userService.getUsersBySearch(input, input);
            model.addAttribute("input", input);
        } else if (!roleId.equals("-1") && active.equals("-1"))
            users = userService.getUsersbyRoleID(Long.parseLong(roleId));
        else if (roleId.equals("-1") && !active.equals("-1"))
            users = userService.getUsersByActive(active.equals("1"));
        else if (!roleId.equals("-1") && !active.equals("-1"))
            users = userService.getUsersByRoleIDAndActive(Long.parseLong(roleId), active.equals("1"));
        model.addAttribute("active", active);
        model.addAttribute("roleId", roleId);
        model.addAttribute("users", users);

//        List<Store> stores = storeService.getAllStores();
//        model.addAttribute("stores", stores);

        return "admin/user/usermanagement";
    }

}

package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping("/usermanagement")
    public String getAllUser(Model model) {
        List<User> users = userService.getAll();
        model.addAttribute("users", users);
        return "admin/user/usermanagement";
    }

    @GetMapping("searchuser")
    public String getUsersBySearch(@RequestParam(value = "input") String input, Model model) {
        List<User> users = userService.getUsersBySearch(input, input);
        model.addAttribute("input", input);
        model.addAttribute("users", users);
        return "admin/user/usermanagement";
    }

    @GetMapping("filteruser")
    public String getUserByFilter(@RequestParam(value = "role") String roleId,
                                  @RequestParam(value = "active") String active, Model model) {

        List<User> users = new ArrayList<>();

        if (roleId.equals("-1") && active.equals("-1")) users = userService.getAll();
        else if (!roleId.equals("-1") && active.equals("-1"))
            users = userService.getUsersbyRoleID(Long.parseLong(roleId));
        else if (roleId.equals("-1") && !active.equals("-1"))
            users = userService.getUsersByActive(active.equals("1"));
        else users = userService.getUsersByRoleIDAndActive(Long.parseLong(roleId), active.equals("1"));

        model.addAttribute("users", users);
        model.addAttribute("active", active);
        model.addAttribute("roleId", roleId);
        return "admin/user/usermanagement";
    }
}

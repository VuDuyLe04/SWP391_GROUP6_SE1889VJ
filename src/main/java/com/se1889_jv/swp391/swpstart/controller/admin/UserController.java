package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.Role;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.service.implementservice.RoleService;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    StoreService storeService;
    @Autowired
    RoleService roleService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/usermanagement")
    public String getAllUser(@RequestParam(value = "input", required = false) String input,
                             @RequestParam(value = "role", required = false, defaultValue = "-1") String roleId,
                             @RequestParam(value = "active", required = false, defaultValue = "-1") String active,
                             @RequestParam(value = "page", required = false, defaultValue = "0") String page,
                             Model model) {
        Sort sort = Sort.by(Sort.Direction.ASC, "name");
        Pageable pageable = PageRequest.of(Integer.parseInt(page), 5, sort);
        Page<User> users;

        if (input != null && !input.isEmpty()) {
            users = userService.getUsersBySearch(input, input, pageable);
        } else {
            long roleIdValue = "-1".equals(roleId) ? -1 : Long.parseLong(roleId);
            boolean isActive = "1".equals(active);

            if (roleIdValue != -1 && "-1".equals(active)) {
                users = userService.getUsersbyRoleID(roleIdValue, pageable);
            } else if (roleIdValue == -1 && !"-1".equals(active)) {
                users = userService.getUsersByActive(isActive, pageable);
            } else if (roleIdValue != -1 && !"-1".equals(active)) {
                users = userService.getUsersByRoleIDAndActive(roleIdValue, isActive, pageable);
            } else {
                users = userService.getAll(pageable);
            }
        }

        model.addAttribute("input", input != null ? input : "");
        model.addAttribute("active", active);
        model.addAttribute("roleId", roleId);
        model.addAttribute("userPage", users);
        model.addAttribute("roles", roleService.getAllRoles());

        return "admin/user/usermanagement";
    }

    @GetMapping("checkphone")
    public String checkPhone(@RequestParam(value="createdPhone",required = false) String createdPhone,
                             @RequestParam(value="updatedPhone",required = false) String updatedPhone,
                             @RequestParam(value="id",required = false) String id,
                             Model model) {
        String error = null;
        String phone = updatedPhone != null ? updatedPhone : createdPhone;

        if (phone != null) {
            User existingUser = userService.getUserByPhone(phone);
            if (existingUser != null) {
                if (id != null && existingUser.getId() != Long.parseLong(id)) {
                    error = "Số điện thoại đã tồn tại!";
                } else if (id == null) {
                    error = "Số điện thoại đã tồn tại!";
                }
            }
        }

        model.addAttribute("error", error);
        
        if (updatedPhone != null && id != null) {
            User user = userService.findById(Long.parseLong(id));
            user.setPhone(updatedPhone);
            model.addAttribute("useru", user);
            return "admin/user/updateuser";
        } else {
            model.addAttribute("phone", phone);
            return "admin/user/createuser";
        }
    }
    @GetMapping("createuser")
    public String createUser(@RequestParam(value = "phone",required = false) String phone,
                             @RequestParam(value = "password",required = false) String password,
                             @RequestParam(value = "name",required = false) String name,
                             @RequestParam(value = "active", defaultValue = "false") String active,
                             Model model) {
        if(phone !=null){
        User sessionUser = Utility.getUserInSession();
        User user = new User();
        user.setPhone(phone);
        user.setPassword(passwordEncoder.encode(password));

        // Định dạng lại name
        String formattedName = Arrays.stream(name.trim().toLowerCase().split("\\s+"))
                .map(word -> Character.toUpperCase(word.charAt(0)) + word.substring(1))
                .collect(Collectors.joining(" "));
        user.setName(formattedName);

        user.setActive(Boolean.parseBoolean(active));
        user.setCreatedBy(sessionUser.getName());
        user.setRole(roleService.getRole(2L));
        user.setUserStores(null);
        userService.createUser(user);

        if (userService.getUserByPhone(phone) != null) {
            model.addAttribute("success", "Tạo người dùng thành công");
        }
        }

        return "admin/user/createuser";
    }


    @GetMapping("updateuser")
    public String updateUser(@RequestParam (value="id", required = false) String id,
                             @RequestParam(value="phone",required = false) String phone,
//                             @RequestParam(value="password",required = false) String password,
                             @RequestParam(value="name",required = false) String name,
                             @RequestParam(value="active",defaultValue = "false") boolean active,
                             Model model){
        User user = new User();

            user = userService.findById(Long.parseLong(id));
        if(phone != null){
            user.setPhone(phone);
//            user.setPassword(password);
            user.setName(name);
            user.setActive(active);

            userService.createUser(user);
            if(user.getPhone().equals(phone)){
                model.addAttribute("success","Cập nhật người dùng thành công!");
            }
        }

        model.addAttribute("useru", user);
        return "admin/user/updateuser";
    }

    @GetMapping("/profile")
    public String getProfilePage(Model model){
        User user = Utility.getUserInSession();
        model.addAttribute("user", user);
        return "admin/profile/profile";
    }

}
// su khac biet giua return redirect and return ko co direct
// redirect sang mot url moi, thanh 2 request, ngan ngua viec gui lai form vi no la 2 request
//nen khi refresh lai trang thi no chi noi dung cua request thu 2,thuong khong gui dc du lieu kem
//chi co the gui qua url

// return ko redirect ko chuyen sang 1 url moi, chi 1 request, bi gui lai form
// va thuong dunf khi can tra ve file jsp de render , thuong gui dc du lieu di kem
// thong qua Modal


// dung param de lay du lieu tu request, nhung chi trong mot request thoi, con neu 2 request thi ko lay duoc
//vi du nhu neu dung redirect sang urrl moi thi ko lay duoc
// nma neu jsp gui len server,sau do server return ve jsp do (ko redirect) thi van lay duoc

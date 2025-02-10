package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.Role;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.service.implementservice.RoleService;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

    @GetMapping("/usermanagement")
    public String getAllUser(@RequestParam(value = "input", required = false) String input,
                             @RequestParam(value = "role", required = false, defaultValue = "-1") String roleId,
                             @RequestParam(value = "active", required = false, defaultValue = "-1") String active,
                             @RequestParam(value="page",required = false,defaultValue = "0") String page,
                             Model model) {
        Sort sort = Sort.by(Sort.Direction.ASC, "name");
        Pageable pageable = PageRequest.of(Integer.parseInt(page),5 ,sort);
        Page<User> users = userService.getAll(pageable);
        if (input != null) {
            users = userService.getUsersBySearch(input, input,pageable);
            model.addAttribute("input", input);
        }
        else if (!roleId.equals("-1") && active.equals("-1"))
            users = userService.getUsersbyRoleID(Long.parseLong(roleId),pageable);
        else if (roleId.equals("-1") && !active.equals("-1"))
            users = userService.getUsersByActive(active.equals("1"),pageable);
        else if (!roleId.equals("-1") && !active.equals("-1"))
            users = userService.getUsersByRoleIDAndActive(Long.parseLong(roleId), active.equals("1"),pageable);
        model.addAttribute("active", active);
        model.addAttribute("roleId", roleId);
        model.addAttribute("userPage", users);


        return "admin/user/usermanagement";
    }
    @GetMapping("adduser")
    public String addUserIn(){
        return "admin/user/adduserin";
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
            return "admin/user/adduserin";
        }
    }
    @GetMapping("createuser")
    public String createUser(@RequestParam(value = "phone") String phone,
                             @RequestParam(value = "password") String password,
                             @RequestParam(value = "name") String name,
                             @RequestParam(value = "active", defaultValue = "false") String active,
                             Model model) {

        User user = new User();
        user.setPhone(phone);
        user.setPassword(password);

        // Định dạng lại name
        String formattedName = Arrays.stream(name.trim().toLowerCase().split("\\s+"))
                .map(word -> Character.toUpperCase(word.charAt(0)) + word.substring(1))
                .collect(Collectors.joining(" "));
        user.setName(formattedName);

        user.setActive(Boolean.parseBoolean(active));
        user.setCreatedBy("admin");
        user.setRole(roleService.getRole(2L));
        user.setUserStores(null);
        userService.createUser(user);

        if (userService.getUserByPhone(phone) != null) {
            model.addAttribute("success", "Tạo người dùng thành công");
        }
        return "admin/user/adduserin";
    }

    @GetMapping("updateuser")
    public String updateUser(@RequestParam String id,
                             @RequestParam(value="phone",required = false) String phone,
                             @RequestParam(value="password",required = false) String password,
                             @RequestParam(value="name",required = false) String name,
                             @RequestParam(value="active",defaultValue = "false") String active,
                             Model model){
        User user = new User();

            user = userService.findById(Long.parseLong(id));
        if(phone != null){
            user.setPhone(phone);
            user.setPassword(password);
            user.setName(name);
            user.setActive(active.toLowerCase().equals("true"));

            userService.createUser(user);
            if(user.getPhone().equals(phone)){
                model.addAttribute("success","Cập nhật người dùng thành công!");
            }
        }

        model.addAttribute("useru", user);
        return "admin/user/updateuser";
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

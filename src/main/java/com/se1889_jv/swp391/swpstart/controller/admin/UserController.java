package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.Role;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.service.implementservice.RoleService;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
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
            users = userService.getUsersBySearch(input.trim(), input.trim(),1L, pageable);
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
        if(users.hasContent()){
            model.addAttribute("userPage", users);
        }
        else{
            model.addAttribute("EmptyList", "Không có tài khoản nào được tìm thấy!");
        }
        model.addAttribute("input", input != null ? input : "");
        model.addAttribute("active", active);
        model.addAttribute("roleId", roleId);
//        model.addAttribute("userPage", users);
        model.addAttribute("roles", roleService.getAllRoles());

        return "admin/user/usermanagement";
    }

    @GetMapping("/checkphone")
    public String checkPhone(@RequestParam(value="createdPhone",required = false) String createdPhone,
                             @RequestParam(value="updatedPhone",required = false) String updatedPhone,
                             @RequestParam(value="id",required = false) String id,
                             Model model) {
        String error = null;
        String phone = (updatedPhone != null ? updatedPhone : createdPhone).trim();

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



    @GetMapping("/createuser")
    public String createUser(@RequestParam(value = "phone", required = false) String phone,
                             @RequestParam(value = "password", required = false) String password,
                             @RequestParam(value = "name", required = false) String name,
                             @RequestParam(value = "active", defaultValue = "false") String active,
                             Model model) {
        if (phone != null && password != null && name != null) {

            if (!phone.matches("^[0-9]{10}$")) {
                model.addAttribute("error", "Số điện thoại không hợp lệ.");
                return "admin/user/createuser";
            }
            if (userService.getUserByPhone(phone) != null) {
                model.addAttribute("error", "Số điện thoại đã tồn tại.");
                return "admin/user/createuser";
            }

            // Kiểm tra định dạng mật khẩu
            if (!password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$")) {
                model.addAttribute("error", "Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt.");
                return "admin/user/createuser";
            }
            if (!name.trim().matches("^[\\p{L}\\s]+$")){
                model.addAttribute("error", "Tên không được chứa số và các kí tự đặc biệt! ");
                return "admin/user/createuser";
            }

            User sessionUser = Utility.getUserInSession();
            User user = new User();
            user.setPhone(phone);
            user.setPassword(passwordEncoder.encode(password));

            // Định dạng lại tên (chữ cái đầu viết hoa)
            String formattedName = Arrays.stream(name.trim().toLowerCase().split("\\s+"))
                    .map(word -> Character.toUpperCase(word.charAt(0)) + word.substring(1))
                    .collect(Collectors.joining(" "));
            user.setName(formattedName);

            user.setActive(Boolean.parseBoolean(active));
            user.setCreatedBy(sessionUser.getName());
            user.setRole(roleService.getRole(2L));
            user.setUserStores(null);

            // Kiểm tra xem tạo user có thành công không
            boolean isCreated = userService.createUser(user)!=null;
            if (isCreated) {
                model.addAttribute("success", "Tạo người dùng thành công.");
            } else {
                model.addAttribute("error", "Không thể tạo người dùng, vui lòng thử lại.");
            }
        } else{

        }

        return "admin/user/createuser";
    }


    @GetMapping("/updateuser")
    public String updateUser(@RequestParam (value="id", required = false) String id,
                             @RequestParam(value="phone",required = false) String phone,
//                             @RequestParam(value="password",required = false) String password,
                             @RequestParam(value="name",required = false) String name,
                             @RequestParam(value="active",defaultValue = "false") boolean active,
                             Model model){
        User user = new User();
        user = userService.findById(Long.parseLong(id));
        if(phone != null && phone.matches("^[0-9]{10}$")  && name!=null && name.matches("^[a-zA-Z\s]+$")) {
            if(userService.getUserByPhone(phone) == null)  user.setPhone(phone);
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
        User userSession = Utility.getUserInSession();
        User user = this.userService.findById(userSession.getId());
        model.addAttribute("user", user);
        return "admin/profile/profile";
    }

    @PostMapping("/changepassword")
    public String handleChangePassword(
            Model model, HttpSession session,
            @RequestParam(value = "oldPassword", required = false) String oldPassword,
            @RequestParam(value = "newPassword", required = false) String newPassword,
            @RequestParam(value = "repeatNewPassword", required = false) String repeatNewPassword
            ){
        User userSession = Utility.getUserInSession();
        User user = this.userService.findById(userSession.getId());

        if (passwordEncoder.matches(oldPassword, user.getPassword())) {
            if (newPassword.isEmpty() || newPassword.length() < 3) {
                model.addAttribute("errorNew" ,"Mật khẩu phải có tối thiểu 3 ký tự");
                model.addAttribute("user", userSession);
                model.addAttribute("oldPassword", oldPassword);
                model.addAttribute("newPassword", newPassword);
                model.addAttribute("repeatNewPassword", repeatNewPassword);
                return "admin/profile/profile";
            }

            if (oldPassword.equals(newPassword)) {
                model.addAttribute("user", userSession);
                model.addAttribute("errorNew", "Mật khẩu mới phải khác mật khẩu cũ");
                model.addAttribute("oldPassword", oldPassword);
                model.addAttribute("newPassword", newPassword);
                model.addAttribute("repeatNewPassword", repeatNewPassword);
                return "admin/profile/profile";
            }

            if (newPassword.equals(repeatNewPassword)) {
                user.setPassword(passwordEncoder.encode(newPassword));
                user.setUpdatedAt(Instant.now());
                user.setUpdatedBy(userSession.getName());
                User updateUser = this.userService.createUser(user);
                updateUser.setPassword(null);
                session.setAttribute("user", updateUser);
                session.setAttribute("message", "Đổi mật khẩu thành công");
                return "redirect:/profile";
            }
            else  {
                model.addAttribute("user", userSession);
                model.addAttribute("errorReNew", "Mật khẩu không khớp");
                model.addAttribute("oldPassword", oldPassword);
                model.addAttribute("newPassword", newPassword);
                model.addAttribute("repeatNewPassword", repeatNewPassword);
                return "admin/profile/profile";
            }


        } else {
            model.addAttribute("user", userSession);
            model.addAttribute("errorOld", "Mật khẩu cũ không đúng");
            model.addAttribute("oldPassword", oldPassword);
            model.addAttribute("newPassword", newPassword);
            model.addAttribute("repeatNewPassword", repeatNewPassword);
            return "admin/profile/profile";
        }

    }

    @PostMapping("/profile/update")
    public String handleUpdateProfile(Model model,HttpSession session, @Valid @ModelAttribute("user") User user, BindingResult bindingResult){
        User userSession = Utility.getUserInSession();
        if (bindingResult.hasErrors()) {

            return "admin/profile/profile";
        }

        User updateUser = this.userService.updateUser(user);
        updateUser.setPassword(null);
        session.setAttribute("user", updateUser);
        session.setAttribute("message", "Cập nhật thông tin thành công");
        return "redirect:/profile";
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

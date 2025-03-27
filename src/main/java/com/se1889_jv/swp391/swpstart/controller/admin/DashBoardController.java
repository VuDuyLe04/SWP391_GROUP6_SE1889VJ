package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.Role;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.repository.RoleRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class DashBoardController {

    private final RoleRepository roleRepository;

    @GetMapping("/dashboard/admin")
    public String getDashboardPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }
        Role staffRole = roleRepository.findByName("STAFF")
                .orElseThrow(() -> new RuntimeException("Role not found"));

        Role ownerRole = roleRepository.findByName("OWNER")
                .orElseThrow(() -> new RuntimeException("Role not found"));

        Long countStaff = (long) staffRole.getUsers().size();
        Long countOwner = (long) ownerRole.getUsers().size();
        model.addAttribute("countStaff", countStaff);
        model.addAttribute("countOwner", countOwner);

        return "admin/dashboard/show";
    }

}

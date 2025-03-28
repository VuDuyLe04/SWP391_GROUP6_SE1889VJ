package com.se1889_jv.swp391.swpstart.config;

import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.repository.UserRepository;
import com.se1889_jv.swp391.swpstart.util.Utility;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class UserSessionUpdateService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private HttpSession session;

//    @Scheduled(fixedRate = 2000)
//    public void updateUserInSession() {
//        System.out.println("updateUserInSession");
////        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        Object oldUser = session.getAttribute("user");
//
//        User user = Utility.getUserInSession();
//
//        if (user != null) {
////            String username = user.getPhone();
//            User freshUser = this.userRepository.findById(user.getId()).orElse(null);
//
//            if (freshUser != null) {
////                // Tạo một UserDetails mới từ dữ liệu cập nhật
////                UserDetails updatedUserDetails = new org.springframework.security.core.userdetails.User(
////                        freshUser.getPhone(),
////                        freshUser.getPassword(),
////                        true, true, true, freshUser.isActive(),
////                        Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + freshUser.getRole().getName()))
////                );
////
////                // Cập nhật authentication trong SecurityContext
////                Authentication newAuth = new UsernamePasswordAuthenticationToken(
////                        updatedUserDetails,
////                        auth.getCredentials(),
////                        updatedUserDetails.getAuthorities()
////                );
////
////                SecurityContextHolder.getContext().setAuthentication(newAuth);
//
//                // Lưu user mới vào session nếu cần
//                session.setAttribute("user", freshUser);
//                System.out.println(freshUser);
//            }
//        }
//    }

}
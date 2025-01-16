package com.se1889_jv.swp391.swpstart.service;

import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    private final UserService userService;
    public CustomUserDetailsService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String phone) throws UsernameNotFoundException {
        // Viết logic để lấy user từ database dựa vào phone
        com.se1889_jv.swp391.swpstart.domain.User user = this.userService.getUserByPhone(phone);
        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        return new User(
                user.getPhone(),
                user.getPassword(), true, true, true, user.isActive(),
                Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + user.getRole().getName())));

    }
}

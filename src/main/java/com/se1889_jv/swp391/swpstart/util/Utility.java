package com.se1889_jv.swp391.swpstart.util;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.repository.StoreRepository;
import com.se1889_jv.swp391.swpstart.repository.UserRepository;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.oauth2.resource.OAuth2ResourceServerProperties;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class Utility {
    @Autowired
    private static UserRepository userRepository;

    public static Store getStoreInSession() {
        HttpServletRequest request =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        if (request == null) {
            return null; // Không thể lấy request
        }
        HttpSession session = request.getSession(false);
        Store store = (Store) session.getAttribute("store");
        if (store == null) {
            return null;
        }
        return store;
    }

    public static User getUserInSession() {
        // Kiểm tra nếu có request context
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (attributes != null) {
            HttpServletRequest request = attributes.getRequest();
            if (request != null) {
                HttpSession session = request.getSession(false); // false để không tạo session mới
                if (session != null) {
                    User user = (User) session.getAttribute("user");
                    return user;
                }
            }
        }
        // Nếu không có request context (chẳng hạn trong scheduled task), trả về null
        return null;
    }

    public static List<Store> getListStoreOfOwner(User user) {
        List<Store> stores = new ArrayList<>();
        stores = user.getUserStores().stream().map(item -> item.getStore()).collect(Collectors.toList());

        return stores;
    }

    /**
     * Get the login of the current user.
     *
     * @return the login of the current user.
     */

//    public static Optional<String> getCurrentUserLogin() {
//        SecurityContext securityContext = SecurityContextHolder.getContext();
//        return Optional.ofNullable(extractPrincipal(securityContext.getAuthentication()));
//    }

    private static String extractPrincipal(Authentication authentication) {
        if (authentication == null) {
            return null;
        } else if (authentication.getPrincipal() instanceof UserDetails springSecurityUser) {
            return springSecurityUser.getUsername();
        } else if (authentication.getPrincipal() instanceof String s) {
            return s;
        }
        return null;
    }

    public static boolean checkExpiration(User user) {
        return user.isStatusService();
    }

}

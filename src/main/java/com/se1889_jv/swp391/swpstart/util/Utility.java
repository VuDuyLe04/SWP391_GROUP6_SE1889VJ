package com.se1889_jv.swp391.swpstart.util;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.repository.StoreRepository;
import com.se1889_jv.swp391.swpstart.repository.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.ArrayList;
import java.util.List;

@Service
public class Utility {
    @Autowired
    private UserRepository userRepository;

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
        HttpServletRequest request =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        if (request == null) {
            return null; // Không thể lấy request
        }
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return null;
        }
        return user;
    }

    public static List<Store> getListStoreOfOwner(User user) {
        List<Store> stores = new ArrayList<>();
//        stores = user.getUserStores().

        return List.of(getStoreInSession());
    }

}

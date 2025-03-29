package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserStoreService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import com.se1889_jv.swp391.swpstart.util.constant.UserAccessStoreStatusEnum;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FlowController {

    @Autowired
    private StoreService storeService;
    @Autowired
    private UserStoreService userStoreService;

    @PostMapping("/storesession")
    public String setStoreIntoSession(@RequestParam(value = "storeId") String storeId, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = Utility.getUserInSession();

        if (user.getRole().getName().equals("OWNER")) {
            try {
                session.setAttribute("store", this.storeService.findStoreById(Long.parseLong(storeId)));
                return "redirect:/saleproduct";
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("message", "Có lỗi xảy ra vui lòng thử lại.");
                return "redirect:/";
            }


        } else {

            Store store = new Store();
            try {
                store = storeService.findStoreById(Long.parseLong(storeId));
                UserStore userStore = this.userStoreService.findUserStoreByUserAndStore(user, store);
                if (userStore != null && userStore.getAccessStoreStatus().equals(UserAccessStoreStatusEnum.ACCESSED)) {
                    session.setAttribute("store", store);
                    return "redirect:/saleproduct";
                } else {
                    session.setAttribute("message", "Có lỗi xảy ra vui lòng thử lại.");
                    return "redirect:/";
                }

            } catch (NumberFormatException e) {
                session.setAttribute("message", "Có lỗi xảy ra vui lòng thử lại.");
                return "redirect:/";
            }

        }
    }


}

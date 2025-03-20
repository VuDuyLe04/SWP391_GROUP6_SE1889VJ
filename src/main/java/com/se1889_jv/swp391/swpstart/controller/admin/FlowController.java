package com.se1889_jv.swp391.swpstart.controller.admin;

import ch.qos.logback.core.model.Model;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.repository.StoreRepository;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FlowController {

    @Autowired
    private StoreService storeService;


    @PostMapping("/storesession")
    public String setStoreIntoSession(@RequestParam(value = "storeId") String storeId, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = Utility.getUserInSession();

        if (user.getRole().getName().equals("OWNER")) {
            session.setAttribute("store", this.storeService.findStoreById(Long.parseLong(storeId)));
            return "redirect:/saleproduct";
        } else {
            session.setAttribute("store", this.storeService.findStoreById(Long.parseLong(storeId)));
            return "redirect:/dashboard";
        }

    }


}

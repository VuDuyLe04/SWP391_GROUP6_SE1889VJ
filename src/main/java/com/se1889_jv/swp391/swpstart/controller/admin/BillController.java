package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import com.se1889_jv.swp391.swpstart.service.implementservice.ProductService;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserStoreService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@Controller
public class BillController {
    @Autowired
    private ProductService productService;
    @Autowired
    private UserStoreService userStoreService;
    @Autowired
    private UserService userService;
    @Autowired
    private StoreService storeService;

    @GetMapping("/homesale/{id}")
    public String homeSale(@PathVariable long id, HttpServletRequest request, Model model) {

        HttpSession session = request.getSession(false);

        User user = (User) session.getAttribute("user");


        if( user != null){
            model.addAttribute("user", "bo m day");
        } else {

        }


        Store store = this.storeService.findStoreById(id);

        UserStore userStore = this.userStoreService.findUserStoreByUserAndStore(user,store );

        if (userStore == null || userStore.getAccessStoreStatus().equals("ACCESSDENY")) {
            return "redirect:/access-deny";
        }
        session.setAttribute("store",store);
        return "redirect:/dashboard";
    }

}

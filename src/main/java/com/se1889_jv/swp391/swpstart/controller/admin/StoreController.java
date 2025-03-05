package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import com.se1889_jv.swp391.swpstart.domain.dto.PackagingDTO;
import com.se1889_jv.swp391.swpstart.domain.dto.StoreDTO;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserStoreService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import com.se1889_jv.swp391.swpstart.util.constant.StatusStoreEnum;
import com.se1889_jv.swp391.swpstart.util.constant.UserAccessStoreStatusEnum;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class StoreController {
    @Autowired
    StoreService storeService;

    private static final ModelMapper modelMapper = new ModelMapper();
    @Autowired
    private UserStoreService userStoreService;

    @GetMapping("/createstore")
    public String createStore( Model model) {
        model.addAttribute("StoreDTO", new StoreDTO());
        return "admin/store/createstore";  // Return JSP page
    }
    @PostMapping("/createstore")
    public String handleCreateStore(Model model,
                                    @Valid @ModelAttribute("StoreDTO") StoreDTO storeDTO,
                                    BindingResult bindingResult, RedirectAttributes redirectAttributes, HttpSession session) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("storeDTOError", storeDTO);
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.storeDTO", bindingResult);
            return "redirect:/createstore";
        }

        // Kiểm tra user trong session
        User user = (User) session.getAttribute("user");
        if (user == null) {
            redirectAttributes.addFlashAttribute("error", "Bạn cần đăng nhập để tạo cửa hàng!");
            return "redirect:/login";  // Điều hướng về trang login nếu chưa đăng nhập
        }
        List<UserStore> userStores = user.getUserStores();
        for (UserStore userStore : userStores) {
            if (userStore.getStore().getName().equalsIgnoreCase(storeDTO.getName().trim())) {
                model.addAttribute("storeDTOError", storeDTO);
                model.addAttribute("nameError", "Tên cửa hàng đã tồn tại!");
                return "admin/store/createstore";
            }
        }
        // Chuyển DTO thành Entity và lưu vào database
        Store store = modelMapper.map(storeDTO, Store.class);
        Store savedStore = storeService.saveStore(store);
        // Tạo quan hệ giữa User và Store
        UserStore userStore = new UserStore();
        userStore.setUser(user);
        userStore.setStore(savedStore);
        userStore.setAccessStoreStatus(UserAccessStoreStatusEnum.ACCESSED);
        userStoreService.saveUserStore(userStore);
        if(userStoreService.findUserStoreByUserAndStore(user, savedStore) != null) {
            model.addAttribute("success", "Tạo cửa hàng thành công!");

        }

        return "admin/store/createstore";
    }

}

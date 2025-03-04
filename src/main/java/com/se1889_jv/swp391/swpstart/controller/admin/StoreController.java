package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import com.se1889_jv.swp391.swpstart.domain.dto.PackagingDTO;
import com.se1889_jv.swp391.swpstart.domain.dto.StoreDTO;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import com.se1889_jv.swp391.swpstart.util.constant.UserAccessStoreStatusEnum;
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
    UserStore userStore;
    private static final ModelMapper modelMapper = new ModelMapper();
    @GetMapping("/createstore")
    public String createStore( @RequestParam(value = "name",required = false) String name, Model model) {

       if(name != null) {
           User user = Utility.getUserInSession();
           if(user != null) {
               List<Store> stores = user.getAllStores();
               for (Store store: stores) {
                   if (store.getName().equalsIgnoreCase(name.trim())) {
                       model.addAttribute("error", "Tên của cửa hàng đã tồn tại!");
                   }
               }
           }
       }
        model.addAttribute("StoreDTO", new StoreDTO());  // Add StoreDTO object to model
        return "admin/store/createstore";  // Return JSP page
    }

    @PostMapping("/createstore")
    public String handleCreateStore(Model model,@Valid @ModelAttribute("StoreDTO") StoreDTO storeDTO
            , BindingResult bindingResult, RedirectAttributes redirectAttributes
    ) {
        if (bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("storeDTOError", storeDTO);
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult. storeDTO", bindingResult);
            return "redirect:/createstore";
        }
        Store store = storeService.saveStore(modelMapper.map(storeDTO, Store.class));
        if(store != null) {
            User user = Utility.getUserInSession();
            if(user != null) {
                UserStore userStore = new UserStore();
                userStore.setUser(user);
                userStore.setStore(store);
                userStore.getAccessStoreStatus(UserAccessStoreStatusEnum.valueOf("ACCESSED"));
            }
            redirectAttributes.addFlashAttribute("success", "Tạo thành công");
        }

        return "redirect:/store"; // Redirect after successful creation
    }
}

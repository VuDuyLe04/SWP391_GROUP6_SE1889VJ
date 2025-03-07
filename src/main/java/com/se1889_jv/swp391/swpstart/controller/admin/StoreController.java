package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import com.se1889_jv.swp391.swpstart.domain.dto.PackagingDTO;
import com.se1889_jv.swp391.swpstart.domain.dto.StoreDTO;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserStoreService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import com.se1889_jv.swp391.swpstart.util.constant.StatusStoreEnum;
import com.se1889_jv.swp391.swpstart.util.constant.UserAccessStoreStatusEnum;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class StoreController {
    @Autowired
    StoreService storeService;

    private static final ModelMapper modelMapper = new ModelMapper();
    @Autowired
    private UserStoreService userStoreService;
    @Autowired
    private UserService userService;

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
            return "admin/store/createstore";
        }
        User user = (User) session.getAttribute("user");
        if (user == null) {
            redirectAttributes.addFlashAttribute("error", "Bạn cần đăng nhập để tạo cửa hàng!");
            return "redirect:/login";  // Điều hướng về trang login nếu chưa đăng nhập
        }
        User user1 = userService.findById(user.getId());
        List<Store> stores = Utility.getListStoreOfOwner(user1);
        for(Store store : stores) {
            if (store.getName().equalsIgnoreCase(storeDTO.getName())) {
                model.addAttribute("storeDTOError", storeDTO);
                model.addAttribute("nameError", "Tên cửa hàng đã tồn tại!");
                return "admin/store/createstore";
            }
        }
        Store store = modelMapper.map(storeDTO, Store.class);
        Store savedStore = storeService.saveStore(store);
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
    @GetMapping("/stores")
    public String listStores(@RequestParam(value = "input", required = false) String input,
                             @RequestParam(value = "role", required = false, defaultValue = "-1") String roleId,
                             @RequestParam(value = "status", required = false, defaultValue = "ALL") String status,
                             @RequestParam(value = "page", required = false, defaultValue = "0") String page,
                             Model model) {
        Sort sort = Sort.by(Sort.Direction.ASC, "name");
        Pageable pageable = PageRequest.of(Integer.parseInt(page), 5, sort);
        User user = Utility.getUserInSession();
        String userId = String.valueOf(user.getId());
        Page<Store> stores;
        try {
            if (input != null && !input.isEmpty()) {
                stores = storeService.findStoresbyNameOrAddressOfOwner(userId, input, userId, input, pageable);
                if (stores.isEmpty()) {
                    // Nếu không tìm thấy kết quả, lấy tất cả stores và thêm thông báo
                    stores = storeService.findStoresByCreatedBy(userId, pageable);
                    model.addAttribute("searchMessage", "Không tìm thấy cửa hàng phù hợp với từ khóa: " + input);
                }
                else if (status != null && !status.isEmpty() && (status.equals("ACTIVE") || status.equals("INACTIVE"))){
                    stores = storeService.findStoresByStatusAndNameOrAdress(userId,StatusStoreEnum.valueOf(status),
                            input,userId,StatusStoreEnum.valueOf(status),input,pageable);
                }

            }
            else {
                if ( status != null && !status.isEmpty() && (status.equals("ACTIVE") || status.equals("INACTIVE"))) {
                    stores = storeService.findStoresByStatus(StatusStoreEnum.valueOf(status),userId,pageable);
                }
                else stores = storeService.findStoresByCreatedBy(userId, pageable);
            }
        } catch (Exception e) {
            // Xử lý lỗi nếu có
            stores = storeService.findStoresByCreatedBy(userId, pageable);
            model.addAttribute("errorMessage", "Đã xảy ra lỗi khi tìm kiếm. Vui lòng thử lại!");
        }


        model.addAttribute("input", input != null ? input : "");
        model.addAttribute("status", status != null ? status : "");
        model.addAttribute("roleId", roleId);
        model.addAttribute("storePage", stores);
//        model.addAttribute("roles", roleService.getAllRoles());

        return "admin/store/liststore";
    }
    @RequestMapping(value = "updatestore", method = {RequestMethod.GET, RequestMethod.POST})
    public String updateStore(@RequestParam(value = "id",required = false) Long id
    , Model model) {
        if(id != null) {
            model.addAttribute("storeDTO", modelMapper.map(storeService.findStoreById(id), StoreDTO.class));
        }
        return "updatestore"; // Trả về tên trang JSP hoặc xử lý logic khác
    }


}

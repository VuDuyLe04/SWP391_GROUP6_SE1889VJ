package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.Packaging;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import com.se1889_jv.swp391.swpstart.domain.dto.PackagingDTO;
import com.se1889_jv.swp391.swpstart.service.implementservice.PackagingService;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserStoreService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class PackingController {
    @Autowired
    private PackagingService packagingService;

    @Autowired
    private UserStoreService userStoreService;

    @Autowired
    private StoreService storeService;

    @GetMapping("/packaings")
    public String packaings(HttpSession session, Model model,
                            @RequestParam(value = "page", required = false, defaultValue = "0") String page,
                            @RequestParam(value = "active", required = false, defaultValue = "-1") String active,
                            @RequestParam(value = "input", required = false) String input,
                            @RequestParam(value = "store", required = false, defaultValue = "0") String store
    ) {
        Sort sort = Sort.by(Sort.Direction.ASC, "quantityPerPackage");
        Pageable pageable = PageRequest.of(Integer.parseInt(page), 4, sort);
        User user = (User) session.getAttribute("user");

        if(user != null) {
            List<UserStore> userStores = userStoreService.getAllUserStoresByUserId(user.getId());
            List<Store> stores = new ArrayList<>();
            List<Long> storesId = userStores.stream()
                    .map(us -> us.getStore().getId())
                    .collect(Collectors.toList());

            for(UserStore userStore : userStores) {
                stores.add(storeService.findStoreById(userStore.getStore().getId()));
            }

            Page<Packaging> allPacksOfAllStore;

            if (input != null && !input.isEmpty()) {
                allPacksOfAllStore = packagingService.getPackagingByInput(input, pageable);
                model.addAttribute("input", input);
            }
            else {
                Long storeId = "0".equals(store) ? null : Long.parseLong(store);

                if (!active.equals("-1")) {
                    // Chuyển đổi active value thành storage value
                    boolean storageValue = active.equals("0"); // "0" là lưu trữ (storage=true), "1" là sử dụng (storage=false)

                    if (storeId != null) {
                        allPacksOfAllStore = packagingService.getPackagingByStoreAndStorage(storeId, storageValue, pageable);
                    } else {
                        allPacksOfAllStore = packagingService.getPackagingByStoresAndStorage(storesId, storageValue, pageable);
                    }
                    model.addAttribute("active", active);
                } else {
                    if (storeId != null) {
                        allPacksOfAllStore = packagingService.getAllPackagingByStoreId(storeId, pageable);
                    } else {
                        allPacksOfAllStore = packagingService.getAllPackByUserManage(storesId, pageable);
                    }
                }
            }

            List<Packaging> allPackOfOwner = packagingService.getAllPackagingForOwner(storesId);

            model.addAttribute("store", store);
            model.addAttribute("stores", stores);
            model.addAttribute("allPack", allPackOfOwner);
            model.addAttribute("packagings", allPacksOfAllStore.getContent());
            model.addAttribute("packagingPage", allPacksOfAllStore);
            return "admin/packaging/packaging";
        } else {
            return "redirect:/access-deny";
        }
    }
    @PostMapping("/updatePackaging")
    public String updatePackaging(HttpSession session, Model model, Packaging packaging) {
        User user = (User) session.getAttribute("user");
        if(user != null) {
            packagingService.updatePackaging(packaging);
            return "redirect:/packaings";
        } else {
            return "redirect:/access-deny";
        }

    }
    @PostMapping("/addPackaging")
    public String addPackaging(HttpSession session, Model model, PackagingDTO packagingDTO) {
        User user = (User) session.getAttribute("user");
        if(user != null) {
            Packaging pkg = new Packaging();
            Store store = storeService.findStoreById(packagingDTO.getStoreId());
            pkg.setPackageType(packagingDTO.getPackageType());
            pkg.setLiftCost(packagingDTO.getLiftCost());
            pkg.setQuantityPerPackage(packagingDTO.getQuantityPerPackage());
            pkg.setStorage(true);
            pkg.setCreatedBy(user.getName());
            pkg.setStore(store);
            packagingService.addPackaging(pkg);
            return "redirect:/packaings";
        } else {
            return "redirect:/access-deny";
        }
    }
}

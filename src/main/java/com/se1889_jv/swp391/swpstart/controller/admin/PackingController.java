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
                            @RequestParam(value = "store", required = false, defaultValue = "0") String store,
                            @RequestParam(value = "sort", required = false, defaultValue = "id,asc") String sort) {
        try {
            String[] sortParams = sort.split(",");
            if (sortParams.length != 2) {
                sortParams = new String[]{"id", "asc"};
            }

            String sortField = sortParams[0];
            Sort.Direction sortDirection = sortParams[1].equalsIgnoreCase("desc")
                    ? Sort.Direction.DESC : Sort.Direction.ASC;

            Sort sorting = Sort.by(sortDirection, sortField);
            Pageable pageable = PageRequest.of(Integer.parseInt(page), 4, sorting);

            User user = (User) session.getAttribute("user");
            if (user == null) {
                return "redirect:/access-deny";
            }

            List<UserStore> userStores = userStoreService.getAllUserStoresByUserId(user.getId());
            List<Store> stores = userStores.stream()
                    .map(UserStore::getStore)
                    .collect(Collectors.toList());
            List<Long> storesId = stores.stream()
                    .map(Store::getId)
                    .collect(Collectors.toList());

            Page<Packaging> allPacksOfAllStore;

            if (input != null && !input.isEmpty()) {
                allPacksOfAllStore = packagingService.getPackagingByInput(input, pageable);
                model.addAttribute("input", input);
            } else if ("0".equals(store)) {
                if(active.equals("-1")){
                    allPacksOfAllStore = packagingService.getAllPackByUserManage(storesId, pageable);
                } else if(active.equals("1")) {
                    allPacksOfAllStore = packagingService.getAllPackagingByStorage(storesId, pageable, true);
                } else {
                    allPacksOfAllStore = packagingService.getAllPackagingByStorage(storesId, pageable, false);
                }

            } else if (!active.equals("-1")) {
                Long storeId = Long.parseLong(store);
                allPacksOfAllStore = active.equals("1")
                        ? packagingService.getAllPackagingByStoresIdAndStorage(storeId, pageable, true)
                        : packagingService.getAllPackagingByStoresIdAndStorage(storeId, pageable, false);
            } else {
                Long storeId = Long.parseLong(store);
                allPacksOfAllStore = packagingService.getAllPackagingByStoreId(storeId, pageable);
            }
            model.addAttribute("active", active);
            model.addAttribute("store", store);
            model.addAttribute("stores", stores);
            model.addAttribute("packagings", allPacksOfAllStore.getContent());
            model.addAttribute("packagingPage", allPacksOfAllStore);
            model.addAttribute("sort", sort);

            return "admin/packaging/packaging";
        } catch (Exception e) {
            return "redirect:/error";
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

package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.WareHouse;
import com.se1889_jv.swp391.swpstart.service.implementservice.WareHouseService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class WareHouseController {
    @Autowired
    private WareHouseService wareHouseService;

    // sang trang tạo mới khu vực
    @GetMapping("/warehouse/create")
    public String getCreatePage(Model model) {
        model.addAttribute("warehouse", new WareHouse());
        Store store = Utility.getStoreInSession();
        if (store == null) {
            return "redirect:/dashboard";
        }
        return "admin/warehouse/create";
    }

    //tạo mới
    @PostMapping("/warehouse/create")
    public String createWareHouse(@ModelAttribute("warehouse") @Valid WareHouse wareHouse, BindingResult bindingResult, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            return "admin/warehouse/create";
        }
        Store store = Utility.getStoreInSession();
        this.wareHouseService.createWareHouse(wareHouse, store);
        return "redirect:/warehouse";
    }

    //bảng các khu vực
    @GetMapping("/warehouse")
    public String getTableWarehouse(Model model) {
        Store store = Utility.getStoreInSession();
        if (store == null) {
            return "redirect:/dashboard";
        }
        model.addAttribute("listWareHouse", this.wareHouseService.getAllWareHouse(store));
        return "admin/warehouse/table";
    }


    @GetMapping("/warehouse/update/{id}")
    public String getUpdatePage(@PathVariable("id") long id, Model model) {
        Store store = Utility.getStoreInSession();
        if (store == null) {
            return "redirect:/dashboard";
        }
        WareHouse wareHouse = this.wareHouseService.getWareHouseById(id);
        model.addAttribute("warehouse", wareHouse);
        return "admin/warehouse/update";
    }

    @PostMapping("/warehouse/update")
    public String updateWareHouse(
            @ModelAttribute("customer") @Valid WareHouse wareHouse,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            return "admin/warehouse/update";
        }

        this.wareHouseService.updateWareHouse(wareHouse);
        return "redirect:/warehouse";
    }


}

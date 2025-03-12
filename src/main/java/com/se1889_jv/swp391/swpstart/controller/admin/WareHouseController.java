package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.WareHouse;
import com.se1889_jv.swp391.swpstart.domain.dto.request.WareHouseCreationRequest;
import com.se1889_jv.swp391.swpstart.service.implementservice.ProductService;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.service.implementservice.WareHouseService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
public class WareHouseController {
    @Autowired
    private WareHouseService wareHouseService;

    @Autowired
    private StoreService storeService; // Thêm dòng này để inject StoreService

    // sang trang tạo mới khu vực
    @GetMapping("/warehouse/create")
    public String getCreatePage(Model model) {
        model.addAttribute("warehouse", new WareHouse());
        List<Store> listStore = storeService.getAllStores();

        model.addAttribute("listStore", listStore);
        return "admin/warehouse/create";
    }

    //tạo mới
    @PostMapping("/warehouse/create")
    public String createWareHouse(@ModelAttribute("warehouse") @Valid WareHouseCreationRequest request, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "admin/warehouse/create";
        }
        this.wareHouseService.createWareHouse(request);
        return "redirect:/fetch-all-warehouse";
    }

    //bảng các khu vực
    @GetMapping("/warehouse")
    public String getTableWarehouse(Model model) {
        Store store = Utility.getStoreInSession();
        System.out.println("Store trong session: " + store);

        List<WareHouse> warehouses = this.wareHouseService.getAllWareHouse(store);
        System.out.println("Danh sách kho: " + warehouses);

        model.addAttribute("listWareHouse", warehouses);
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
            @Valid @ModelAttribute("customer") WareHouse wareHouse,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            return "admin/warehouse/update";
        }

        this.wareHouseService.updateWareHouse(wareHouse);
        return "redirect:/warehouse";
    }


    @Autowired
    private ProductService productService;

    @GetMapping("/warehouse/detail/{id}")
    public String getWarehouseDetail(@PathVariable("id") Long id, Model model) {

        WareHouse warehouse = wareHouseService.getWareHouseById(id);
        if (warehouse == null) {
            return "redirect:/warehouse";
        }
        List<Product> productList = productService.getProductsByWarehouseId(id);
        productList.removeIf(product -> product.getTotalQuantity() <= 0);
        model.addAttribute("warehouse", warehouse);
        model.addAttribute("productList", productList);


        return "admin/warehouse/detail";
    }


    @GetMapping("/fetch-all-warehouse")
    public String getAllWareHouse(Model model) {
        var result = wareHouseService.getAll();
        model.addAttribute("listWareHouse", result);

        return "admin/warehouse/table";
    }

    @GetMapping("/warehouse/search")
    public String searchWarehouseByName(@RequestParam("name") String name, Model model) {
        List<WareHouse> warehouses = wareHouseService.searchWareHouseByName(name);
        model.addAttribute("listWareHouse", warehouses);
        return "admin/warehouse/table";
    }

}

package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.Product;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.WareHouse;
import com.se1889_jv.swp391.swpstart.domain.dto.request.WareHouseCreationRequest;
import com.se1889_jv.swp391.swpstart.service.implementservice.ProductService;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.service.implementservice.WareHouseService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
public class WareHouseController {
    @Autowired
    private WareHouseService wareHouseService;

    @Autowired
    private StoreService storeService;

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
    public String getTableWarehouse(@RequestParam(defaultValue = "0") int page, Model model) {
        Store store = Utility.getStoreInSession();
//        if (store == null) {
//            return "redirect:/dashboard";
//        }

        Page<WareHouse> warehousePage = this.wareHouseService.getWareHousesWithPagination(page, 5, store);
        model.addAttribute("listWareHouse", warehousePage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", warehousePage.getTotalPages());
        return "admin/warehouse/table";
    }

    //--------------------------------------------------------------------------

    @GetMapping("/warehouse/update/{id}")
    public String getUpdatePage(@PathVariable("id") long id, Model model) {
        List<Store> listStore = storeService.getAllStores();
//        if (store == null) {
//            return "redirect:/dashboard";
//        }
        model.addAttribute("listStore", listStore);
        WareHouse wareHouse = this.wareHouseService.getWareHouseById(id);
        model.addAttribute("warehouse", wareHouse);
        return "admin/warehouse/update";
    }


    @PostMapping("/warehouse/update")
    public String updateWareHouse(
            @Valid @ModelAttribute("warehouse") WareHouse wareHouse,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            return "admin/warehouse/update";
        }
        this.wareHouseService.updateWareHouse(wareHouse);
        return "redirect:/fetch-all-warehouse";
    }

//    @Autowired
//    private ProductService productService;

    @GetMapping("/warehouse/detail/{id}")
    public String getWarehouseDetail(@PathVariable("id") Long id, Model model, HttpSession session) {
        WareHouse warehouse = wareHouseService.getWareHouseById(id);
        if (warehouse == null) {
            return "redirect:/warehouse";
        }

        // Lấy user từ session
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/access-deny";
        }

        // Lấy danh sách sản phẩm thuộc cửa hàng của user
        List<Product> productList = wareHouseService.getProductsByWarehouseAndUser(id, user);

        model.addAttribute("warehouse", warehouse);
        model.addAttribute("productList", productList);
        return "admin/warehouse/detail";
    }

    @GetMapping("/fetch-all-warehouse")
    public String getAllWareHouse(@RequestParam(required = false, defaultValue = "1") int page,
                                  @RequestParam(required = false, defaultValue = "3") int size,
                                  Model model) {
        var result = wareHouseService.getAll(page, size);
        model.addAttribute("listWareHouse", result.getData());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", result.getTotalPages());
        return "admin/warehouse/table";
    }

    @GetMapping("/warehouse/search")
    public String searchWarehouseByName(@RequestParam("name") String name, Model model) {
        List<WareHouse> warehouses = wareHouseService.searchWareHouseByName(name);
        model.addAttribute("listWareHouse", warehouses);
        return "admin/warehouse/table";
    }


    @GetMapping("/warehouse/{id}")
    @ResponseBody
    public List<WareHouse> getWarehousesByStore(@PathVariable("id") Long id) {
        return wareHouseService.findByStore(id);
    }


}

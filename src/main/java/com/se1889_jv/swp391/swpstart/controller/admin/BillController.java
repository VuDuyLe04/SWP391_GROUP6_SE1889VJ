package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.*;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDTO;
import com.se1889_jv.swp391.swpstart.service.implementservice.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.List;


@Controller
public class BillController {
    @Autowired
    private ProductService productService;
    @Autowired
    private PackagingService packagingService;
    @Autowired
    private WareHouseService wareHouseService;
    @Autowired
    private StoreService storeService;

    @Autowired
    private CustomerService customerService;

    @PostMapping("/createbill")
    public String createBill(HttpSession session, Model model, BillDTO billDTO){
        List<BillDetail> l = billDTO.getBillDetails();

        model.addAttribute("bill", l);
        model.addAttribute("storeId", billDTO.getStoreId());
        return "admin/sale/viewbill";
    }
    @GetMapping("/sale")
    public String sale(HttpSession session, Model model){
        return "admin/sale/sale";
    }



    @GetMapping("/homesale/{id}")
    public String homeSale(@PathVariable(name = "id") long storeId, HttpSession session, Model model) {


        User user = (User) session.getAttribute("user");

        if( user != null){
            Store store = storeService.findStoreById(storeId);
            if(store != null){
                List<Product> productList = productService.getAllProductsIsStorage();
                List<String> categoryList = productService.getAllCategories();
                List<List<Packaging>> packagingList = new ArrayList<>();
                List<WareHouse> wareHouseList = new ArrayList<>();
                List<Customer> customerList = customerService.getCustomersByStoreId(storeId);
                System.out.println(customerList);
                for(Product product : productList){
                    packagingList.add(packagingService.getAllPackagingForQuantityProduct(product.getTotalQuantity()));
                    wareHouseList.add(wareHouseService.getWareHouseById(product.getWarehouse().getId()));
                }

                model.addAttribute("warehouse", wareHouseList);
                model.addAttribute("productList", productList);
                model.addAttribute("categoryList", categoryList);
                model.addAttribute("packagingList", packagingList);
                model.addAttribute("user", user);
                model.addAttribute("storeId", storeId);
                model.addAttribute("customerList", customerList);
            } else {
                return "redirect:/access-deny";
            }
        } else {
            return "redirect:/access-deny";
        }

        return "admin/sale/homesale";
    }

}

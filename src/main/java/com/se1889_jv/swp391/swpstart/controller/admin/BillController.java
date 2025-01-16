package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.*;
import com.se1889_jv.swp391.swpstart.service.implementservice.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.ArrayList;
import java.util.List;


@Controller
public class BillController {
    @Autowired
    private ProductService productService;
    @Autowired
    private PackagingService packagingService;

    @Autowired
    private StoreService storeService;

    @GetMapping("/homesale/{id}")
    public String homeSale(@PathVariable(name = "id") long storeId, HttpSession session, Model model) {


        User user = (User) session.getAttribute("user");

        if( user != null){
            Store store = storeService.findStoreById(storeId);
            if(store != null){
                List<Product> productList = productService.getAllProducts();
                List<String> categoryList = productService.getAllCategories();
                List<List<Packaging>> packagingList = new ArrayList<>();
                for(Product product : productList){
                    packagingList.add(packagingService.getAllPackagingForQuantityProduct(product.getTotalQuantity()));
                }
                model.addAttribute("productList", productList);
                model.addAttribute("categoryList", categoryList);
                model.addAttribute("packagingList", packagingList);
                model.addAttribute("user", user);
            } else {
                return "redirect:/access-deny";
            }
        } else {
            return "redirect:/access-deny";
        }

        return "admin/sale/homesale";
    }

}

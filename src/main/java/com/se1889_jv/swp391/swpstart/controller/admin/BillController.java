package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.*;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDTO;
import com.se1889_jv.swp391.swpstart.service.implementservice.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    BillDetailService billDetailService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private BillService billService;

    @Autowired
    private UserStoreService userStoreService;

    @PostMapping("/createbill")
    public String createBill(HttpSession session, Model model, BillDTO billDTO, RedirectAttributes redirectAttributes){
        User user = (User) session.getAttribute("user");
        if(billDTO.getBillDetails() == null ){
            redirectAttributes.addFlashAttribute("errorList", "oang");
            return "redirect:/homesale/1";
        }

        Bill bill = billService.createBill(billDTO);
        bill.setCreatedBy(user.getName());

        List<BillDetail> listBillDetail = new ArrayList<>();
        List<Long> listName = new ArrayList<>();
        for(BillDetail bd : billDTO.getBillDetails()){
            listName.add(bd.getProduct().getId());
            listBillDetail.add(billDetailService.createBillDetail(bd, bill, bd.getProduct().getId()));
        }

        model.addAttribute("name", listName);

        return "admin/sale/viewbill";
    }

    @PostMapping("/createBillDetail")
    public String createBillDetail(HttpSession session, Model model){
        return "";
    }

//    @GetMapping("/sale")
//    public String sale(HttpSession session, Model model){
//        return "admin/sale/sale";
//    }



    @GetMapping("/homesale/{id}")
    public String homeSale(@PathVariable(name = "id") long storeId,HttpServletRequest request, Model model) {

        HttpSession session = request.getSession(false);

        User user = (User) session.getAttribute("user");

        if( user != null){
            Store store = storeService.findStoreById(storeId);
            if(store != null){
                List<List<Packaging>> packagingList = new ArrayList<>();
                List<WareHouse> wareHouseList = new ArrayList<>();
                List<Customer> customerList = customerService.getCustomersByStoreId(storeId);

                model.addAttribute("warehouse", wareHouseList);

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


        Store store = this.storeService.findStoreById(storeId);

        UserStore userStore = this.userStoreService.findUserStoreByUserAndStore(user,store );

        if (userStore == null || userStore.getAccessStoreStatus().equals("ACCESSDENY")) {
            return "redirect:/access-deny";
        }
        session.setAttribute("store",store);
        return "admin/sale/homesale";
    }



    @GetMapping("/saleproduct/{id}")
    public String sale(@PathVariable(name = "id") long storeId,HttpServletRequest request, Model model){
        HttpSession session = request.getSession(false);

        User user = (User) session.getAttribute("user");

        if( user != null){
            Store store = storeService.findStoreById(storeId);
            if(store != null){
//                List<Product> productList = productService.getAllProductsByStoreIdAndIsStorage(storeId);
//                List<String> categoryList = productService.getAllCategories();
                List<List<Packaging>> packagingList = new ArrayList<>();
                List<WareHouse> wareHouseList = new ArrayList<>();
                List<Customer> customerList = customerService.getCustomersByStoreId(storeId);
//                for(Product product : productList){
//                    packagingList.add(packagingService.getAllPackagingForQuantityProduct(product.getTotalQuantity(), storeId));
//                    wareHouseList.add(wareHouseService.getWareHouseById(product.getWarehouse().getId()));
//                }
                model.addAttribute("warehouse", wareHouseList);
//                model.addAttribute("productList", productList);
//                model.addAttribute("categoryList", categoryList);
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


        Store store = this.storeService.findStoreById(storeId);

        UserStore userStore = this.userStoreService.findUserStoreByUserAndStore(user,store );

        if (userStore == null || userStore.getAccessStoreStatus().equals("ACCESSDENY")) {
            return "redirect:/access-deny";
        }
        session.setAttribute("store",store);
        return "admin/sale/saleproduct";
    }

}

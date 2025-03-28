package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.*;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDTO;
import com.se1889_jv.swp391.swpstart.service.implementservice.*;
import com.se1889_jv.swp391.swpstart.util.Utility;
import com.se1889_jv.swp391.swpstart.util.constant.BillTypeEnum;
import com.se1889_jv.swp391.swpstart.util.validator.annotation.CheckPermission;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


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

    @CheckPermission(condition = "statusService")
    @GetMapping("/bill/table")
    public String showListBill(
            @RequestParam(value = "startDate", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) String startDateStr,
            @RequestParam(value = "endDate", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) String endDateStr,
            @RequestParam(value = "minAmount", required = false) Double minAmount,
            @RequestParam(value = "maxAmount", required = false) Double maxAmount,
            @RequestParam(value = "status", required = false, defaultValue = "ALL") String status,
            @RequestParam(value = "type", required = false, defaultValue = "ALL") String type,
            @RequestParam(value = "input", required = false) String input,
            @RequestParam(value = "storeId", required = false, defaultValue = "0") String storeId,
            @RequestParam(value = "page", required = false, defaultValue = "0") int page,
            Model model
    ) {
        User user = Utility.getUserInSession();
        List<Store> stores = Utility.getListStoreOfOwner(user);
        Sort sort = Sort.by(Sort.Direction.DESC, "createdAt");
        Pageable pageable = PageRequest.of(page, 5, sort);
        Instant startDate = null;
        Instant endDate = null;
        Long storeID = ("0").equals(storeId) ? null : Long.parseLong(storeId);

//        DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME.withZone(ZoneId.systemDefault());
        BillTypeEnum billType = null;
        billType = "ALL".equals(type) ? null : BillTypeEnum.valueOf(type);
        if (startDateStr != null && !startDateStr.isEmpty()) {
            startDate = LocalDate.parse(startDateStr, DateTimeFormatter.ISO_DATE)
                    .atStartOfDay(ZoneId.systemDefault()).toInstant();
        }
        List<Store> storesList = Utility.getListStoreOfOwner(Utility.getUserInSession());
        List<Long> storeIds = storesList.stream()
                .map(Store::getId)
                .toList();
        if (endDateStr != null && !endDateStr.isEmpty()) {
            endDate = LocalDate.parse(endDateStr, DateTimeFormatter.ISO_DATE)
                    .atTime(23, 59, 59)
                    .atZone(ZoneId.systemDefault())
                    .toInstant();
        }

        if (input != null && !input.isEmpty()) {
            input = input.trim();
        }
        Page<Bill> list = billService.filterBills(startDate,endDate,minAmount,maxAmount,input,storeID,storeIds,billType,pageable);
        if (list.hasContent()) {
            model.addAttribute("bills", list);
        } else {
            model.addAttribute("emptyList", "Không có hóa đơn  nào được tìm thấy!");
        }
        model.addAttribute("startDate", startDateStr);
        model.addAttribute("endDate", endDateStr);
        model.addAttribute("minAmount", minAmount);
        model.addAttribute("maxAmount", maxAmount);
        model.addAttribute("stores", stores);
        model.addAttribute("status", status);
        model.addAttribute("input", input);
        model.addAttribute("type", type);
        model.addAttribute("storeId", storeID);
        return "admin/bill/listbill";
    }

    @CheckPermission(condition = "statusService")
    @GetMapping("/bills/details/{id}")
     public String getBillDetail(
             @PathVariable(name = "id") Long billId,
             Model model){
        Bill bill = billService.findBillById(billId); //
        List<BillDetail> billDetails = bill.getBillDetails();
        model.addAttribute("billDetails", billDetails);
        model.addAttribute("bill", bill);
        return "admin/bill/detail";

    }



//    @GetMapping("/bill/details")
//    public ResponseEntity<List<BillDetail>> getBillDetails(@RequestParam("billId") Long billId) {
//
//        List<BillDetail> billDetails = billService.findBillById(billId).getBillDetails();
//        return ResponseEntity.ok(billDetails);
//    }

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


    @GetMapping("/saleproduct")
    public String sale(HttpServletRequest request, Model model){
        HttpSession session = request.getSession(false);

        User user = (User) session.getAttribute("user");
        Store storeInSession = Utility.getStoreInSession();
        if( user != null){
            Store store = this.storeService.findStoreById(storeInSession.getId());
            if(store != null){
                List<List<Packaging>> packagingList = new ArrayList<>();
                List<WareHouse> wareHouseList = new ArrayList<>();
//                List<Customer> customerList = customerService.getCustomersByStoreId(storeId);
                model.addAttribute("warehouse", wareHouseList);
                model.addAttribute("packagingList", packagingList);
                model.addAttribute("user", user);
                model.addAttribute("storeId", store.getId());
//                model.addAttribute("customerList", customerList);

            } else {
                return "redirect:/access-deny";
            }
        } else {
            return "redirect:/access-deny";
        }


        Store store = this.storeService.findStoreById(storeInSession.getId());

        UserStore userStore = this.userStoreService.findUserStoreByUserAndStore(user,store );

        if (userStore == null || userStore.getAccessStoreStatus().equals("ACCESSDENY")) {
            return "redirect:/access-deny";
        }
        session.setAttribute("store",store);
        return "admin/sale/saleproduct";
    }
    @GetMapping("/importproduct")
    public String importProduct(HttpServletRequest request, Model model){
        HttpSession session = request.getSession(false);

        User user = (User) session.getAttribute("user");
        Store storeInSession = Utility.getStoreInSession();
        if( user != null){
            Store store = this.storeService.findStoreById(storeInSession.getId());
            if(store != null){
                List<List<Packaging>> packagingList = new ArrayList<>();
                List<WareHouse> wareHouseList = new ArrayList<>();
//                List<Customer> customerList = customerService.getCustomersByStoreId(storeId);
                model.addAttribute("warehouse", wareHouseList);
                model.addAttribute("packagingList", packagingList);
                model.addAttribute("user", user);
                model.addAttribute("storeId", store.getId());
//                model.addAttribute("customerList", customerList);

            } else {
                return "redirect:/access-deny";
            }
        } else {
            return "redirect:/access-deny";
        }


        Store store = this.storeService.findStoreById(storeInSession.getId());

        UserStore userStore = this.userStoreService.findUserStoreByUserAndStore(user,store );

        if (userStore == null || userStore.getAccessStoreStatus().equals("ACCESSDENY")) {
            return "redirect:/access-deny";
        }
        session.setAttribute("store",store);
        return "admin/sale/importproduct";
    }

}

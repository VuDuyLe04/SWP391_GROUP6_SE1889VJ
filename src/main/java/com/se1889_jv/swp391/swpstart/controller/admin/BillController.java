package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.*;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDTO;
import com.se1889_jv.swp391.swpstart.service.implementservice.*;
import com.se1889_jv.swp391.swpstart.util.Utility;
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


    @GetMapping("/bill/table")
    public String showListBill(
            @RequestParam(value = "startDate", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) String startDateStr,
            @RequestParam(value = "endDate", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)  String endDateStr,
            @RequestParam(value = "minAmount", required = false) Double minAmount,
            @RequestParam(value = "maxAmount", required = false) Double maxAmount,
            @RequestParam(value = "status", required = false, defaultValue = "ALL") String status,
            @RequestParam(value = "input", required = false) String input,
            @RequestParam(value = "storeId", required = false,defaultValue = "0") String storeId,
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

        DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME.withZone(ZoneId.systemDefault());

        if (startDateStr != null && !startDateStr.isEmpty()) {
            startDate = Instant.from(formatter.parse(startDateStr));
        }

        if (endDateStr != null && !endDateStr.isEmpty()) {
            endDate = Instant.from(formatter.parse(endDateStr));
        }
        if(input != null && !input.isEmpty()) {
            input = input.trim();
        }
        Page<Bill> list = billService.filterBills(startDate,endDate,minAmount,maxAmount,input,storeID,pageable);
        if (list.hasContent()) {
            model.addAttribute("bills", list);

        } else {
            model.addAttribute("emptyList", "Không có hóa đơn  nào được tìm thấy!");
        }
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("minAmount", minAmount);
        model.addAttribute("maxAmount", maxAmount);
        model.addAttribute("stores", Utility.getListStoreOfOwner(user));
        model.addAttribute("status", status);
        model.addAttribute("input", input);
        model.addAttribute("storeId", storeID);
        return "admin/bill/listbill";
    }

    @GetMapping("/bills/details/{id}")
    @ResponseBody
    public ResponseEntity<?> getBillDetails(@PathVariable Long id) {
        Bill bill = billService.findBillById(id); // Trả về Bill, không cần Optional

        if (bill == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Bill not found");
        }

        List<BillDetail> billDetails = bill.getBillDetails();

        if (billDetails == null || billDetails.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No bill details found");
        }

        return ResponseEntity.ok(bill); // Trả về trực tiếp Bill
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



    @GetMapping("/saleproduct/{id}")
    public String sale(@PathVariable(name = "id") long storeId,HttpServletRequest request, Model model){
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
        return "admin/sale/saleproduct";
    }
    @GetMapping("/importproduct/{id}")
    public String importProduct(@PathVariable(name = "id") long storeId,HttpServletRequest request, Model model){
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
        return "admin/sale/importproduct";
    }

}

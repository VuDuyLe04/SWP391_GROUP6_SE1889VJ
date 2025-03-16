package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.DebtReceipt;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.repository.CustomerRepository;
import com.se1889_jv.swp391.swpstart.service.implementservice.CustomerService;
import com.se1889_jv.swp391.swpstart.service.implementservice.DebtReceiptService;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CustomerController {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private StoreService storeService;
    @Autowired
    private DebtReceiptService debtReceiptService;
    @GetMapping("/customer/create")
    public String getCreateCustomerPage(Model model) {
        model.addAttribute("customer", new Customer());
        Store store = Utility.getStoreInSession();
        User user = Utility.getUserInSession();
        if (user.getRole().getName().equals("STAFF")) {
            if (store == null) {
                return "redirect:/dashboard";
            }
        }
        if (user.getRole().getName().equals("OWNER")) {
            model.addAttribute("listStore", Utility.getListStoreOfOwner(user));
        }

        return "admin/customer/create";
    }

    @PostMapping("/customer/create")
    public String createCustomer(Model model,
                                 @ModelAttribute("customer") @Valid Customer customer,
                                 BindingResult result, @RequestParam( value = "storeId", required = false) String storeId
    ) {
        User user = Utility.getUserInSession();
        if (result.hasErrors()) {
            model.addAttribute("listStore", Utility.getListStoreOfOwner(user));
            return "admin/customer/create";
        }

        if (user.getRole().getName().equals("STAFF")) {
            Store store = Utility.getStoreInSession();
            if (this.customerService.checkCustomerExistsInStoreByPhone(customer.getPhone(), store) == false){
                this.customerService.createCustomer(customer, store);
            } else {
                result.rejectValue("phone", "error.customer", "Số điện thoại đã tồn tại trong khách hàng khác");
                model.addAttribute("listStore", Utility.getListStoreOfOwner(user));
                return "admin/customer/create";
            }
        } else {
            Store store = this.storeService.findStoreById(Long.parseLong(storeId));
            if (this.customerService.checkCustomerExistsInStoreByPhone(customer.getPhone(), store) == false){
                this.customerService.createCustomer(customer, store);
            } else {
                result.rejectValue("phone", "error.customer", "Số điện thoại đã tồn tại trong khách hàng khác");
                model.addAttribute("listStore", Utility.getListStoreOfOwner(user));
                return "admin/customer/create";
            }
        }

        return "redirect:/customer";
    }
    @GetMapping("/customer/detail/{id}")
    public String getCustomerDetail(@PathVariable("id") long id, Model model) {
        // Check session
        if (Utility.getUserInSession() == null) {
            return "redirect:/login";
        }

        // Get customer by ID
        Customer customer = customerService.getCustomerById(id);
        if (customer == null) {
            return "redirect:/customer";
        }

        // Add customer to model
        model.addAttribute("customer", customer);
        return "admin/customer/customerdetail";
    }

    @GetMapping("/customer/update/{id}")
    public String showUpdateForm(@PathVariable("id") long id, Model model) {
        Store store = Utility.getStoreInSession();
        User user = Utility.getUserInSession();
        if (user.getRole().getName().equals("STAFF")) {
            if (store == null) {
                return "redirect:/dashboard";
            }
        }
        Customer customer = customerService.getCustomerById(id);
        model.addAttribute("customer", customer);

        return "admin/customer/update";
    }

    @PostMapping("/customer/update")
    public String updateCustomer(
            @Valid @ModelAttribute("customer") Customer customer,
            @RequestParam(value = "oldPhone") String oldPhone,
            BindingResult result) {
        if (this.customerRepository.existsByPhoneAndStoreExcludingOldPhone(customer.getPhone(),oldPhone,customer.getStore())== true){
            result.rejectValue("phone", "error.customer", "Số điện thoại đã tồn tại trong khách hàng khác");
            customer.setPhone(oldPhone);
        }


        if (result.hasErrors()) {
            return "admin/customer/update";
        }

        this.customerService.updateCustomer(customer);
        return "redirect:/customer";
    }
    @GetMapping("/customer/search")
    public String searchCustomer(@RequestParam(defaultValue = "0") int page,@RequestParam(required = false) String name,
                                 @RequestParam(required = false) String phone,
                                 Model model) {
//        List<Customer> customers;
        Store store = Utility.getStoreInSession();
        User user = Utility.getUserInSession();
        if (user == null) {
            return "redirect:/login";
        }
        if (user.getRole().getName().equals("STAFF")) {
            if (store == null) {
                return "redirect:/dashboard";
            }
        }
        Pageable pageable = PageRequest.of(page, 5); // 5 sản phẩm mỗi trang
        if (user.getRole().getName().equals("OWNER")){
            Page<Customer> customers;
            if (name != null && !name.isEmpty()) {
                customers = customerService.searchCustomersByNameRoleOwner(name,Utility.getListStoreOfOwner(user),pageable );
            } else if (phone != null && !phone.isEmpty()) {
                customers = customerService.searchCustomersByPhoneRoleOwner(phone,Utility.getListStoreOfOwner(user),pageable );
            } else {
                customers = this.customerService.getAllCustomersRoleOwner(Utility.getListStoreOfOwner(user), pageable);
            }
            model.addAttribute("listCustomer", customers.getContent());
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", customers.getTotalPages());
        } else {
            Page<Customer> customers;
            if (name != null && !name.isEmpty()) {
                customers = customerService.searchCustomersByNameRoleStaff(name,store,pageable );
            } else if (phone != null && !phone.isEmpty()) {
                customers = customerService.searchCustomersByPhoneRoleStaff(phone,store,pageable );
            } else {
                customers = this.customerService.getAllCustomersRoleStafff(store, pageable);
            }
            model.addAttribute("listCustomer", customers.getContent());
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", customers.getTotalPages());
        }



        return "admin/customer/table";
    }

    @GetMapping("/customer")
    public String getListCustomerPage(@RequestParam(defaultValue = "0") int page, Model model) {
        Store store = Utility.getStoreInSession();
        User user = Utility.getUserInSession();
        if (user == null) {
            return "redirect:/login";
        }
        if (user.getRole().getName().equals("STAFF")) {
            if (store == null) {
                return "redirect:/dashboard";
            }
        }
//        if (user.getRole().getName().equals("OWNER")){
//            if (user.getUserStores().isEmpty()) {
//                return "redirect:/dashboard";
//            }
//        }
        Pageable pageable = PageRequest.of(page, 5); // 5 sản phẩm mỗi trang
        if (user.getRole().getName().equals("OWNER")) {
            Page<Customer> customerPage = this.customerService.getAllCustomersRoleOwner(Utility.getListStoreOfOwner(user), pageable);
            System.out.println(Utility.getListStoreOfOwner(user));
            model.addAttribute("listCustomer", customerPage.getContent());
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", customerPage.getTotalPages());
        } else {
            Page<Customer> customerPage = this.customerService.getAllCustomersRoleStafff(store, pageable);
            System.out.println(store);
            model.addAttribute("listCustomer", customerPage.getContent());
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", customerPage.getTotalPages());
        }

        return "admin/customer/table";
    }


}

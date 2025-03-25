package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.dto.CustomerCriteriaDTO;
import com.se1889_jv.swp391.swpstart.repository.CustomerRepository;
import com.se1889_jv.swp391.swpstart.service.implementservice.CustomerService;
import com.se1889_jv.swp391.swpstart.service.implementservice.StoreService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import com.se1889_jv.swp391.swpstart.util.validator.annotation.CheckPermission;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class CustomerController {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private StoreService storeService;
    @Autowired
    private UserService userService;

    @CheckPermission(condition = "statusService")
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
        return "admin/customer/create";
    }

    @CheckPermission(condition = "statusService")
    @PostMapping("/customer/create")
    public String createCustomer(Model model,
                                 @ModelAttribute("customer") @Valid Customer customer,
                                 BindingResult result
    ) {

        User userInSession = Utility.getUserInSession();
        User user = this.userService.findById(userInSession.getId());
        if (result.hasErrors()) {
            model.addAttribute("listStore", Utility.getListStoreOfOwner(user));
            return "admin/customer/create";
        }

        if (user.getRole().getName().equals("STAFF")) {

            customer.setCreatedBy(user.getCreatedBy());

            if (this.customerService.checkCustomerExistsOfOwnerByPhone(customer.getPhone(), user.getCreatedBy()) == false){
                this.customerService.createCustomer(customer);
            } else {
                result.rejectValue("phone", "error.customer", "Số điện thoại đã tồn tại trong khách hàng khác");
                return "admin/customer/create";
            }
        } else {
            customer.setCreatedBy(String.valueOf(user.getId()));

            if (this.customerService.checkCustomerExistsOfOwnerByPhone(customer.getPhone(), String.valueOf(user.getId())) == false){
                this.customerService.createCustomer(customer);
            } else {
                result.rejectValue("phone", "error.customer", "Số điện thoại đã tồn tại trong khách hàng khác");
                return "admin/customer/create";
            }
        }

        return "redirect:/customer/table";
    }

    @CheckPermission(condition = "statusService")
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

    @CheckPermission(condition = "statusService")
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

    @CheckPermission(condition = "statusService")
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

    @CheckPermission(condition = "statusService")
    @GetMapping("/customer/table")
    public String getListCustomerPage(Model model, CustomerCriteriaDTO customerCriteriaDTO) {
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
        int page = 0;
        try {
            if (customerCriteriaDTO.getPage() == null) {
                page = 0;
            } else {
                if (customerCriteriaDTO.getPage().isPresent()){
                    page = Integer.parseInt(customerCriteriaDTO.getPage().get());
                } else {
                    page = 0;
                }
            }


        } catch (NumberFormatException e) {

        }

        Pageable pageable = PageRequest.of(page, 5); // 5 sản phẩm mỗi trang
        Page<Customer> customerPage;
        if (user.getRole().getName().equals("OWNER")) {
            customerPage = this.customerService.getAllCustomerOfOwner(String.valueOf(user.getId()), pageable, customerCriteriaDTO);
        } else {
            customerPage = this.customerService.getAllCustomerOfOwner(user.getCreatedBy(), pageable, customerCriteriaDTO);
        }

        model.addAttribute("listCustomer", customerPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", customerPage.getTotalPages());

        return "admin/customer/table";
    }


}

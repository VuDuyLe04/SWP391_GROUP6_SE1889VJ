package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.service.implementservice.CustomerService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    @GetMapping("/customer/create")
    public String getCreateCustomerPage(Model model) {
        model.addAttribute("customer", new Customer());
        return "admin/customer/create";
    }

    @PostMapping("/customer/create")
    public String createCustomer(
            @ModelAttribute("customer") @Valid Customer customer,
            BindingResult result,
            HttpServletRequest request
    ) {
        if (result.hasErrors()) {
            return "admin/customer/create";
        }
        HttpSession session = request.getSession(false);
        Store store = (Store) session.getAttribute("store");

        this.customerService.createCustomer(customer, store);
        return "redirect:/customers";
    }

    @GetMapping("/customer")
    public String getCustomerTable(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Store store = (Store) session.getAttribute("store");
        model.addAttribute("listCustomer", this.customerService.getAllCustomers(store));
        return "admin/customer/table";
    }


    @GetMapping("/customer/update/{id}")
    public String showUpdateForm(@PathVariable("id") long id, Model model) {
        Customer customer = customerService.getCustomerById(id);
        model.addAttribute("customer", customer);
        return "admin/customer/update";
    }

    @PostMapping("/customer/update")
    public String updateCustomer(
            @ModelAttribute("customer") @Valid Customer customer,
            BindingResult result
                                 ) {
        if (result.hasErrors()) {
            return "admin/customer/update";
        }

        this.customerService.updateCustomer(customer);
        return "redirect:/customers";
    }
    @GetMapping("/customer/search")
    public String searchCustomer(@RequestParam(required = false) String name,
                                 @RequestParam(required = false) String phone,
                                 Model model) {
        List<Customer> customers;

        if (name != null && !name.isEmpty()) {
            customers = customerService.searchCustomersByName(name);
        } else if (phone != null && !phone.isEmpty()) {
            customers = customerService.searchCustomersByPhone(phone);
        } else {
            customers = customerService.getAllCustomers();
        }

        model.addAttribute("listCustomer", customers);
        return "admin/customer/table";
    }

    @GetMapping("/customers")
    public String getListCustomerPage(@RequestParam(defaultValue = "0") int page, Model model) {
        Pageable pageable = PageRequest.of(page, 5); // 5 sản phẩm mỗi trang
        Page<Customer> customerPage = customerService.getAllCustomers(pageable);
        model.addAttribute("listCustomer", customerPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", customerPage.getTotalPages());
        return "admin/customer/table";
    }

}

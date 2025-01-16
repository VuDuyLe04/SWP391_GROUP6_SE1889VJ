package com.se1889_jv.swp391.swpstart.controller.admin;


import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.service.implementservice.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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
            @ModelAttribute("customer") Customer customer
    ) {
        this.customerService.createCustomer(customer);

        return "redirect:/customer/create";
    }

    @GetMapping("/customer")
    public String getCustomerTable(Model model){
        System.out.println(this.customerService.getAllCustomers().toString());
        model.addAttribute("listCustomer", this.customerService.getAllCustomers());
        return "admin/customer/table";
    }
}

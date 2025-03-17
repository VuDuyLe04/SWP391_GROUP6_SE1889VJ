package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.Service;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.service.implementservice.ServiceService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ServiceController {
    @Autowired
    private ServiceService serviceService;

    @GetMapping("/service/create")
    public String createServicePage(Model model) {
        Service service = new Service();
        service.setDurationMonths(1);
        model.addAttribute("service", service);

        return "admin/service/create";
    }

    @PostMapping("/service/create")
    public String createService(
            Model model,
            @Valid @ModelAttribute("service") Service serviceCreate,
            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "admin/service/create";
        }
        this.serviceService.createService(serviceCreate);
        model.addAttribute("message", "Thêm dịch vụ mới thành công");
        Service service = new Service();
        service.setDurationMonths(1);
        model.addAttribute("service", service);
        return "admin/service/create";
    }


    @GetMapping("/service/table")
    public String serviceTable(
            Model model,
            @RequestParam(defaultValue = "0") int page) {
        Pageable pageable = PageRequest.of(page, 5);
        Page<Service> servicePage = this.serviceService.findAllServices(pageable);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", servicePage.getTotalPages());
        model.addAttribute("listService", servicePage.getContent());
        return "admin/service/table";
    }
}

package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.Service;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.dto.ServiceCriteriaDTO;
import com.se1889_jv.swp391.swpstart.service.implementservice.ServiceService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import com.se1889_jv.swp391.swpstart.util.validator.annotation.CheckPermission;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
public class ServiceController {
    @Autowired
    private ServiceService serviceService;


    @GetMapping("/service/create")
    public String createServicePage(Model model) {
        Service service = new Service();
        service.setDurationMonths(1);
        service.setActive(true);
        model.addAttribute("service", service);

        return "admin/service/create";
    }

    @PostMapping("/service/create")
    public String createService(
            Model model,
            @Valid @ModelAttribute("service") Service serviceCreate,
            BindingResult bindingResult) {
        if (this.serviceService.existByName(serviceCreate.getName())) {
            bindingResult.rejectValue("name","service.name.exists", "Tên dịch vụ đã tồn tại");
        }

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
            Model model, ServiceCriteriaDTO serviceCriteriaDTO) {
        int page = 0;
        try {
            if (serviceCriteriaDTO.getPage() == null) {
                page = 0;
            } else {
                if (serviceCriteriaDTO.getPage().isPresent()){
                    page = Integer.parseInt(serviceCriteriaDTO.getPage().get());
                } else {
                    page = 0;
                }
            }


        } catch (NumberFormatException e) {

        }

        Pageable pageable = PageRequest.of(page, 5);

        Page<Service> servicePage = this.serviceService.findAllServices(pageable, serviceCriteriaDTO);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", servicePage.getTotalPages());
        model.addAttribute("listService", servicePage.getContent());
        return "admin/service/table";
    }

    @GetMapping("/service/update/{id}")
    public String getUpdateServicePage(Model model, @PathVariable("id") long id) {

       Service service = this.serviceService.findServiceById(id);
        model.addAttribute("service", service);
        model.addAttribute("oldName", service.getName() );
        return "admin/service/update";
    }

    @PostMapping("/service/update")
    public String handleUpdateService(
            @Valid @ModelAttribute("service") Service service,
                                      BindingResult bindingResult,
            HttpSession session,
            @RequestParam(value = "oldName") String oldName,
            Model model) {
        if (this.serviceService.existsByNameExcludingOldName(service.getName(), oldName) == true) {
            bindingResult.rejectValue("name","service.name.exists", "Tên dịch vụ đã tồn tại");
            model.addAttribute("oldName", oldName );
        }
        if (bindingResult.hasErrors()) {
            model.addAttribute("oldName", oldName );
            return "admin/service/update";
        }
        this.serviceService.updateService(service);
        session.setAttribute("message", "Cập nhập thành công");
        return "redirect:/service/table";
    }

    @GetMapping("/service/signup")
    public String signupServicePage(Model model) {
        model.addAttribute("services", this.serviceService.findAllServicesForHomePage());
        return "admin/service/serviceOwner";
    }

}

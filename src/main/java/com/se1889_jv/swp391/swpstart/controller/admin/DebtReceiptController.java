package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.dto.request.DebtReceiptCreationRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.response.DebtReceiptCreationResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.response.DebtReceiptDetailResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.response.PageResponse;
import com.se1889_jv.swp391.swpstart.repository.CustomerRepository;
import com.se1889_jv.swp391.swpstart.service.implementservice.DebtReceiptService;
import com.se1889_jv.swp391.swpstart.util.validator.annotation.CheckPermission;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

@Controller
@RequiredArgsConstructor
@Slf4j
public class DebtReceiptController {

    private final DebtReceiptService debtReceiptService;
    private final CustomerRepository customerRepository;

    @CheckPermission(condition = "statusService")
    @GetMapping("/customer/debt-receipt/create/{customerId}")
    public String showCreateDebtReceiptForm(@PathVariable("customerId") long customerId, Model model) {
        var customer = customerRepository.findById(customerId)
                .orElseThrow(() -> new RuntimeException("Customer not found"));
        model.addAttribute("customer", customer);
        model.addAttribute("debtReceiptCreationRequest", new DebtReceiptCreationRequest());
        return "admin/customer/debtreceiptform";
    }

    @CheckPermission(condition = "statusService")
    @PostMapping("/debt-receipt/creation")
    public String createDebtReceipt(@ModelAttribute DebtReceiptCreationRequest request, Model model) {
        log.info("Received data: debtType = {}, debtReason = {}, debtAmount = {}, customerId = {}",
                request.getDebtType(), request.getDebtReason(), request.getDebtAmount(), request.getCustomerId());

        DebtReceiptCreationResponse result = debtReceiptService.createDebtReceipt(request);
        model.addAttribute("debtReceipt", result);
        return "redirect:/debt-receipt/search/" + request.getCustomerId();
    }

    @CheckPermission(condition = "statusService")
    @GetMapping("/customer/debt-history/{id}")
    public String getCustomerDebts(@PathVariable("id") long customerId,
                                   @RequestParam(required = false, defaultValue = "1") int page,
                                   Model model) {
        var customer = customerRepository.findById(customerId)
                .orElseThrow(() -> new RuntimeException("Customer not found"));

        var result = debtReceiptService.getDebtsByCustomer(customerId, page);
        model.addAttribute("deptList", result.getData());
        model.addAttribute("customer", customer);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalAmount", customer.getBalance());
        model.addAttribute("totalPages", result.getTotalPages());

        return "admin/customer/debtlist";
    }

    @CheckPermission(condition = "statusService")
    @GetMapping("/debt-receipt/search/{id}")
    public String getAllWithSearch(
            @PathVariable Long id,
            @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false) String from,
            @RequestParam(required = false) String to,
            @RequestParam(required = false) Double debtAmount,
            Model model
    ) {
        var customer = customerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Customer not found"));

        Instant fromInstant = null;
        Instant toInstant = null;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd").withZone(ZoneId.of("UTC"));

        try {
            if (from != null && !from.isEmpty()) {
                LocalDate fromDate = LocalDate.parse(from, formatter);
                fromInstant = fromDate.atStartOfDay(ZoneId.of("UTC")).toInstant();
            }
            if (to != null && !to.isEmpty()) {
                LocalDate toDate = LocalDate.parse(to, formatter);
                toInstant = toDate.atTime(23, 59, 59).atZone(ZoneId.of("UTC")).toInstant();
            }
        } catch (DateTimeParseException e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid date format. Use dd-MM-yyyy (e.g., 07-03-2025)");
        }
        var result = debtReceiptService.getAllWithSearch(id, page, fromInstant, toInstant, debtAmount);

        model.addAttribute("deptList", result.getData());
        model.addAttribute("customer", customer);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalAmount", customer.getBalance());
        model.addAttribute("totalPages", result.getTotalPages());

        return "admin/customer/debtlist";
    }


}

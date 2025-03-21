package com.se1889_jv.swp391.swpstart.controller.admin;

import com.se1889_jv.swp391.swpstart.domain.dto.PeriodTypeRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.RevenueSummaryResponse;
import com.se1889_jv.swp391.swpstart.service.implementservice.RevenueService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/api/v1")
public class RevenueController {

    private final RevenueService revenueService;

    @PostMapping("/revenue")
    public RevenueSummaryResponse revenue(@RequestBody PeriodTypeRequest request) {
        return revenueService.revenue(request);
    }

}

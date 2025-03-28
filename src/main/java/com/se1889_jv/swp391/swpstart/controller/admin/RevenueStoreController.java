package com.se1889_jv.swp391.swpstart.controller.admin;



import com.se1889_jv.swp391.swpstart.domain.dto.request.PeriodTypeRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.response.RevenueSummaryResponse;
import com.se1889_jv.swp391.swpstart.repository.StoreRepository;
import com.se1889_jv.swp391.swpstart.service.implementservice.RevenueStoreService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/api/v1")
public class RevenueStoreController {

    private final RevenueStoreService revenueStoreService;
    private final StoreRepository storeRepository;

    @PostMapping("/revenue-store/{storeId}")
    public RevenueSummaryResponse revenue(@PathVariable Long storeId, @RequestBody PeriodTypeRequest request) {
        var store = storeRepository.findById(storeId)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy cửa hàng"));
        log.info("RevenueStoreController revenue-store {}", request);
        return revenueStoreService.revenue(store, request);
    }

}
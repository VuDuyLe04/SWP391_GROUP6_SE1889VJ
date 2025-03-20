package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Bill;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.common.PeriodType;

import com.se1889_jv.swp391.swpstart.domain.dto.request.PeriodTypeRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.response.RevenueDetailResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.response.RevenueSummaryResponse;
import com.se1889_jv.swp391.swpstart.repository.BillRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class RevenueStoreService {

    BillRepository billRepository;

    public RevenueSummaryResponse revenue(Store store, PeriodTypeRequest request) {
        List<RevenueDetailResponse> revenueDetails = new ArrayList<>();
        BigDecimal totalRevenue = BigDecimal.ZERO;

        if (request.getPeriodType().equals(PeriodType.YEAR) && request.getYear() != null && request.getMonth() == null) {
            int year = request.getYear();
            for (int month = 1; month <= 12; month++) {
                LocalDateTime start = LocalDateTime.of(year, month, 1, 0, 0);
                LocalDateTime end = start.plusMonths(1).minusDays(1);

                // Truy vấn các hóa đơn của store trong khoảng thời gian của mỗi tháng
                List<Bill> bills = billRepository.findByStoreAndCreatedAt(store, start, end);

                BigDecimal monthRevenue = bills.stream()
                        .map(bill -> BigDecimal.valueOf(bill.getTotalBillPrice()))
                        .reduce(BigDecimal.ZERO, BigDecimal::add);
                log.info("monthRevenue: {}", monthRevenue);
                totalRevenue = totalRevenue.add(monthRevenue);

                RevenueDetailResponse detailMonth = RevenueDetailResponse.builder()
                        .month(month)
                        .year(year)
                        .revenue(monthRevenue)
                        .build();
                revenueDetails.add(detailMonth);
            }
        } else if (request.getPeriodType().equals(PeriodType.MONTH) && request.getYear() != null && request.getMonth() != null) {
            int year = request.getYear();
            int month = request.getMonth();

            LocalDateTime start = LocalDateTime.of(year, month, 1, 0, 0);
            LocalDateTime endOfMonth = start.withDayOfMonth(start.toLocalDate().lengthOfMonth())
                    .toLocalDate().atTime(23, 59, 59);

            // Truy vấn các hóa đơn của store trong tháng
            List<Bill> bills = billRepository.findByStoreAndCreatedAt(store, start, endOfMonth);

            BigDecimal monthRevenue = bills.stream()
                    .map(bill -> BigDecimal.valueOf(bill.getTotalBillPrice()))
                    .reduce(BigDecimal.ZERO, BigDecimal::add);
            totalRevenue = totalRevenue.add(monthRevenue);

            RevenueDetailResponse detailMonth = RevenueDetailResponse.builder()
                    .month(month)
                    .year(year)
                    .revenue(monthRevenue)
                    .build();
            revenueDetails.add(detailMonth);
        } else if (request.getPeriodType().equals(PeriodType.WEEK) && request.getYear() != null && request.getMonth() != null) {
            int year = request.getYear();
            int month = request.getMonth();

            LocalDateTime start = LocalDateTime.of(year, month, 1, 0, 0);
            LocalDateTime endOfMonth = start.withDayOfMonth(start.toLocalDate().lengthOfMonth())
                    .toLocalDate().atTime(23, 59, 59);

            int totalWeek = (int) Math.ceil((double) endOfMonth.getDayOfMonth() / 7);
            for (int week = 1; week <= totalWeek; week++) {
                LocalDateTime end = start.plusWeeks(1).minusSeconds(1);
                if (end.isAfter(endOfMonth)) {
                    end = endOfMonth;
                }

                // Truy vấn các hóa đơn của store trong từng tuần
                List<Bill> bills = billRepository.findByStoreAndCreatedAt(store, start, end);

                BigDecimal weekRevenue = bills.stream()
                        .map(bill -> BigDecimal.valueOf(bill.getTotalBillPrice()))
                        .reduce(BigDecimal.ZERO, BigDecimal::add);
                totalRevenue = totalRevenue.add(weekRevenue);

                RevenueDetailResponse detailWeek = RevenueDetailResponse.builder()
                        .week(week)
                        .month(month)
                        .year(year)
                        .revenue(weekRevenue)
                        .build();
                revenueDetails.add(detailWeek);
                start = end.plusSeconds(1);
            }
        }

        return RevenueSummaryResponse.builder()
                .totalRevenue(totalRevenue)
                .revenueDetails(revenueDetails)
                .build();
    }

}

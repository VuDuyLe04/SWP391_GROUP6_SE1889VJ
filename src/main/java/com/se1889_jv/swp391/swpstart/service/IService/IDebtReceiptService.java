package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.DebtReceipt;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.dto.BillDetailImportRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.BillRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.ImportRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.request.DebtReceiptCreationRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.response.DebtReceiptCreationResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.response.DebtReceiptDetailResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.response.PageResponse;

import java.time.Instant;

public interface IDebtReceiptService {
    PageResponse<DebtReceipt> getDebtsByCustomer(long id, int page);
    DebtReceiptCreationResponse createDebtReceipt(DebtReceiptCreationRequest request);
    PageResponse<DebtReceiptDetailResponse> getAllWithSearch(Long customerId, int page, Instant from, Instant to, Double debtAmount);
    DebtReceipt createDebtReceiption(BillRequest request, User user);
    DebtReceipt createDebtForImport(ImportRequest request, User user);
}

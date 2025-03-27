package com.se1889_jv.swp391.swpstart.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImportRequest {
    private String description;
    private String customerInfor;
    private String type;
    private boolean createDebt;
    private Double totalNeedPay;
    private Double actualPay;
    private List<BillDetailImportRequest> billDetailsList;
    private boolean liftInput;
}

package com.se1889_jv.swp391.swpstart.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BillDetailImportRequest {
    private Long productId;
    private double quantity;
    private double importPrice;
    private Long billId;
    private String productName;
}

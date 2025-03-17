package com.se1889_jv.swp391.swpstart.domain.dto;

import lombok.Data;

@Data
public class BillRequest {
    private String description;
    private String customerInfor;
    private String type;
    private boolean isCreateDebt;
}

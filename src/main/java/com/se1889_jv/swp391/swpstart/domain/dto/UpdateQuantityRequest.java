package com.se1889_jv.swp391.swpstart.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateQuantityRequest {
    private Long billId;
    private Double quantity;
}

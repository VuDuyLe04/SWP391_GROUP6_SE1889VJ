package com.se1889_jv.swp391.swpstart.domain.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductUpdateRequest {
    private Long id;
    private String name;
    private String image;
    private Double unitPrice;
    private double totalQuantity;
    private Boolean storage;
    private String category;
    private String description;
    private Long storeId;
    private Long warehouseId;
}

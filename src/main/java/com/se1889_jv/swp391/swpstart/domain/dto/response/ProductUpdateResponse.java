package com.se1889_jv.swp391.swpstart.domain.dto.response;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductUpdateResponse {
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

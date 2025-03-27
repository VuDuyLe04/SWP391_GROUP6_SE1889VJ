package com.se1889_jv.swp391.swpstart.domain.dto.request;

import lombok.Getter;

@Getter
public class ProductCreationRequest {
    private String name;
    private String category;
    private String description;
    private double unitPrice;
    private double totalQuantity;
    private boolean storage;
    private long storeId;
    private long wareHouseId;
}

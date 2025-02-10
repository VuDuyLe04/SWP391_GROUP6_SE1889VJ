package com.se1889_jv.swp391.swpstart.domain.dto;

import com.se1889_jv.swp391.swpstart.domain.Packaging;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PackagingDTO {
    private String packageType;
    private double quantityPerPackage;
    private double liftCost;
    private long storeId;
}
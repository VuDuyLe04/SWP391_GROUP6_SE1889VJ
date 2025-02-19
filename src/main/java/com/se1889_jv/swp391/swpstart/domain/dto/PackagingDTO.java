package com.se1889_jv.swp391.swpstart.domain.dto;

import com.se1889_jv.swp391.swpstart.domain.Packaging;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PackagingDTO {
    @NotBlank
    private String packageTypeDTO;
    @NotNull
    private double quantityPerPackageDTO;
    @NotNull
    private double liftCostDTO;
    private long storeIdDTO;
}
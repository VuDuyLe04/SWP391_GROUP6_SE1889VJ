package com.se1889_jv.swp391.swpstart.domain.dto;

import com.se1889_jv.swp391.swpstart.domain.Packaging;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PackagingDTO {
    @NotBlank(message = "Không được để trống")
    private String packageTypeDTO;
    @NotNull(message = "Không được trống")
    @Min(value = 0, message = "Không được nhỏ hơn 0")
    private Double quantityPerPackageDTO;
    @NotNull(message = "Không được trống")
    @Min(value = 0, message = "Không được nhỏ hơn 0")
    private double liftCostDTO;
    private long storeIdDTO;
}
package com.se1889_jv.swp391.swpstart.domain.dto.request;

import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ProductCreationRequest {
    @NotBlank(message = "Tên sản phẩm không được để trống")
    @Size(max = 50, message = "Tên sản phẩm không được vượt quá 50 ký tự")
    private String name;

    @NotBlank(message = "Loại sản phẩm không được để trống")
    @Size(max = 30, message = "Loại sản phẩm không được vượt quá 30 ký tự")
    private String category;

    @NotBlank(message = "Mô tả sản phẩm không được để trống")
    @Size(max = 255, message = "Mô tả sản phẩm không được vượt quá 255 ký tự")
    private String description;

    @NotNull(message = "Giá sản phẩm không được để trống")
    @Min(value = 1, message = "Giá phải lớn hơn 0")
    private Double unitPrice; // Nên dùng Double thay vì double để tránh null value

    @NotNull(message = "Số lượng sản phẩm không được để trống")
    @Min(value = 0, message = "Số lượng không thể âm")
    private Double totalQuantity; // Nên dùng Double

    private boolean storage;

    @NotNull(message = "Cửa hàng không được để trống")
    @Positive(message = "ID cửa hàng phải lớn hơn 0")
    private Long storeId;

    @NotNull(message = "Kho hàng không được để trống")
    @Positive(message = "ID kho hàng phải lớn hơn 0")
    private Long wareHouseId;

}

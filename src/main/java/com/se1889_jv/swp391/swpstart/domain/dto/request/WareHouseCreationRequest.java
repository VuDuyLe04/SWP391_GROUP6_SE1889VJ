package com.se1889_jv.swp391.swpstart.domain.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class WareHouseCreationRequest {
    private long id;
    @NotBlank(message = "Tên sản phẩm không được để trống")
    @Size(max = 50, message = "Tên sản phẩm không được vượt quá 50 ký tự")
    private String name;
}

package com.se1889_jv.swp391.swpstart.domain.dto;

import com.se1889_jv.swp391.swpstart.util.StringUtils;
import com.se1889_jv.swp391.swpstart.util.constant.StatusStoreEnum;
import com.se1889_jv.swp391.swpstart.util.validator.annotation.ValidEnum;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreDTO {
    private Long id;
    @NotBlank(message = "Tên cửa hàng không được để trống")
    @Size(max = 100, message = "Tên cửa hàng không được vượt quá 100 ký tự")
    private String name;

    @NotBlank(message = "Địa chỉ không được để trống")
    @Size(max = 255, message = "Địa chỉ không được vượt quá 255 ký tự")
    private String address;

    @ValidEnum(enumClass = StatusStoreEnum.class, message = "Trạng thái không hợp lệ!")
    private String status;

    public StatusStoreEnum getStatusEnum() {
        return StatusStoreEnum.valueOf(status.toUpperCase());
    }
    public String getAddress(){
        return StringUtils.formatName(address);
    }
}
package com.se1889_jv.swp391.swpstart.domain.dto;

import com.se1889_jv.swp391.swpstart.util.StringUtils;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StaffDTO {

    private Long id; // Có thể null khi tạo mới, không cần validate

    @NotBlank(message = "Tên không được để trống")
    @Size(max = 100, message = "Tên không được vượt quá 100 ký tự")
    @Pattern(
            regexp = "^[a-zA-ZÀ-ỹ\\s'-]+$",
            message = "Tên không được chứa số hoặc ký tự đặc biệt (trừ dấu gạch ngang và dấu nháy đơn)!"
    )
    private String name;

    @NotBlank(message = "Số điện thoại không được để trống")
    @Pattern(
            regexp = "^\\s*(0[1-9][0-9]{8,9})\\s*$",
            message = "Số điện thoại không hợp lệ"
    )
    private String phone;

    @NotBlank(message = "Mật khẩu không được để trống")
    @Size(min = 8, max = 64, message = "Mật khẩu phải từ 8 đến 64 ký tự")
    @Pattern(
            regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\",.<>?/]).{8,64}$",
            message = "Mật khẩu phải có ít nhất một chữ hoa, một chữ thường, một số và một ký tự đặc biệt"
    )
    private String password;

    private Long storeId;

    public String getName() {
        return StringUtils.formatName(name);
    }
}

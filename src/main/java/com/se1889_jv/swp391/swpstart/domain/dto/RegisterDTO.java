package com.se1889_jv.swp391.swpstart.domain.dto;

import com.se1889_jv.swp391.swpstart.util.validator.annotation.RegisterChecked;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@RegisterChecked
@Getter
@Setter
public class RegisterDTO {
    @Size(min = 2, message = "Tên phải có tối thiểu 2 ký tự")
    private String name;
    private String phone;
    @NotBlank(message = "Không được để trống")
    private String password;
    @NotBlank(message = "Không được để trống")
    private String confirmPassword;

}

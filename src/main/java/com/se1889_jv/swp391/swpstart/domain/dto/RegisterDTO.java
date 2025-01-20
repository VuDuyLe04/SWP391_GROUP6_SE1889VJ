package com.se1889_jv.swp391.swpstart.domain.dto;

import com.se1889_jv.swp391.swpstart.util.validator.RegisterChecked;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@RegisterChecked
public class RegisterDTO {
    @Size(min = 3, message = "Tên phải có tối thiểu 3 ký tự")
    private String name;
    private String phone;
    @NotBlank(message = "Không được để trống")
    private String password;
    @NotBlank(message = "Không được để trống")
    private String confirmPassword;

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

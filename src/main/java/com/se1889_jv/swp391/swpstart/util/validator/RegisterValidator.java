package com.se1889_jv.swp391.swpstart.util.validator;

import com.se1889_jv.swp391.swpstart.domain.dto.RegisterDTO;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.stereotype.Service;


@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {
    private final UserService userService;

    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        boolean valid = true;
        boolean phoneCheck = true;
        // Check if password fields match
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Mật khẩu không khớp")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        //Validate field phone number
        if (user.getPhone() == null || user.getPhone().isEmpty() ||
                !user.getPhone().matches("^0\\d{9}$")
        ) {
            context.buildConstraintViolationWithTemplate("Số điện thoại không hợp lệ")
                    .addPropertyNode("phone")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
            phoneCheck = false;
        }

        // Additional validations can be added here
        // Check if phone exists
        if (phoneCheck == true) {

            if (this.userService.checkPhoneExist(user.getPhone())) {
                context.buildConstraintViolationWithTemplate("Số điện thoại đã tồn tại")
                        .addPropertyNode("phone")
                        .addConstraintViolation()
                        .disableDefaultConstraintViolation();
                valid = false;
            }
        }

        return valid;
    }
}

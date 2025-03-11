package com.se1889_jv.swp391.swpstart.util.validator;

import com.se1889_jv.swp391.swpstart.util.validator.annotation.ValidInteger;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class ValidIntegerValidator implements ConstraintValidator<ValidInteger,Integer> {


    @Override
    public void initialize(ValidInteger constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(Integer integer, ConstraintValidatorContext constraintValidatorContext) {
        if (integer == null) {
            return false; // Nếu là null hoặc chuỗi rỗng thì bỏ qua kiểm tra
        }
        try {
            // Kiểm tra xem chuỗi có phải là số hợp lệ hay không
            int v = integer.intValue();
            if (v <= 0 || v > Integer.MAX_VALUE) {
                return false;
            }
            return true;
        } catch (NumberFormatException e) {
            return false; // Trả về false nếu không phải là số hợp lệ
        }
    }
}

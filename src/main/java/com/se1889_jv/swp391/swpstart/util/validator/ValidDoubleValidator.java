package com.se1889_jv.swp391.swpstart.util.validator;

import com.se1889_jv.swp391.swpstart.util.validator.annotation.ValidDouble;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class ValidDoubleValidator implements ConstraintValidator<ValidDouble, Double> {
    @Override
    public void initialize(ValidDouble constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(Double aDouble, ConstraintValidatorContext constraintValidatorContext) {
        if (aDouble == null) {
            return false; // Nếu là null hoặc chuỗi rỗng thì bỏ qua kiểm tra
        }
        try {
            // Kiểm tra xem chuỗi có phải là số hợp lệ hay không
            double v = aDouble.doubleValue();
            if (v < 0 || v > Double.MAX_VALUE) {
                return false;
            }
            return true;
        } catch (NumberFormatException e) {
            return false; // Trả về false nếu không phải là số hợp lệ
        }
    }
}

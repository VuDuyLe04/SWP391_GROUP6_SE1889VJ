package com.se1889_jv.swp391.swpstart.util.validator.annotation;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import java.util.Arrays;

public class EnumValidator implements ConstraintValidator<ValidEnum, String> {
    private Class<? extends Enum<?>> enumClass;

    @Override
    public void initialize(ValidEnum annotation) {
        this.enumClass = annotation.enumClass();
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (value == null) {
            return true; // Không bắt buộc nhập
        }
        return Arrays.stream(enumClass.getEnumConstants())
                .map(Enum::name)
                .anyMatch(name -> name.equalsIgnoreCase(value));
    }
}

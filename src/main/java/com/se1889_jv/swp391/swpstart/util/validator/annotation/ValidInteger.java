package com.se1889_jv.swp391.swpstart.util.validator.annotation;


import com.se1889_jv.swp391.swpstart.util.validator.ValidIntegerValidator;
import jakarta.validation.Constraint;

import java.lang.annotation.*;

@Target({ ElementType.FIELD, ElementType.PARAMETER })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidIntegerValidator.class)
@Documented
public @interface ValidInteger {
    String message() default "Giá trị không hợp lệ";
    Class<?>[] groups() default {};
    Class<?>[] payload() default {};
}

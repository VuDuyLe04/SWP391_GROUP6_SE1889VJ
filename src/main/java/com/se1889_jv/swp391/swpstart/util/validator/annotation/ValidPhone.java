package com.se1889_jv.swp391.swpstart.util.validator.annotation;


import com.se1889_jv.swp391.swpstart.util.validator.ValidPhoneValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

@Constraint(validatedBy = ValidPhoneValidator.class)
@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ValidPhone {
    String message() default "10 số và bắt đầu bằng 0";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

}

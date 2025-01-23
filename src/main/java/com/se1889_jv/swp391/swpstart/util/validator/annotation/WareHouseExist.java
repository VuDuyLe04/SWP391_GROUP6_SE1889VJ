package com.se1889_jv.swp391.swpstart.util.validator.annotation;

import com.se1889_jv.swp391.swpstart.util.validator.WareHouseValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

@Constraint(validatedBy = WareHouseValidator.class)
@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface WareHouseExist {
    String message() default "Kho đã tồn tại";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}

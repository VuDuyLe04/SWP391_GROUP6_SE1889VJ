package com.se1889_jv.swp391.swpstart.util.validator.annotation;



import com.se1889_jv.swp391.swpstart.util.validator.ValidDoubleValidator;
import jakarta.validation.Constraint;

import java.lang.annotation.*;

@Target({ ElementType.FIELD, ElementType.PARAMETER })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidDoubleValidator.class)
@Documented
public @interface ValidDouble {
    String message() default "Giá trị không hợp lệ";
    Class<?>[] groups() default {};
    Class<?>[] payload() default {};
}

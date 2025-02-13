package com.se1889_jv.swp391.swpstart.util.validator;

import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.service.implementservice.CustomerService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import com.se1889_jv.swp391.swpstart.util.validator.annotation.ValidPhone;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;

public class ValidPhoneValidator implements ConstraintValidator<ValidPhone, String> {
    @Autowired
    private CustomerService customerService;
    @Override
    public boolean isValid(String phone, ConstraintValidatorContext constraintValidatorContext) {

        return phone.matches("^0\\d{9}$");
    }
}

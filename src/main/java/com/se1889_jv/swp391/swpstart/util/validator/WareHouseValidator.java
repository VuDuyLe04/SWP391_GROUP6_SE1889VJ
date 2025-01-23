package com.se1889_jv.swp391.swpstart.util.validator;


import com.se1889_jv.swp391.swpstart.service.implementservice.WareHouseService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import com.se1889_jv.swp391.swpstart.util.validator.annotation.WareHouseExist;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class WareHouseValidator implements ConstraintValidator<WareHouseExist, String> {
    private WareHouseService wareHouseService;

    public WareHouseValidator() {
        // Constructor không tham số
    }

    @Autowired
    public WareHouseValidator(WareHouseService wareHouseService) {
        this.wareHouseService = wareHouseService;
    }

    @Override
    public boolean isValid(String name, ConstraintValidatorContext constraintValidatorContext) {
        if (wareHouseService == null) {
            return true; // Hoặc false nếu bạn muốn xử lý khác
        }
        boolean result = this.wareHouseService.existsWareHouseByName(name, Utility.getStoreInSession());
        return !result;
    }
}


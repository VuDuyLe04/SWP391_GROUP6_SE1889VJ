package com.se1889_jv.swp391.swpstart.service.specification;

import com.se1889_jv.swp391.swpstart.domain.TransactionService;
import org.springframework.data.jpa.domain.Specification;

public class TransactionServiceSpecs {
    public static Specification<TransactionService> amountEquals(Double amount) {


        return Specification.where(null);
    }
}

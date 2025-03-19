package com.se1889_jv.swp391.swpstart.service.specification;

import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.Customer_;
import org.springframework.data.jpa.domain.Specification;

public class CustomerSpecs {
    public static Specification<Customer> nameOrPhoneLike(String nameOrPhone) {
        return (root, query, criteriaBuilder) ->
                criteriaBuilder.like(root.get(Customer_.NAME), "%" + nameOrPhone + "%");
    }
}

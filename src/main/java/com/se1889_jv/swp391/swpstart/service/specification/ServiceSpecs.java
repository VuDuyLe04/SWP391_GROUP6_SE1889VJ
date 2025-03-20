package com.se1889_jv.swp391.swpstart.service.specification;

import com.se1889_jv.swp391.swpstart.domain.Service;
import com.se1889_jv.swp391.swpstart.domain.Service_;
import org.springframework.data.jpa.domain.Specification;

public class ServiceSpecs {

    public static Specification<Service> nameLike(String name){
        return (root, query, criteriaBuilder)
                -> criteriaBuilder.like(root.get(Service_.NAME), "%"+name+"%");
    }

    public static Specification<Service> durationMonthsEqual(String durationMonths){
        try{
            int d = Integer.parseInt(durationMonths);

            return (root, query, criteriaBuilder)
                    -> criteriaBuilder.equal(root.get(Service_.DURATION_MONTHS), d);
        }
        catch(Exception e){

        }
        Specification<Service> combined = Specification.where(null);
        return combined;
    }
    public static Specification<Service> statusEqual(String status){

        switch(status){
            case "true": {
                return (root, query, criteriaBuilder)
                        -> criteriaBuilder.equal(root.get(Service_.ACTIVE), true);
            }

            case "false": {
                return (root, query, criteriaBuilder)
                        -> criteriaBuilder.equal(root.get(Service_.ACTIVE), false);
            }

            default: {
                return Specification.where(null);
            }

        }


    }
}

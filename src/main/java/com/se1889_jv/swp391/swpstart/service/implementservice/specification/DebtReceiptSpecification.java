package com.se1889_jv.swp391.swpstart.service.implementservice.specification;

import com.se1889_jv.swp391.swpstart.domain.DebtReceipt;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import org.springframework.data.jpa.domain.Specification;
import java.time.Instant;

public class DebtReceiptSpecification {

    public static Specification<DebtReceipt> findByCreatedAtBetween(Instant from, Instant to) {
        return (root, query, criteriaBuilder) ->
                criteriaBuilder.between(root.get("createdAt"), from, to);
    }

    public static Specification<DebtReceipt> findByDebtAmount(Double debtAmount) {
        return (root, query, criteriaBuilder) ->
                criteriaBuilder.greaterThanOrEqualTo(root.get("debtAmount"), debtAmount);
    }

    public static Specification<DebtReceipt> findByCustomer() {
        return (root, query, criteriaBuilder) -> criteriaBuilder.conjunction();
    }

    public static Specification<DebtReceipt> findByCreatedAtBefore(Instant to) {
        return (root, query, criteriaBuilder) ->
                criteriaBuilder.lessThanOrEqualTo(root.get("createdAt"), to);
    }

    public static Specification<DebtReceipt> findByCustomer(Long customerId) {
        return (root, query, criteriaBuilder) ->
                criteriaBuilder.equal(root.get("customer").get("id"), customerId);
    }

}

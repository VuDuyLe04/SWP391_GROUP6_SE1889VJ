package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.constant.DebtTypeEnum;
import jakarta.persistence.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

@Entity
@Table(name = "debt_receipts")
@Getter
@Setter
public class DebtReceipt {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private long debtAmount;
    @Enumerated(EnumType.STRING)
    private DebtTypeEnum debtType;
    private String debtReason;
    private Instant createdAt;
    private String createdBy;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @PrePersist
    public void handleBeforeCreate() {
        HttpServletRequest request = null;
        HttpSession session = request.getSession(false);
        this.createdBy = (String) session.getAttribute("name");
        this.createdAt = Instant.now();
    }
}

package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.Utility;
import com.se1889_jv.swp391.swpstart.util.constant.DebtTypeEnum;
import jakarta.persistence.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Builder;

@Entity
@Table(name = "debt_receipts")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DebtReceipt {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private double debtAmount;
    @Enumerated(EnumType.STRING)
    private DebtTypeEnum debtType;
    private String debtReason;
    private Instant createdAt;
    private String createdBy;
    private Boolean isProcess;
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @PrePersist
    public void handleBeforeCreate() {
        User user = Utility.getUserInSession();
        this.createdBy = user.getName();
        this.createdAt = Instant.now();
    }
}

package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.Utility;
import com.se1889_jv.swp391.swpstart.util.validator.annotation.ValidPhone;
import jakarta.persistence.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.context.SecurityContextHolder;

import java.time.Instant;
import java.util.List;

@Entity
@Table(name = "customers")
@Getter
@Setter

public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @NotEmpty(message = "Tên không được bỏ trống")
    private String name;
    private String address;

    @ValidPhone
    private String phone;
    private double balance;
    private Instant createdAt;
    private Instant updatedAt;
    private String createdBy;
    private String updatedBy;
    @ManyToOne
    @JoinColumn(name = "store_id")
    private Store store;

    @OneToMany(mappedBy = "customer", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<DebtReceipt> debtReceipts;

    @OneToMany(mappedBy = "customer", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Bill> bills;
    // tự động thêm khi tạo
    @PrePersist
    public void handleBeforeCreate() {
        User user = Utility.getUserInSession();
        this.createdBy = user.getName();
        this.createdAt = Instant.now();

    }
    // tự động thêm khi update
    @PreUpdate
    public void handleBeforeUpdate() {
        User user = Utility.getUserInSession();
        this.updatedBy = user.getName();
        this.updatedAt = Instant.now();

    }
    
}

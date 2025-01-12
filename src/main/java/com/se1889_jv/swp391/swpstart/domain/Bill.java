package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.constant.BillType;
import jakarta.persistence.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;
import java.util.List;

@Entity
@Table(name = "bills")
@Setter
@Getter
public class Bill {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Enumerated(EnumType.STRING)
    private BillType billType;
    private long paid;
    private long inDebt;
    private Instant createdAt;
    private String createdBy;
    private long totalBillPrice;
    private long totalLiftPrice;
    private String note;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "store_id")
    private Store store;

    @OneToMany(mappedBy = "bill")
    private List<BillDetail>  billDetails;

    @PrePersist
    public void handleBeforeCreate() {
        HttpServletRequest request = null;
        HttpSession session = request.getSession(false);
        this.createdBy = (String) session.getAttribute("name");
        this.createdAt = Instant.now();
    }
}

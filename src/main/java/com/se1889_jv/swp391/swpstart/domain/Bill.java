package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.constant.BillTypeEnum;
import jakarta.persistence.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;
import java.time.LocalDateTime;
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
    private BillTypeEnum billType;
    private double inDebt;
    private LocalDateTime createdAt;
    private String createdBy;
    private double totalBillPrice;
    private double totalLiftPrice;
    private String note;
    private double paid; // Đây là số tiền khách hàng đã thanh toán cho hóa đơn
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "store_id")
    private Store store;

    @OneToMany(mappedBy = "bill")
    private List<BillDetail>  billDetails;


}

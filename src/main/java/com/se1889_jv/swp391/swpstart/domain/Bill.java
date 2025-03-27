package com.se1889_jv.swp391.swpstart.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.se1889_jv.swp391.swpstart.util.constant.BillTypeEnum;
import jakarta.persistence.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
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
    private double paid;
    private double inDebt;
    @CreationTimestamp
    @Column(updatable = false)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @JsonFormat(pattern = "dd-MM-yyyy", timezone = "Asia/Ho_Chi_Minh")
    private Instant createdAt;
    private String createdBy;
    private double totalBillPrice;
    private double totalLiftPrice;
    private String note;
    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = true)
    @JsonBackReference
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "store_id")
    @JsonBackReference
    private Store store;

    @OneToMany(mappedBy = "bill")
    @JsonManagedReference
    private List<BillDetail>  billDetails;

    public String getFormattedDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        if (createdAt != null) {
            LocalDateTime dateTime = LocalDateTime.ofInstant(createdAt, ZoneId.systemDefault());
            return dateTime.format(formatter);
        }
        return null;
    }



}
package com.se1889_jv.swp391.swpstart.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.Instant;
import java.time.LocalDateTime;

@Entity
@Table(name = "bill_details")
@Getter
@Setter
public class BillDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String nameProduct;
    private double quantity;
    //gia ban thuc te
    private double actualSellPrice;
    //gia niem yet
    private double listedPrice;
    private double totalProductPrice;
    // co boc vac khong
    private boolean isLift;
    // gia boc vac
    private double liftPrice;
    // tong gia boc vac
    private double totalLiftProductPrice;
    @CreationTimestamp
    @Column(updatable = false)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @JsonFormat(shape = JsonFormat.Shape.STRING,pattern = "dd-MM-yyyy", timezone = "Asia/Ho_Chi_Minh")
    private LocalDateTime createdAt;

    private String createdBy;
    @ManyToOne
    @JoinColumn(name = "package_id")
    @JsonBackReference
    private Packaging packaging;

    @ManyToOne
    @JoinColumn(name = "product_id")
    @JsonBackReference
    private Product product;

    @ManyToOne
    @JoinColumn(name = "bill_id")
    @JsonBackReference
    private Bill bill;

    private String packagingName;
    private double quantityPerPackage;
}
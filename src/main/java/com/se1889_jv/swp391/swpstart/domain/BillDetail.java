package com.se1889_jv.swp391.swpstart.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

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
    private double actualSellPrice;
    private double listedPrice;
    private double totalProductPrice;
    private boolean isLift;
    private double liftPrice;
    private double totalLiftProductPrice;

    @ManyToOne
    @JoinColumn(name = "package_id")
    private Packaging packaging;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "bill_id")
    private Bill bill;

}

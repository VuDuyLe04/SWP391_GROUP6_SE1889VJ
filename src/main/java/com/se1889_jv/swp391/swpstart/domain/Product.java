package com.se1889_jv.swp391.swpstart.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "tables")
@Setter
@Getter
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private String category;
    private String description;
    private double unitPrice;
    private double totalQuantity;
    private String image;
    private boolean storage;

    @ManyToOne
    @JoinColumn(name = "store_id")
    private Store store;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "warehouse_id", referencedColumnName = "id")
    private WareHouse warehouse;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<BillDetail> billDetails;
}

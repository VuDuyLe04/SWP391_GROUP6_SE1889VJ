package com.se1889_jv.swp391.swpstart.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "packaings")
@Getter
@Setter
public class Packaging {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String packageType;
    private String quantityPerPackage;
    private double liftCost;

    @OneToMany(mappedBy = "packaging", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<BillDetail> billDetails;
}

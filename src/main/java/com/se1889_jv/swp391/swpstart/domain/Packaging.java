package com.se1889_jv.swp391.swpstart.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Table
@Getter
@Setter
public class Packaging {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String packageType;
    private String quantityPerPackage;
    private long liftCost;

    @OneToMany(mappedBy = "packaging", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<BillDetail> billDetails;
}

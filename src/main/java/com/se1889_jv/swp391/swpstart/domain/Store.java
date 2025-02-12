package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.constant.StatusStoreEnum;
import jakarta.persistence.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;
import lombok.Setter;


import java.time.Instant;

import java.util.List;

@Entity
@Table(name = "stores")
@Getter
@Setter
public class Store {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private String address;
    private Instant createdAt;
    private String createdBy;
    private Instant updatedAt;
    private String updatedBy;
//    private Instant renewalDate;
//    private Instant expirationDate;
    @Enumerated(EnumType.STRING)
    private StatusStoreEnum status;




    @OneToMany(mappedBy = "store", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Customer> customers;


    @OneToMany(mappedBy = "store", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Bill> bills;

    @OneToMany(mappedBy = "store", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<WareHouse> wareHouses;

    @OneToMany(mappedBy = "store", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Product> products;

    @OneToMany(mappedBy = "store", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<UserStore> userStores;

    @OneToMany(mappedBy = "store",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Packaging> packagings;
    @PrePersist
    public void handleBeforeCreate() {
        HttpServletRequest request = null;
        HttpSession session = request.getSession(false);
        this.createdBy = (String) session.getAttribute("name");
        this.createdAt = Instant.now();
    }

    @PreUpdate
    public void handleBeforeUpdate() {
        HttpServletRequest request = null;
        HttpSession session = request.getSession(false);
        this.updatedBy = (String) session.getAttribute("name");
        this.updatedAt = Instant.now();
    }


}

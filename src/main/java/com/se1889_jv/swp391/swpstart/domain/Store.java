package com.se1889_jv.swp391.swpstart.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.se1889_jv.swp391.swpstart.util.RequestUtils;
import com.se1889_jv.swp391.swpstart.util.Utility;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.se1889_jv.swp391.swpstart.util.constant.StatusStoreEnum;
import jakarta.persistence.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;


import java.time.Instant;

import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
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
    @CreationTimestamp
    @Column(updatable = false)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @JsonFormat(pattern = "dd-MM-yyyy", timezone = "Asia/Ho_Chi_Minh")
    private Instant createdAt;
    private String createdBy;
    @UpdateTimestamp
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @JsonFormat(pattern = "dd-MM-yyyy", timezone = "Asia/Ho_Chi_Minh")
    private Instant updatedAt;
    private String updatedBy;

    @Enumerated(EnumType.STRING)
    private StatusStoreEnum status;


    @OneToMany(mappedBy = "store", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Customer> customers;


    @OneToMany(mappedBy = "store", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Bill> bills;

    @OneToMany(mappedBy = "store", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<WareHouse> wareHouses;

    @OneToMany(mappedBy = "store", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<Product> products;

    @OneToMany(mappedBy = "store", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<UserStore> userStores;

    @OneToMany(mappedBy = "store",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Packaging> packagings;
    @PrePersist
    public void handleBeforeCreate() {
        HttpServletRequest request = RequestUtils.getCurrentHttpRequest();
        if (request != null) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                String userId = String.valueOf(Utility.getUserInSession().getId());
                this.createdBy = userId;
            } else {
                this.createdBy = "Unknown";
            }
        } else {
            this.createdBy = "Unknown";
        }
        this.createdAt = Instant.now();
    }

    @PreUpdate
    public void handleBeforeUpdate() {
        HttpServletRequest request = RequestUtils.getCurrentHttpRequest();
        if (request != null) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                String userId = String.valueOf(Utility.getUserInSession().getId());
                this.updatedBy = userId;

            } else {
                this.updatedBy = "Unknown";
            }
        } else {
            this.updatedBy = "Unknown";
        }
        this.updatedAt = Instant.now();
    }
     Date getCreatedAtAsDate() {
        return createdAt != null ? Date.from(createdAt) : null;
    }

    public Date getUpdatedAtAsDate() {
        return updatedAt != null ? Date.from(updatedAt) : null;
    }
    public String getCreatedAtFormatted() {
        return formatInstant(createdAt);
    }

    public String getUpdatedAtFormatted() {
        return formatInstant(updatedAt);
    }

    private String formatInstant(Instant instant) {
        if (instant == null) return "";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy")
                .withZone(ZoneId.of("Asia/Ho_Chi_Minh"));
        return formatter.format(instant);
    }


}

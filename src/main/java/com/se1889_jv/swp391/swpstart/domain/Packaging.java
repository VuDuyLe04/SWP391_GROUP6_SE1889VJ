package com.se1889_jv.swp391.swpstart.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
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
    private double quantityPerPackage;
    private double liftCost;
    private Instant createdAt;
    private Instant updatedAt;
    private String createdBy;
    private String updatedBy;
    private boolean storage;
    @OneToMany(mappedBy = "packaging", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<BillDetail> billDetails;

    @ManyToOne
    @JoinColumn(name = "store_id")
    private Store store;

    public Date getCreatedAtAsDate() {
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

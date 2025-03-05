package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.Utility;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;

import lombok.*;
import jakarta.validation.constraints.NotBlank;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "users")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String phone;
    @NotBlank
    private String password;
    @NotBlank(message = "Tên không được để trống")
    private String name;

    @CreationTimestamp
    @Column(updatable = false)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @JsonFormat(pattern = "dd-MM-yyyy", timezone = "Asia/Ho_Chi_Minh")
    private Instant createdAt;
    @UpdateTimestamp
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @JsonFormat(pattern = "dd-MM-yyyy", timezone = "Asia/Ho_Chi_Minh")
    private Instant updatedAt;
    private String createdBy;
    private String updatedBy;
    private boolean active;
    //thuộc tính mới
    private double balance;
    private Instant renewalDate;
    private Instant expirationDate;
    private boolean statusService;

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<UserStore> userStores;
    public void addUserStore() {
    User user = new User();
    user.getUserStores();
}

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<TransactionService> transactionServices;
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
//    public List<Store> getAllStores() {
//        List<Store> stores = new ArrayList<>();
//        for (UserStore userStore : userStores) {
//            stores.add(userStore.getStore());
//        }
//        return stores;
//    }


}

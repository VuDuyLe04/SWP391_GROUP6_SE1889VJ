package com.se1889_jv.swp391.swpstart.domain;

import jakarta.persistence.*;

import lombok.*;
import jakarta.validation.constraints.NotBlank;

import java.time.Instant;
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
    private String name;

    private Instant createdAt;
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


}

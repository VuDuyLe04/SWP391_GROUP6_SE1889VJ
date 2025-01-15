package com.se1889_jv.swp391.swpstart.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;


import java.time.Instant;
import java.util.List;

@Entity
@Table(name = "users")
@Getter
@Setter
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

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<UserStore> userStores;

    //    @Setter
//    @Getter
//    @NoArgsConstructor
//    @AllArgsConstructor
//    public static class UserDTO {
//        private long id;
//        private String phone;
//        private String name;
//        private Instant createdAt;
//        private Instant updatedAt;
//        private String createdBy;
//        private String updatedBy;
//        private boolean active;
//    }
}

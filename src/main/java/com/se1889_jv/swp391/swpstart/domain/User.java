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
    private String phone; //ca hai
    @NotBlank
    private String password;
    private String name;//cahai
    private Instant createdAt;
    private Instant updatedAt;
    private String createdBy;
    private String updatedBy;
    private boolean active;//admin

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;//admin

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<UserStore> userStores;
public void addUserStore() {

    User user = new User();
    user.getUserStores();

}

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

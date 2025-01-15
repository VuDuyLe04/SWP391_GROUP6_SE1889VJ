package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.constant.UserAccessStoreStatusEnum;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.stereotype.Service;

@Entity
@Table(name = "user_stores")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserStore {
    @Id
    private long id;

    @Enumerated(EnumType.STRING)
    private UserAccessStoreStatusEnum accessStoreStatus;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "store_id")
    private Store store;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;


}

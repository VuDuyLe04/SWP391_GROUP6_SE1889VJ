package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.constant.UserAccessStoreStatusEnum;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.stereotype.Service;

@Entity
@Table(name = "user_stores")
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

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public UserAccessStoreStatusEnum getAccessStoreStatus() {
        return accessStoreStatus;
    }

    public void setAccessStoreStatus(UserAccessStoreStatusEnum accessStoreStatus) {
        this.accessStoreStatus = accessStoreStatus;
    }
}

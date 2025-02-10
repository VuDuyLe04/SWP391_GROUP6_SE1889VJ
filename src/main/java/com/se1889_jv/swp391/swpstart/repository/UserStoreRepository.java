package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import com.se1889_jv.swp391.swpstart.util.constant.UserAccessStoreStatusEnum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserStoreRepository extends JpaRepository<UserStore, Long> {
    List<UserStore> findAllByUserId(Long userId);

    UserStore findByUserAndStore(User user, Store store);

}

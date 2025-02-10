package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long>, JpaSpecificationExecutor<User> {
    User findByPhone(String phone);
    Page<User> findUsersByNameContainingOrPhoneContaining(String name, String phone, Pageable pageable);
    boolean existsByPhone(String phone);

//    List<User> findByUserStore(List<UserStore> userStores);



    Page<User> findUsersByActive(boolean active, Pageable pageable);
    Page<User> findUsersByRoleId(Long roleId,Pageable pageable);
    Page<User> findUsersByRoleIdAndActive(Long roleId, boolean active, Pageable pageable);
}

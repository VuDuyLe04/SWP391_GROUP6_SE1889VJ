package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long>, JpaSpecificationExecutor<User> {
    User findByPhone(String phone);
    List<User> findUsersByNameContainingOrPhoneContaining(String name, String phone);
    boolean existsByPhone(String phone);
    List<User> findUsersByActive(boolean active);
    List<User> findUsersByRoleId(Long roleId);
    List<User> findUsersByRoleIdAndActive(Long roleId, boolean active);
}

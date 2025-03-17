package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long>, JpaSpecificationExecutor<User> {
    User findByPhoneAndPassword(String phone, String password);
    User findByPhone(String phone);
    List<User> findByRoleIdIn(List<Long> roleIds);

    Page<User> findUsersByNameContainingOrPhoneContaining(String name, String phone, Pageable pageable);
    boolean existsByPhone(String phone);
    @Query("SELECT u FROM User u " +
            "WHERE u.id IN (" +
            "   SELECT MIN(u2.id) FROM User u2 " +
            "   JOIN UserStore us ON u2.id = us.user.id " +
            "   JOIN Store s ON us.store.id = s.id " +
            "   JOIN u2.role r " +  // Thêm join với bảng Role
            "   WHERE s.createdBy = :createdBy " +
            "   AND r.name = 'STAFF' " +  // Lọc theo role name STAFF
            "   GROUP BY u2.phone" +
            ")")
    Page<User> findDistinctUsersByStoreCreatedBy(@Param("createdBy") String createdBy, Pageable pageable);
//    Page<User> findDistinctUsersByUserStores_Store_CreatedByAndByNameContainingOrPhoneContaining(String createdBy,String name,String phone, Pageable pageable);
    Page<User> findUsersByActive(boolean active, Pageable pageable);
    Page<User> findUsersByRoleId(Long roleId,Pageable pageable);
    Page<User> findUsersByRoleIdAndActive(Long roleId, boolean active, Pageable pageable);


    List<User> findAllByUserStoresIn(List<UserStore> userStores);
}

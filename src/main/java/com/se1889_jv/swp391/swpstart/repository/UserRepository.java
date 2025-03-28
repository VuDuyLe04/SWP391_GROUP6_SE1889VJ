package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Role;
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
    Page<User> findByNameContainingOrPhoneContainingAndRole_IdNot(String name, String phone, Long roleId, Pageable pageable);
    Page<User> findUsersByNameContainingOrPhoneContaining(String name, String phone, Pageable pageable);

    boolean existsByPhone(String phone);

    @Query("SELECT u FROM User u " +
            "WHERE u.id IN (" +
            "   SELECT MIN(u2.id) FROM User u2 " +
            "   JOIN UserStore us ON u2.id = us.user.id " +
            "   JOIN Store s ON us.store.id = s.id " +
            "   JOIN u2.role r " +
            "   WHERE s.createdBy = :createdBy " +
            "   AND r.name = 'STAFF' " +
            "   AND (:storeId IS NULL OR s.id = :storeId) " +
            "   AND (:active IS NULL OR u2.active = :active) " +
            "   AND (:keyword IS NULL OR :keyword = '' OR " +  // Nếu keyword null hoặc rỗng, bỏ qua
            "    u2.name LIKE %:keyword% OR u2.phone LIKE %:keyword%) " +
            "   GROUP BY u2.phone" +
            ")")
    Page<User> findStaffsByCreatedBy(
            @Param("createdBy") String createdBy,
            @Param("storeId") Long storeId,
            @Param("keyword") String keyword,
            @Param("active") Boolean active,
            Pageable pageable);
    Page<User> findByRoleIdNot(Long roleId, Pageable pageable);
//    findByRoleIdNot(1L,pageable);

    //Page<User> findDistinctUsersByUserStores_Store_CreatedByAndByNameContainingOrPhoneContaining(String createdBy,String name,String phone, Pageable pageable);
    Page<User> findUsersByActive(boolean active, Pageable pageable);
    Page<User> findUsersByRoleId(Long roleId,Pageable pageable);
    Page<User> findUsersByRoleIdAndActive(Long roleId, boolean active, Pageable pageable);


    List<User> findAllByUserStoresIn(List<UserStore> userStores);

    @Query(value = "SELECT balance FROM customers WHERE phone = :phone", nativeQuery = true)
    Double getBalanceByPhone(@Param("phone") String phone);

    Page<User> findUserByRole(Role role, Pageable pageable);
}

package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import com.se1889_jv.swp391.swpstart.util.constant.UserAccessStoreStatusEnum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;

@Repository
public interface UserStoreRepository extends JpaRepository<UserStore, Long> {
    List<UserStore> findAllByUserId(Long userId);
    List<UserStore>  findUserStoreByUserId(Long userId);
    UserStore findByUserAndStore(User user, Store store);

    List<UserStore> findAllByStoreIn(List<Store> stores);
    UserStore findByUser_PhoneAndStore_Id(String phone , Long storeId);
    UserStore findByUser_PhoneAndStore_CreatedBy(String phone , String storeId);
    UserStore findById(long id);
}

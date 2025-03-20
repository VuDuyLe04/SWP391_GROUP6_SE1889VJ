package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;

import java.util.List;

public interface IUserStoreService {
    UserStore getUserStoreByPhoneAndStore(String phone, Long storeId);
    UserStore findUserStore(long userId);
    UserStore saveUserStore(UserStore userStore);
    UserStore findUserStoreByUserAndStore(User user, Store store);
    List<UserStore> getAllUserStoresByUserId(long userId);
    UserStore findByUser_PhoneAndStore_CreatedBy(String phone , String storeId);
    List<Store> getStoresForUser(User user);

    List<UserStore> getAllUserStoresByStoreIn(List<Store> stores);
}

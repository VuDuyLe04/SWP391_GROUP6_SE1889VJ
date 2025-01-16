package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import com.se1889_jv.swp391.swpstart.repository.UserStoreRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IUserStoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserStoreService implements IUserStoreService {

    @Autowired
    private UserStoreRepository userStoreRepository;



    @Override
    public UserStore findUserStoreByUserAndStore(User user, Store store) {
        return this.userStoreRepository.findByUserAndStore(user, store);
    }

    @Override
    public UserStore findUserStore(long userId) {
        return null;
    }
}

package com.se1889_jv.swp391.swpstart.service.implementservice;


import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import com.se1889_jv.swp391.swpstart.repository.UserRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import com.se1889_jv.swp391.swpstart.domain.Role;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import com.se1889_jv.swp391.swpstart.domain.dto.RegisterDTO;
import com.se1889_jv.swp391.swpstart.repository.RoleRepository;
import com.se1889_jv.swp391.swpstart.repository.StoreRepository;
import com.se1889_jv.swp391.swpstart.repository.UserRepository;
import com.se1889_jv.swp391.swpstart.repository.UserStoreRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserService implements IUserService {
    @Autowired
    private  UserRepository userRepository;

    @Autowired
    private  PasswordEncoder passwordEncoder;

    @Autowired
    private  RoleRepository roleRepository;

    @Autowired
    private  StoreRepository storeRepository;



    @Override
    public User getUserByPhone(String phone) {
        return this.userRepository.findByPhone(phone);
    }

    @Override
    public User findById(long id) {
        Optional<User> user = this.userRepository.findById(id);
        if (user.isPresent()){
            return user.get();
        }
        return null;
    }

    @Override
    public User createUser(User user) {

        return this.userRepository.save(user);
    }

    @Override
    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    @Override
    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setName(registerDTO.getName());
        user.setPhone(registerDTO.getPhone());
        user.setPassword(registerDTO.getPassword());
        user.setActive(true);
        user.setCreatedAt(Instant.now());
        user.setCreatedBy(user.getName());
        return user;
    }

    @Override
    public boolean checkPhoneExist(String phone) {
        return this.userRepository.existsByPhone(phone);
    }

    @Override
    public Page<User> getAll(Pageable pageable){
        return this.userRepository.findAll(pageable);
    }

    @Override
    public Page<User> getUsersBySearch(String name, String phone, Pageable pageable) {
        return this.userRepository.findUsersByNameContainingOrPhoneContaining(name,phone,pageable);

    }

    @Override
    public Page<User> getUsersbyRoleID(Long id, Pageable pageable) {

        return this.userRepository.findUsersByRoleId(id,pageable);
    }

    @Override
    public Page<User> getUsersByActive(boolean active, Pageable pageable) {
        return this.userRepository.findUsersByActive(active,pageable);
    }

    @Override
    public Page<User> getUsersByRoleIDAndActive(Long id, boolean active, Pageable pageable) {
        return this.userRepository.findUsersByRoleIdAndActive(id, active,pageable);
    }

    @Override
    public Double getBalanceFromUser(String phone) {
        return userRepository.getBalanceByPhone(phone);
    }


    @Override
    public List<UserStore> getAllUserStores(User user) {

        return user.getUserStores();
    }

    @Override
    public User updateUser(User user) {
        User user1 = findById(user.getId());
        if(user1 != null){
            user1.setName(user.getName());
            user1.setUpdatedAt(Instant.now());
            user1.setUpdatedBy(user.getName());
        }
        return this.userRepository.save(user1);
    }

}

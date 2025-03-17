package com.se1889_jv.swp391.swpstart.service.implementservice;


import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.UserStore;
import com.se1889_jv.swp391.swpstart.repository.UserRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageImpl;
import org.springframework.stereotype.Service;


import com.se1889_jv.swp391.swpstart.domain.Role;
import com.se1889_jv.swp391.swpstart.domain.Store;

import com.se1889_jv.swp391.swpstart.domain.dto.RegisterDTO;
import com.se1889_jv.swp391.swpstart.repository.RoleRepository;
import com.se1889_jv.swp391.swpstart.repository.StoreRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


import java.time.Instant;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
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

    @Autowired
    private UserStoreService userStoreService;

    @Autowired
    private ServiceService serviceService;

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
    public Page<User> findDistinctUsersByCreatedByAndByNameOrPhone(String createdBy, String input, Pageable pageable) {
        // Lấy danh sách users theo createdBy
        Page<User> users = this.findDistinctUsersByUserStores_Store_CreatedBy(createdBy, pageable);

        // Lọc danh sách theo điều kiện name hoặc phone chứa input
        List<User> filteredUsers = users.getContent().stream()
                .filter(user -> user.getName().toLowerCase().contains(input) || user.getPhone().contains(input))
                .collect(Collectors.toList());

        // Chuyển danh sách đã lọc thành Page
        return new PageImpl<>(filteredUsers, pageable, filteredUsers.size());
    }

    @Override
    public Page<User> getUsersbyRoleID(Long id, Pageable pageable) {

        return this.userRepository.findUsersByRoleId(id,pageable);
    }

    @Override
    public Page<User> findDistinctUsersByCreatedByAndStore(String createdBy, Long storeId, Pageable pageable) {
        Page<User> users = this.findDistinctUsersByUserStores_Store_CreatedBy(createdBy, pageable);

        // Lọc danh sách theo điều kiện name hoặc phone chứa input
        List<User> filteredUsers = users.stream()
                .filter(user -> user.getUserStores().stream()
                        .anyMatch(us -> us.getStore().getId() == storeId)) // Đóng filter đúng chỗ
                .collect(Collectors.toList()); // collect đúng vị trí

        // Chuyển danh sách đã lọc thành Page
        return new PageImpl<>(filteredUsers, pageable, filteredUsers.size());
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
    public List<User> getAllUserByStoreIn(List<Store> store) {
        List<UserStore> userStores = this.userStoreService.getAllUserStoresByStoreIn(store);
        return this.userRepository.findAllByUserStoresIn(userStores);
    }

    @Override
    public User handleBuyService(User user,List<User> users, com.se1889_jv.swp391.swpstart.domain.Service service) {

        for (User user1 : users) {
            user1.setRenewalDate(Instant.now()); // Cập nhật ngày gia hạn hiện tại
            LocalDateTime expirationDate = LocalDateTime.now().plus(service.getDurationMonths(), ChronoUnit.MONTHS);
            user1.setExpirationDate(expirationDate.atZone(ZoneId.systemDefault()).toInstant());
            user1.setStatusService(true);
        }
        user.setBalance(user.getBalance()- service.getPrice());
        user.setRenewalDate(Instant.now()); // Cập nhật ngày gia hạn hiện tại
        LocalDateTime expirationDate = LocalDateTime.now().plus(service.getDurationMonths(), ChronoUnit.MONTHS);
        user.setExpirationDate(expirationDate.atZone(ZoneId.systemDefault()).toInstant());
        user.setStatusService(true);
        this.userRepository.save(user);
        return user;

    }


    @Override
    public List<UserStore> getAllUserStores(User user) {

        return user.getUserStores();
    }

    @Override
    public User findByPhoneAndPassword(String phone, String password) {
        return userRepository.findByPhoneAndPassword(phone, password);
    }

    @Override
    public List<User> findByRoleIdIn(List<Long> roleIds) {
        return userRepository.findByRoleIdIn(roleIds);
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
    @Override
     public  Page<User> findDistinctUsersByUserStores_Store_CreatedBy(String createdBy, Pageable pageable){
        return userRepository.findDistinctUsersByStoreCreatedBy( createdBy, pageable);
    };

}

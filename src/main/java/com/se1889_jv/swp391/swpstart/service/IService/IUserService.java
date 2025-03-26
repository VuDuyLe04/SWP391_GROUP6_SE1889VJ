package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.*;

import com.se1889_jv.swp391.swpstart.domain.dto.RegisterDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IUserService {
    User getUserByPhone(String phone);
    User findById(long id);
    User createUser(User user);
    Role getRoleByName(String name);
    User registerDTOtoUser(RegisterDTO registerDTO);
    boolean checkPhoneExist(String phone);
    List<UserStore> getAllUserStores(User user);
    User findByPhoneAndPassword(String phone, String password);



    Page<User> getUsersBySearch(String name, String phone, Long roleId, Pageable pageable);

    User updateUser(User user);

    Page<User> getAll(Pageable pageable);

    Page<User> getUsersbyRoleID(Long id, Pageable pageable);

    Page<User> getUsersByActive(boolean active, Pageable pageable);
    Page<User> findStaffsByCreatedBy(
            @Param("createdBy") String createdBy,
            @Param("storeId") Long storeId,
            @Param("keyword") String keyword,
            @Param("active") Boolean active,
            Pageable pageable);

    Page<User> getUsersByRoleIDAndActive(Long id, boolean active, Pageable pageable);

    Double getBalanceFromUser(String phone);

    List<User> getAllUserByStoreIn(List<Store> store);

    User handleBuyService(User user,List<User> users, Service service);

}

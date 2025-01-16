package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Role;

import com.se1889_jv.swp391.swpstart.domain.User;

import com.se1889_jv.swp391.swpstart.domain.UserStore;
import com.se1889_jv.swp391.swpstart.domain.dto.RegisterDTO;

import java.util.List;

public interface IUserService {
    User getUserByPhone(String phone);
    User findById(long id);
    User createUser(User user);
    Role getRoleByName(String name);
    User registerDTOtoUser(RegisterDTO registerDTO);
    boolean checkPhoneExist(String phone);
    List<UserStore> getAllUserStores(User user);


}

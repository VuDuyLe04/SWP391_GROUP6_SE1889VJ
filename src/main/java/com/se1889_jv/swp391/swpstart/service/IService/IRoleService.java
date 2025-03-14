package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Role;

import java.util.List;

public interface IRoleService {
    Role getRole(Long id);
    List<Role> getAllRoles();
}

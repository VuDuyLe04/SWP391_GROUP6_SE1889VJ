package com.se1889_jv.swp391.swpstart.service;

import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class gitUserService {
    private final UserRepository userRepository;
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User findByEmail(String email) {
        Optional<User> user = this.userRepository.findByEmail(email);
        if (user.isPresent()){
            return user.get();
        }
        return null;
    }

    public User findById(long id) {
        Optional<User> user = this.userRepository.findById(id);
        if (user.isPresent()){
            return user.get();
        }
        return null;
    }
    
}

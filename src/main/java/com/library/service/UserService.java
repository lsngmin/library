package com.library.service;

import com.library.domain.User;
import com.library.exception.UserNotFoundException;
import com.library.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    private final UserRepository userRepository;
    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
//    public User getUserByUserID(int userId) {
//        return userRepository.findByUserId(userId)
//                .orElseThrow(() -> new UserNotFoundException("아이디 또는 비밀번호가 틀렸습니다."));
//    }
}

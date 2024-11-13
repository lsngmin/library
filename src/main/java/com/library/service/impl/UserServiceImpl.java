package com.library.service.impl;

import com.library.domain.User;
import com.library.exception.UserNotFoundException;
import com.library.repository.UserRepository;
import com.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    @Override
    public User getUserByUserID(int userId) {
        return userRepository.findByUserId(userId)
                .orElseThrow(() -> new UserNotFoundException("USER ID: " + userId + "\n존재하지 않는 정보입니다."));
    }
}

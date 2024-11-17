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

    //userId와 password로 사용자 조회
    public User findUserByIdAndPassword(int userId, String password){
        return userRepository.findByUserIdAndPassword(userId, password)
                .orElseThrow(() -> new UserNotFoundException("아이디 또는 비밀번호가 올바르지 않습니다."));
    }

    // 사용자 삽입
    public void insertUser(User user) {
        userRepository.save(user);
    }
}

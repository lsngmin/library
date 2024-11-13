package com.library.service;

import com.library.domain.User;

public interface UserService {

    // 사용자 아이디로 사용자 정보 조회
    User getUserByUserID(int userId);
}

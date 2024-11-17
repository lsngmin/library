package com.library.user;

public interface UserService {
    void insertUser(UserVO vo);

    UserVO getLoginUser(UserVO vo);
}

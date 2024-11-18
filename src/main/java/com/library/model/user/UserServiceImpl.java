package com.library.model.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {
    private final UserDAO userDAO;

    public UserServiceImpl(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public void insertUser(UserVO vo) {
        userDAO.inserUser(vo);
    }
    public UserVO getLoginUser(UserVO vo) {
        return userDAO.getLoginUser(vo);
    }

    public int getTotalUser() {
        return userDAO.getTotalUser();
    }

    @Override
    public UserVO SelectSearchUser(UserVO vo) {
        return userDAO.selectSearchUser(vo);
    }
}
package com.library.user.service;

import com.library.user.model.UserDAO;
import com.library.user.model.UserVO;
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

    @Override
    public void updateOverDueDate(UserVO vo) {
        userDAO.updateOverDueDate(vo);
    }

    @Override
    public void updateRentalAvailableM(String userId) {
        userDAO.updateRentalAvailableM(userId);
    }

    @Override
    public void updateRentalAvailableP(String userId) {
        userDAO.updateRentalAvailableP(userId);
    }

    @Override
    public void updateStatus(String userId) {
        userDAO.updateStatus(userId);
    }

}
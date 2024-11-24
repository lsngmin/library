package com.library.user.service;

import com.library.user.model.UserDAO;
import com.library.user.model.UserVO;
import org.springframework.stereotype.Service;
import java.util.List;

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
    public List<UserVO> getUserList(int page, int size) {
        return userDAO.getUserList((page - 1) * size, size);
    }

    @Override
    public List<UserVO> searchUsers(UserVO searchVO, int page, int size) {
        return userDAO.searchUsers(searchVO, (page - 1) * size, size);
    }

    @Override
    public int getTotalSearchResults(UserVO searchVO) {
        return userDAO.getTotalSearchResults(searchVO);}

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

    @Override
    public void updatePassword(UserVO vo) {
        userDAO.updatePassword(vo);
    }

    @Override
    public UserVO getUserForPasswordReset(String userId) {
        return userDAO.getUserForPasswordReset(userId);
    }

    @Override
    public String selectPasswordByUserId(String userId) {
        return userDAO.selectPasswordByUserId(userId);
    }

    @Override
    public void updatePasswordByUserId(String userId, String password) {
        userDAO.updatePasswordByUserId(userId,password);
    }


}
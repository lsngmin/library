package com.library.user.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

@Repository
public class UserDAO {
    @Autowired
    private SqlSessionTemplate mybatis;

    public void inserUser(UserVO vo) {
        mybatis.insert("UserDAO.insertUser", vo);
    }

    public UserVO getLoginUser(UserVO vo) {
        return (UserVO) mybatis.selectOne("UserDAO.selectLoginGetUser", vo);
    }

    public int getTotalUser() {
        return (int) mybatis.selectOne("UserDAO.selectTotalUser");
    }

    public UserVO selectSearchUser(UserVO vo) {
        return (UserVO) mybatis.selectOne("UserDAO.selectSearchUser", vo);
    }

    public List<UserVO> getUserList(int offset, int size) {
        Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("size", size);
        return mybatis.selectList("UserDAO.selectUserList", params);
    }

    public List<UserVO> searchUsers(UserVO searchVO, int offset, int size) {
        Map<String, Object> params = new HashMap<>();
        params.put("searchVO", searchVO);
        params.put("offset", offset);
        params.put("size", size);
        return mybatis.selectList("UserDAO.searchUsers", params);
    }

    public int getTotalSearchResults(UserVO searchVO) {
        return (int) mybatis.selectOne("UserDAO.getTotalSearchResults", searchVO);
    }

    public void updateOverDueDate(UserVO vo) {
        mybatis.update("UserDAO.updateOverDueDate", vo);
    }

    public void updateRentalAvailableM(String userId) {
        mybatis.update("UserDAO.updateRentalAvailableM", userId);
    }
    public void updateRentalAvailableP(String userId) {
        mybatis.update("UserDAO.updateRentalAvailableP", userId);
    }
    public void updateStatus(String userId) {
        mybatis.update("UserDAO.updateStatus", userId);
    }

    public void updatePassword(UserVO vo) {
        mybatis.update("UserDAO.updatePassword", vo);
    }

    public UserVO getUserForPasswordReset(String userId) {
        return mybatis.selectOne("UserDAO.getUserForPasswordReset", userId);
    }
    public String selectPasswordByUserId(String userId) {
        return mybatis.selectOne("UserDAO.selectPasswordByUserId", userId);
    }
    public void updatePasswordByUserId(String userId, String password) {
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("password", password);
        mybatis.update("UserDAO.updatePasswordByUserId", params);
    }
}

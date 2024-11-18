package com.library.model.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO{
    @Autowired
    private SqlSessionTemplate mybatis;
    public void inserUser(UserVO vo) {
        mybatis.insert("UserDAO.insertUser", vo);
    }
    public UserVO getLoginUser(UserVO vo) {
        return (UserVO) mybatis.selectOne("UserDAO.selectLoginGetUser", vo);
    }
    //d
}

package com.library.admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {
    @Autowired
    private SqlSessionTemplate mybatis;

    public void insertAdmin(AdminVO vo) {
        mybatis.insert("AdminDAO.insertAdmin", vo);
    }
    public AdminVO selectAdmin(AdminVO vo) {
        return (AdminVO) mybatis.selectOne("AdminDAO.selectLoginAdmin", vo);
    }
    public void updateAdmin(AdminVO vo) {
        mybatis.update("AdminDAO.updateAdmin", vo);
    }
    public void deleteAdmin(AdminVO vo) {
        mybatis.delete("AdminDAO.deleteAdmin", vo);
    }
}
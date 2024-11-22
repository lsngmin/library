package com.library.rental.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.HashMap;


@Repository
public class RentalDAO {
    @Autowired
    private SqlSessionTemplate mybatis;

    public void insertRental(RentalVO vo) {
        mybatis.insert("RentalDAO.insertRental", vo);
    }

    public List<Map<String, Object>> selectRentalList(RentalVO vo) {
        return mybatis.selectList("RentalDAO.selectRentalList", vo);
    }
    public void deleteRental(String userId, String bookName) {
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("bookName", bookName);
        mybatis.delete("RentalDAO.deleteRental", params);
    }
    public int selectRentalExtensionByUserIdAndBookCode(String userId, String bookCode) {
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("bookCode", bookCode);
        return mybatis.selectOne("RentalDAO.selectRentalExtensionByUserIdAndBookCode", params);
    }

    public void updateRentalExtensionByUserIdAndBookCode(String userId, String bookCode) {
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("bookCode", bookCode);
        mybatis.update("RentalDAO.updateRentalExtensionByUserIdAndBookCode", params);
    }
}


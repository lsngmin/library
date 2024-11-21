package com.library.rental.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

}


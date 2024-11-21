package com.library.rental.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RentalDAO {
    @Autowired
    private SqlSessionTemplate mybatis;

    public void insertRental(RentalVO vo) {
        mybatis.insert("RentalDAO.insertRental", vo);
    }


}


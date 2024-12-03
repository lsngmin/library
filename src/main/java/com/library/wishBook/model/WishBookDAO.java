package com.library.wishBook.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class WishBookDAO {

    @Autowired
    private SqlSessionTemplate mybatis;

    // Insert a book wish
    public void insertBookWish(WishBookVO vo) {
        mybatis.insert("WishBookDAO.insertBookWish", vo);
    }

    // Get a book wish by wishCode
    public WishBookVO getBookWishByCode(String wishCode) {
        return mybatis.selectOne("WishBookDAO.getBookWishByCode", wishCode);
    }

    // Update a book wish
    public void updateBookWish(WishBookVO vo) {
        mybatis.update("WishBookDAO.updateBookWish", vo);
    }

    // Delete a book wish
    public void deleteBookWish(String wishCode) {
        mybatis.delete("WishBookDAO.deleteBookWish", wishCode);
    }

    // Get all book wishes
    public List<WishBookVO> getAllBookWishes() {
        return mybatis.selectList("WishBookDAO.getAllBookWishes");
    }

    public List<WishBookVO> getWishBooksByUserId(String userId) {
        return mybatis.selectList("WishBookDAO.getWishBooksByUserId", userId);
    }
    public int selectCountTotal() {
        return mybatis.selectOne("WishBookDAO.selectCountTotal");
    }
}

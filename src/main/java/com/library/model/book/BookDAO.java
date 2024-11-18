package com.library.model.book;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookDAO {
    @Autowired
    private SqlSessionTemplate mybatis;

    public void insertBook(BookVO vo) {
        mybatis.insert("BookDAO.insertBook", vo);
    }
    public BookVO selectBook(BookVO vo) {
        return mybatis.selectOne("BookDAO.selectBook", vo);
    }
    public void updateBook(BookVO vo) {
        mybatis.update("BookDAO.updateBook", vo);
    }
    public void deleteBook(BookVO vo) {
        mybatis.delete("BookDAO.deleteBook", vo);
    }

    public int selectTotalBook() {
        return mybatis.selectOne("BookDAO.selectBookTotal");
    }

    public BookVO selectSearchBook(BookVO vo) {
        return (BookVO) mybatis.selectOne("BookDAO.selectSearchBook", vo);
    }
}

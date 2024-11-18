package com.library.model.book;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

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
}

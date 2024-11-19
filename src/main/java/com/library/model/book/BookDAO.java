package com.library.model.book;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

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

    public List<BookVO> getBookList() {
        return mybatis.selectList("BookDAO.getBookList");
    }

    // 테이블 생성 메서드 추가
    public void createBookTable() {
        mybatis.update("BookDAO.createBookTable");
    }

}

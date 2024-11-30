package com.library.book.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
    /*
    public void createBookTable() {
        mybatis.update("BookDAO.createBookTable");
    }
     */

    public void insertBook() {
        mybatis.insert("BookDAO.insertBook");
    }

    public int selectTotalBook() {
        return mybatis.selectOne("BookDAO.selectBookTotal");
    }

    public BookVO selectSearchBook(BookVO vo) {
        return (BookVO) mybatis.selectOne("BookDAO.selectSearchBook", vo);
    }

    public BookVO selectBookDetail(BookVO vo) {
        return mybatis.selectOne("BookDAO.selectBookDetail", vo);
    }

    public String selectBookCodeByBookName(String bookName) {
        return mybatis.selectOne("BookDAO.selectBookCodeByBookName", bookName);
    }
    // borrowCount 증가 메서드
    public void incrementBorrowCount(String bookCode) {
        mybatis.update("BookDAO.incrementBorrowCount", bookCode);
    }

    public List<BookVO> getBooksByCategory(String category) {
        return mybatis.selectList("BookDAO.getBooksByCategory", category);
    }

    public List<BookVO> searchBooksByKeyword(String keyword) {
        return mybatis.selectList("BookDAO.searchBooksByKeyword", keyword);
    }

    public List<BookVO> searchBooksByKeywordAndType(String keyword, String searchType) {
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", "%" + keyword + "%"); // LIKE 조건을 위한 와일드카드 추가
        params.put("searchType", searchType); // 검색 타입 추가
        return mybatis.selectList("BookDAO.searchBooksByKeywordAndType", params); // 수정된 부분
    }
}

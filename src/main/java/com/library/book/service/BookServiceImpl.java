package com.library.book.service;

import com.library.book.model.BookDAO;
import com.library.book.model.BookVO;
import com.library.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("bookService")
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDAO bookDAO;
    @Override
    public void insertBook(BookVO vo) {
        bookDAO.insertBook(vo);
    }

    @Override
    public BookVO selectBook(BookVO vo) {
        return bookDAO.selectBook(vo);
    }

    @Override
    public void updateBook(BookVO vo) {
        bookDAO.updateBook(vo);
    }

    @Override
    public void deleteBook(BookVO vo) {
        bookDAO.deleteBook(vo);
    }

    @Override
    public BookVO getBookById(String bookCode) {
        BookVO vo = new BookVO();
        vo.setBookCode(bookCode);
        return bookDAO.selectBook(vo);  // 기존 selectBook 메서드 활용
    }

    @Override
    public List<BookVO> getBookList() {
        return bookDAO.getBookList();
    }

    /*
    @Override
    public void createBookTable() {  // 추가
        bookDAO.createBookTable();
    }
     */

    public int selectTotalBook() {
        return bookDAO.selectTotalBook();
    }

    @Override
    public BookVO selectSearchBook(BookVO vo) {
        return (BookVO) bookDAO.selectSearchBook(vo);
    }

    @Override
    public BookVO selectBookDetail(BookVO vo) {
        return bookDAO.selectBookDetail(vo);
    }

    @Override
    public String selectBookCodeByBookName(String bookName) {
        return bookDAO.selectBookCodeByBookName(bookName);
    }

    @Override
    public void incrementBorrowCount(String bookCode) {
        bookDAO.incrementBorrowCount(bookCode);
    }

    @Override
    public List<BookVO> getBooksByCategory(String category) {
        return bookDAO.getBooksByCategory(category);
    }

}

package com.library.book;

import org.springframework.beans.factory.annotation.Autowired;

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
}

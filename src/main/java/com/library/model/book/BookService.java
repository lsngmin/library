package com.library.model.book;

public interface BookService {
    void insertBook(BookVO vo);
    BookVO selectBook(BookVO vo);
    void updateBook(BookVO vo);
    void deleteBook(BookVO vo);
}

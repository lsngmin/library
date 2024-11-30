package com.library.book.service;
import com.library.book.model.BookVO;

import java.util.List;

public interface BookService {
    void insertBook(BookVO vo);
    BookVO selectBook(BookVO vo);
    void updateBook(BookVO vo);
    void deleteBook(BookVO vo);

    //void createBookTable();

    BookVO getBookById(String bookCode);

    List<BookVO> getBookList();

    int selectTotalBook();
    BookVO selectSearchBook(BookVO vo);
    BookVO selectBookDetail(BookVO vo);

    String selectBookCodeByBookName(String bookName);

    void incrementBorrowCount(String bookCode);

    List<BookVO> getBooksByCategory(String category);

    List<BookVO> searchBooksByKeywordAndType(String keyword, String searchType); // 수정된 부분

}

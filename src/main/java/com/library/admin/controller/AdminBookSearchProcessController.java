package com.library.admin.controller;

import com.library.book.service.BookService;
import com.library.book.model.BookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class AdminBookSearchProcessController {
    @Autowired
    private BookService bookService;

    @PostMapping("/admindashboard/searchBook")
    @ResponseBody
    public Map<String, String> searchBook(@RequestBody Map<String, String> request) {
        String bookCode = request.get("bookCode");
        BookVO vo = new BookVO();
        System.out.println(bookCode);
        vo.setBookCode(bookCode);
        BookVO book = bookService.selectSearchBook(vo);
        System.out.println(book);
        Map<String, String> result = new HashMap<>();
        if (book != null) {
            result.put("bookName", book.getBookName());
            result.put("bookAuthor", book.getBookAuthor());
            result.put("bookPublisher", book.getBookPublisher());
            result.put("bookPublishDate",book.getBookPublishDate());
        } else {
            result.put("error", "error");
        }
        return result;
    }
}

package com.library.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.library.book.model.BookVO;
import com.library.book.service.BookService;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class BookInquiryController {
    private final BookService bookService;

    @Autowired
    public BookInquiryController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/bookinquiry")
    public String bookList(Model model) {
        List<BookVO> bookList = bookService.getBookList();
        model.addAttribute("bookList", bookList);
        return "admin/bookinquiry";
    }
}
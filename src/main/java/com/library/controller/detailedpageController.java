package com.library.controller;

import com.library.book.model.BookVO;
import com.library.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class detailedpageController {
    @Autowired
    private BookService bookService;

    @GetMapping("/bookdetails/{bookCode}")
    public String bookdetails(@PathVariable String bookCode, Model model) {
        BookVO book = bookService.getBookById(bookCode);
        if (book != null) {
            model.addAttribute("book", book);
            return "library/bookdetails";
        }
        return "redirect:/";
    }
}
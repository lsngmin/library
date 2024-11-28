package com.library.controller;

import com.library.book.service.BookService;
import com.library.book.model.BookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class InterestBookViewController {

    @Autowired
    private BookService bookService;

    @GetMapping("/interestbookview")
    public String interestbookview(@RequestParam(value = "category", required = false, defaultValue = "전체") String category, Model model) {
        List<BookVO> books;

        if ("전체".equals(category)) {
            books = bookService.getBookList(); // 모든 도서 가져오기
        } else {
            books = bookService.getBooksByCategory(category); // 특정 카테고리의 도서만 가져오기
        }

        model.addAttribute("books", books); // 도서 목록 전달
        model.addAttribute("selectedCategory", category); // 선택된 카테고리 전달
        return "library/interestbookview"; // JSP로 이동
    }
}

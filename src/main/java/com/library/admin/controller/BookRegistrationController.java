package com.library.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.library.book.model.BookVO;          // 추가
import com.library.book.service.BookService;     // 추가

@Controller
@RequestMapping("/admin")  // 추가
public class BookRegistrationController {

    private final BookService bookService;

    @Autowired
    public BookRegistrationController(BookService bookService) {
        this.bookService = bookService;
    }

    // 도서 등록 페이지로 이동하는 매핑
    @GetMapping("/bookregister")  // '/admin/bookregister' 경로 매핑
    public String showBookRegistrationForm() {
        return "admin/bookregister";  // 'admin' 폴더 내 'bookregister.jsp'로 이동
    }

    // 도서 등록 처리
    @PostMapping("/bookregister")
    public String registerBook(@ModelAttribute BookVO vo,
                               @RequestParam(value = "coverImage", required = false) MultipartFile coverImage) {
        try {
            System.out.println("도서 등록 요청 받음");
            System.out.println("도서 정보: " + vo.toString());
            bookService.insertBook(vo);
            return "redirect:/admin/bookinquiry";
        } catch (Exception e) {
            System.out.println("에러 발생: " + e.getMessage());
            e.printStackTrace();
            return "redirect:/admin/bookregister?error=true";
        }
    }
}
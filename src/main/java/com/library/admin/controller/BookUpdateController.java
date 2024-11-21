package com.library.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.library.book.model.BookVO;          // 추가
import com.library.book.service.BookService;     // 추가

@Controller
@RequestMapping("/library")
public class BookUpdateController {

    private final BookService bookService;     // 추가

    @Autowired                                // 추가
    public BookUpdateController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/book/{bookCode}")
    public ResponseEntity<BookVO> getBook(@PathVariable String bookCode) {
        BookVO book = bookService.getBookById(bookCode);
        return ResponseEntity.ok(book);
    }

    @PostMapping("/book/update")
    public String updateBook(@ModelAttribute BookVO vo,
                             @RequestParam(value = "coverImage", required = false) MultipartFile coverImage) {
        try {
            if (coverImage != null && !coverImage.isEmpty()) {
                vo.setBookImageSrc("저장된 경로");
            }
            bookService.updateBook(vo);
            return "redirect:/library/adminBookInquiry.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/library/adminBookInquiry.jsp?error=true";
        }
    }
}
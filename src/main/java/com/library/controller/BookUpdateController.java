/*
package com.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.http.ResponseEntity;
import com.library.domain.dto.BookUpdateDTO;
import com.library.service.BookService;

@Controller
@RequestMapping("/library")
public class BookUpdateController {

    private final BookService bookService;

    @Autowired
    public BookUpdateController(BookService bookService) {
        this.bookService = bookService;
    }

    // 수정할 도서 정보 가져오기
    @GetMapping("/book/{id}")
    public ResponseEntity<BookUpdateDTO> getBook(@PathVariable Long id) {
        BookUpdateDTO book = bookService.getBookById(id);
        return ResponseEntity.ok(book);
    }

    // 도서 정보 수정
    @PostMapping("/book/update")
    public String updateBook(@ModelAttribute BookUpdateDTO bookDTO,
                           @RequestParam(value = "coverImage", required = false) MultipartFile coverImage) {
        try {
            bookService.updateBook(bookDTO, coverImage);
            return "redirect:/library/adminBookInquiry.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/library/adminBookInquiry.jsp?error=true";
        }
    }
}
 */
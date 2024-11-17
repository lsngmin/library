/*
package com.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/library")
public class BookRegistrationController {

    private final BookService bookService;

    @Autowired
    public BookRegistrationController(BookService bookService) {
        this.bookService = bookService;
    }

    @PostMapping("/adminBookRegister")
    public String registerBook(@ModelAttribute BookRegistrationDTO bookDTO,
                             @RequestParam("coverImage") MultipartFile coverImage) {
        try {
            bookService.registerBook(bookDTO, coverImage);
            return "redirect:/library/adminBookInquiry.jsp";
        } catch (IllegalArgumentException e) {
            return "redirect:/library/adminBookRegister.jsp?error=invalid";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/library/adminBookRegister.jsp?error=true";
        }
    }
}
*/
package com.library.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.library.book.model.BookVO;
import com.library.book.service.BookService;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Map;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookRegistrationController {

    private final BookService bookService;

    @Autowired
    public BookRegistrationController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/bookregister")
    public String showBookRegistrationForm() {
        return "admin/bookregister";
    }

    @PostMapping("/bookregister")
    public String registerBook(
            @RequestParam Map<String, String> params,  // 다른 폼 데이터
            @RequestParam("bookImageSrc") MultipartFile file,
            HttpServletRequest request) {
        try {
            BookVO vo = new BookVO();
            // BookVO 객체에 폼 데이터 설정
            vo.setBookName(params.get("bookName"));
            vo.setBookAuthor(params.get("bookAuthor"));
            vo.setBookPublisher(params.get("bookPublisher"));
            vo.setBookPublishDate(params.get("bookPublishDate"));
            vo.setBookCategory(params.get("bookCategory"));
            vo.setBookCode(params.get("bookCode"));
            vo.setBookPrice(params.get("bookPrice"));
            vo.setBookPage(params.get("bookPage"));
            vo.setBookLocation(params.get("bookLocation"));
            vo.setBookStatus(params.get("bookStatus"));
            vo.setBookDecription(params.get("bookDecription"));
            vo.setBookQuantity(params.get("bookQuantity"));

            if (!file.isEmpty()) {
                String uploadPath = request.getSession().getServletContext().getRealPath("/resources/img/");
                System.out.println("업로드 경로: " + uploadPath);

                File directory = new File(uploadPath);
                if (!directory.exists()) {
                    directory.mkdirs();
                }

                String originalFileName = file.getOriginalFilename();
                File saveFile = new File(uploadPath, originalFileName);
                file.transferTo(saveFile);

                vo.setBookImageSrc("/img/" + originalFileName);
            }

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
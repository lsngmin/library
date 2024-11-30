package com.library.controller;

import com.library.book.model.BookVO;
import com.library.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller
public class SearchController {

    @Autowired
    private BookService bookService;

    // 검색 페이지 출력 (GET 요청)
    @GetMapping("/search")
    public String showSearchPage(
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
            Model model
    ) {
        if (keyword != null) {
            try {
                // URL 디코딩으로 깨진 문자 복구
                keyword = URLDecoder.decode(keyword, StandardCharsets.UTF_8.name());
            } catch (Exception e) {
                System.out.println("키워드 디코딩 중 오류 발생: " + e.getMessage());
            }
        }

        List<BookVO> books = null;

        if (keyword != null && !keyword.trim().isEmpty()) {
            books = bookService.searchBooksByKeywordAndType(keyword, searchType); // 수정된 부분
        }

        if (books == null || books.isEmpty()) {
            model.addAttribute("message", "검색 결과가 없습니다.");
        } else {
            model.addAttribute("books", books);
        }

        model.addAttribute("keyword", keyword);
        model.addAttribute("searchType", searchType); // 검색 타입 전달
        return "library/search";
    }

    // 검색 요청 처리 (POST 요청)
    @PostMapping("/searchkeyword")
    public String processSearchKeyword(
            @RequestParam("keyword") String keyword,
            @RequestParam("searchType") String searchType, // 수정된 부분: 검색 타입도 전달
            RedirectAttributes redirectAttributes
    ) {
        // 검색어와 타입을 리다이렉트 시에 전달
        redirectAttributes.addAttribute("keyword", keyword);
        redirectAttributes.addAttribute("searchType", searchType); // 수정된 부분
        // GET 요청으로 리다이렉트
        return "redirect:/search";
    }
}

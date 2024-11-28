package com.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;

@Controller
public class SearchController {
    @GetMapping("/search")
    public String showSearchPage(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        if (keyword != null && !keyword.isEmpty()) {
            model.addAttribute("keyword", keyword);
        }
        return "library/search"; // JSP 페이지 이름
    }

    @PostMapping("/searchkeyword")
    public String getSearchKeyword(@RequestBody Map<String, String> request, RedirectAttributes redirectAttributes) {
        String keyword = request.get("keyword");

        // 검색어를 리다이렉트 시에 함께 전달하기 위해 추가
        redirectAttributes.addFlashAttribute("keyword", keyword);

        // "/search" 페이지로 리다이렉트
        return "redirect:/search";
    }
}

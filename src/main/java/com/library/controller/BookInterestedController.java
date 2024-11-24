package com.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BookInterestedController {

    @GetMapping("/interestedBooks")
    public String showInterestedBooks() {
        return "myinfo/interestedBooks";  // JSP 파일 경로 수정
    }
}
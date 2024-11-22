package com.library.controller;

import com.library.user.model.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class NoticeController {
    @GetMapping("/notice")
    public String notice(HttpSession session, Model model) {
        // 세션에서 사용자 정보 가져오기
        UserVO user = (UserVO) session.getAttribute("user");
        model.addAttribute("user", user); // 사용자 정보 전달
        return "notice";
    }
}

package com.library.controller;

import com.library.user.model.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class GuideController {
    @GetMapping("/guide")
    public String guide(HttpSession session, Model model) {
        // 세션에서 사용자 정보 가져오기
        UserVO user = (UserVO) session.getAttribute("user");
        // 사용자 정보를 모델에 추가하여 뷰로 전달
        model.addAttribute("user", user);
        return "library/guide";
    }
}

package com.library.controller;

import com.library.user.UserService;
import com.library.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class MyInfoController {

    @Autowired
    private UserService userService;

    @GetMapping("/myInfo")
    public String showMyInfo(HttpSession session, Model model) {

        // 세션에서 로그인된 사용자 객체 가져오기
        UserVO user = (UserVO) session.getAttribute("user");
        return "myInfo"; // 내 정보 뷰
    }
}

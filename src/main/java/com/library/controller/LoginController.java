package com.library.controller;

import com.library.user.UserDAO;
import com.library.user.UserService;
import com.library.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    // 로그인 페이지로 이동
    @GetMapping("/login")
    public String showLoginForm(@ModelAttribute("user") UserVO vo) {
        return "login";
    }

    //로그인 처리
    @PostMapping(value = "/login")
    public String loginUser(UserVO vo, HttpSession session) {
        if(vo.getUserId() == 0) {
            throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다,");
        }
        UserVO user = userService.getLoginUser(vo);
        if (user != null) {
            session.setAttribute("userName", user.getName());
            System.out.println(user.getName());
            return "main";
        } else {
            return "login";
        }
    }
}

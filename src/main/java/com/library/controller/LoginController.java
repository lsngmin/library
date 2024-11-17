package com.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class LoginController {

    // 로그인 페이지로 이동
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginForm() {
        return "login"; // login.jsp 반환
    }

    //로그인 처리
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginUser(@RequestParam int userId, @RequestParam String password, Model model) {
        try {
            model.addAttribute("message", "로그인 성공");
            return "main"; // main 페이지로 이동
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "login"; // 로그인 폼으로 다시 이동
        }
    }
}

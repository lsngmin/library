package com.library.controller;

import com.library.model.user.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {

    @GetMapping("/main")
    public String getMainPage(HttpSession session, Model model) {
        UserVO user = (UserVO) session.getAttribute("user");
        model.addAttribute("user", user);
        return "main";
    }
}

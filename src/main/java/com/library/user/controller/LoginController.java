package com.library.user.controller;

import com.library.user.service.UserService;
import com.library.user.model.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    // 로그인 페이지로 이동
    @GetMapping("/login")
    public String showLoginForm(@ModelAttribute("user") UserVO vo,
                                HttpServletRequest request, Model model ) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("savedUserId")) {
                    model.addAttribute("savedUserId", cookie.getValue());
                    break;
                }
            }
        }
        return "login";
    }
    //로그인 처리
    @PostMapping(value = "/login")
    public String loginUser(UserVO vo, HttpSession session, HttpServletResponse response,
                            @RequestParam(value = "saveId", required = false) String saveId) {
        System.out.println("sssssssssssssssss" + vo.getUserId());
        if(vo.getUserId() == null || vo.getUserId().equals("")) {
            throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다,");
        }
        UserVO user = userService.getLoginUser(vo);
        if (user != null && vo.getPassword().equals(user.getPassword())) {
            session.setAttribute("user", user);
            if("on".equals(saveId)) {
                Cookie cookie = new Cookie("savedUserId", vo.getUserId());
                cookie.setMaxAge(7 * 24 * 60 * 60);
                cookie.setPath("/");
                response.addCookie(cookie);
            } else {
                Cookie cookie = new Cookie("savedUserId", null);
                cookie.setMaxAge(0); // 즉시 삭제
                cookie.setPath("/");
                response.addCookie(cookie);
            }
            return "redirect:/main";
        } else {
            return "login";
        }
    }
}

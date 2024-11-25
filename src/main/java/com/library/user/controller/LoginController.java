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
import java.util.HashMap;
import java.util.Map;

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
        return "library/login";
    }
    //로그인 처리
    @PostMapping(value = "/login")
    public String loginUser(UserVO vo, HttpSession session, HttpServletResponse response,
                            @RequestParam(value = "saveId", required = false) String saveId,
                            Model model) {

        if(vo.getUserId() == null || vo.getUserId().equals("") || vo.getPassword() == null || vo.getPassword().equals("")) {
            model.addAttribute("errorMessage", "아이디 또는 비밀번호가 입력되지 않았습니다.");
            return "library/login";
        }
        UserVO user = userService.getLoginUser(vo);

        if (user != null && vo.getPassword().equals(user.getPassword())) {
            session.setAttribute("userId", user.getUserId());
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
            return "library/login";
        }
    }
    @PostMapping("/loginAjax")
    @ResponseBody
    public Map<String, Object> loginAjax(@RequestBody UserVO vo, HttpSession session) {
        Map<String, Object> response = new HashMap<>();


        UserVO user = userService.getLoginUser(vo);

        if (user != null && vo.getPassword().equals(user.getPassword())) {
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("user", user);
            response.put("status", "success");
        } else {

            response.put("status", "fail");
            response.put("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
        }
        return response;
    }
}

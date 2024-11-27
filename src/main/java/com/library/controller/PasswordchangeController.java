package com.library.controller;
import com.library.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PasswordchangeController {
    @Autowired
    private UserService userService;

    @GetMapping("/passwordchange")
    public String passwordchange() {
        return "myinfo/passwordchange";
    }

    @PostMapping("/passwordchange/process")
    public ModelAndView passwordchangeProcess(@SessionAttribute("userId") String userId,
                                              @RequestParam("current-password") String curPassword,
                                              @RequestParam("new-password") String password) {
        ModelAndView mav = new ModelAndView();
        String pwd = userService.selectPasswordByUserId(userId);
        if (pwd.equals(curPassword)) {
            userService.updatePasswordByUserId(userId, password);
            mav.setViewName("/myinfo/passwordchange");
            mav.addObject("message", "비밀번호가 성공적으로 변경되었습니다.");
            return mav;
        } else {
            mav.setViewName("/myinfo/passwordchange");
            mav.addObject("errorMessage", "비밀번호가 일치하지 않습니다.");
            return mav;
        }

    }
}
package com.library.controller;

import com.library.user.UserService;
import com.library.user.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PasswordResetController {
    private UserService userService;
    @GetMapping("/resetpassword")
    public String passwordReset(@ModelAttribute("user") UserVO vo) {
        return "resetpassword";
    }
    @PostMapping("/resetpassword")
    public String processPasswordReset(UserVO vo, Model model) {
        if(vo.getUserId() == null || vo.getUserId().equals("")) {
            throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다,");
        }
        UserVO user = userService.getLoginUser(vo);
        if (user != null && vo.getBirth().equals(user.getBirth())) {
            model.addAttribute("validationResult", true);
            return "validationPage";
        } else {
            model.addAttribute("validationResult", false);
            return "validationPage";
        }
    }
}

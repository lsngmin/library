package com.library.controller;

import com.library.model.user.UserService;
import com.library.model.user.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.UUID;

@Controller
public class PasswordResetController {
    private UserService userService;
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
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
        String tempPassword = UUID.randomUUID().toString().substring(0, 8);
        if (user != null && vo.getBirth().equals(user.getBirth())) {
            model.addAttribute("validationResult", true);
            model.addAttribute("tempPassword", tempPassword); // 임시 비밀번호
            return "validationPage";
        } else {
            model.addAttribute("validationResult", false);
            return "validationPage";
        }
    }
}

package com.library.controller;

import com.library.user.service.UserService;
import com.library.user.model.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class PasswordResetController {
    private final UserService userService;

    @Autowired
    public PasswordResetController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/resetpassword")
    public String passwordReset() {
        return "library/resetpassword";
    }

    @PostMapping("/resetpassword/process")
    @ResponseBody
    public Map<String, Object> processPasswordReset(@RequestBody UserVO vo) {
        Map<String, Object> response = new HashMap<>();

        try {
            if(vo.getUserId() == null || vo.getUserId().isEmpty() ||
                    vo.getBirth() == null || !vo.getBirth().matches("\\d{4}-\\d{2}-\\d{2}")) {
                response.put("success", false);
                return response;
            }

            // SelectSearchUser 메서드를 사용
            UserVO user = userService.SelectSearchUser(vo);  // 대문자 S에 주의!

            if (user != null && vo.getBirth().equals(user.getBirth())) {
                String tempPassword = UUID.randomUUID().toString().substring(0, 8);
                user.setPassword(tempPassword);
                userService.updatePassword(user);

                response.put("success", true);
                response.put("tempPassword", tempPassword);
            } else {
                response.put("success", false);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.put("success", false);
            response.put("message", e.getMessage());
        }

        return response;
    }
}
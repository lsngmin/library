package com.library.user;

import com.library.domain.User;
import com.library.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;  // UserService를 통해 insertUser 호출

    @GetMapping("/login")
    public String getLoginView() {
        UserVO vo = new UserVO();
        vo.setUserId(101);  // 예시 userId
        vo.setPassword("t");  // 예시 password
        vo.setEmail("@@");  // 예시 email
        vo.setPhone("010");  // 예시 phone
        vo.setBirth("1");  // 예시 birth
        vo.setName("sss");  // 예시 name

        // insertUser 메서드 호출
        userService.insertUser(vo);
        return "login";  // 로그인 페이지로 이동
    }
}

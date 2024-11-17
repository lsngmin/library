package com.library.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    @GetMapping("/tt")
    public String getLoginView() {
        UserVO vo = new UserVO();
        vo.setUserId("101");  // 예시 userId
        vo.setPassword("t");  // 예시 password
        vo.setEmail("@@");  // 예시 email
        vo.setPhone("010");  // 예시 phone
        vo.setBirth("1");  // 예시 birth
        vo.setName("sss");  // 예시 name

        return "tt";  // 로그인 페이지로 이동
    }
}

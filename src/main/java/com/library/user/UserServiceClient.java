package com.library.user;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class UserServiceClient {
    public static void main(String[] args) {
        // 1. Spring 컨테이너를 구동한다.
        AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");

        // 2. Spring 컨테이너로부터 BoardServiceImpl 객체를 Lookup한다.
        UserService userService = (UserService) container.getBean("userService");
        // 3. 글 등록 기능 테스트
        UserVO vo = new UserVO();
        vo.setUserId(100);
        vo.setPassword("t");
        vo.setBirth("1");
        vo.setEmail("@@");
        vo.setName("sss");
        vo.setPhone("010");
        userService.insertUser(vo);
        // 5. Spring 컨테이너 종료
        container.close();
    }
}
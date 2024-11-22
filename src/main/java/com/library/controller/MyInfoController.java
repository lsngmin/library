package com.library.controller;

import com.library.rental.model.RentalVO;
import com.library.rental.service.RentalService;
import com.library.user.service.UserService;
import com.library.user.model.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.management.monitor.StringMonitor;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class MyInfoController {

    @Autowired
    private UserService userService;
    @Autowired
    private RentalService rentalService;
    @GetMapping("/myInfo")
    public String showMyInfo(HttpSession session, Model model) {

        // 세션에서 로그인된 사용자 객체 가져오기
        UserVO user = (UserVO) session.getAttribute("user");

        RentalVO vo = new RentalVO();
        vo.setRentalUserId(user.getUserId());
        List<Map<String, Object>> rental = rentalService.selectRentalList(vo);
        session.setAttribute("rental", rental);
        return "myInfo"; // 내 정보 뷰
    }
}

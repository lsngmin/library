package com.library.admin.controller;

import com.library.user.model.UserVO;
import com.library.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@ResponseBody
public class AdminOverDueClearController {
    @Autowired
    private UserService userService;

    @PostMapping("/admin/clearoverdue")
    public Map<String, String> ClearOverDue(@RequestBody Map<String, String> request) {
        Map<String, String> response = new HashMap<String, String>();
        UserVO vo = new UserVO();
        vo.setUserId(request.get("userId"));
        vo = userService.SelectSearchUser(vo);
        System.out.println(vo.getOverDueDate());

        if (Integer.parseInt(vo.getOverDueDate()) > 0) {
            userService.updateOverDueDate(vo);
            response.put("success", "연체가 해제되었습니다.");
        } else {
            response.put("error", "연체중이 아닌 회원입니다.");
        }
        return response;
    }
}

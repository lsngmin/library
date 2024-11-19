package com.library.admin.controller;

import com.library.user.service.UserService;
import com.library.user.model.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class AdminUserSearchProcessController {
    @Autowired
    private UserService userService;

    @PostMapping("/admindashboard/searchUser")
    @ResponseBody
    public Map<String, String> searchUser(@RequestBody Map<String, String> request) {
        String userId = request.get("userId");
        UserVO vo = new UserVO();
        vo.setUserId(userId);

        UserVO user = userService.SelectSearchUser(vo);

        Map<String, String> result = new HashMap<>();
        if (user != null) {
            result.put("name", user.getName());
            result.put("colleges", user.getColleges());
            result.put("departments", user.getDepartments());
            result.put("rentalAvailable", String.valueOf(user.getRentalAvailable()));
            result.put("status", user.getStatus());
            result.put("reason", user.getReason());
        } else {
            result.put("error", "error");
        }
        return result;
    }
}
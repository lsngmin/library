package com.library.admin.controller;

import com.library.user.model.UserVO;
import com.library.user.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
public class UserInfoController {
    private static final Logger logger = LoggerFactory.getLogger(UserInfoController.class);
    private final UserService userService;

    public UserInfoController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/userinfo")
    public String getUserInfo(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            Model model) {
        try {
            int totalUsers = userService.getTotalUser();
            List<UserVO> users = userService.getUserList(page, size);

            logger.info("Total users: {}", totalUsers);
            logger.info("Users: {}", users);
            logger.info("Current page: {}", page);
            logger.info("View name: admin/userinfo");

            model.addAttribute("users", users);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", (int) Math.ceil((double) totalUsers / size));
            model.addAttribute("totalUsers", totalUsers);

            return "admin/userinfo";
        } catch (Exception e) {
            logger.error("Error in getUserInfo", e);
            throw e;
        }
    }

    @GetMapping("/admin/userinfo/detail")
    @ResponseBody
    public UserVO getUserDetail(@RequestParam String userId) {
        UserVO vo = new UserVO();
        vo.setUserId(userId);
        return userService.SelectSearchUser(vo);
    }

}

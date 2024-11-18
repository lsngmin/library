package com.library.admin.controller;

import com.library.admin.model.AdminVO;
import com.library.model.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

@Controller
public class AdminDashBoardController {
    @Autowired
    private UserService userService;
    @GetMapping("/admindashboard")
    public String getAdminDashboard(HttpSession session, Model model) {

        AdminVO adminUser = (AdminVO) session.getAttribute("adminUser");
        System.out.println(adminUser);
        if(adminUser == null) {
            return "redirect:admin";
        } else {
            int totalUserCount = userService.getTotalUser();
            model.addAttribute("totalUserCount", totalUserCount);
            return "admin/admindashboard";
        }
    }
}

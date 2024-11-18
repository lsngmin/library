package com.library.admin.controller;

import com.library.admin.model.AdminService;
import com.library.admin.model.AdminVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class AdminLoginController {
    @Autowired
    private AdminService adminService;
    @GetMapping("/admin")
    public String getAdminLogin(@ModelAttribute("adminUser") AdminVO vo,
                                Model model) {
        return "admin";
    }
    @PostMapping("/admin")
    public String postAdminLoginProcess(AdminVO vo, HttpSession session) {
        if(vo.getAdminId() == null || vo.getAdminId().equals("")) {
            System.out.println(vo.getAdminId());
            throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다,");
        }
        AdminVO user = adminService.selectAdmin(vo);
        if(user != null && user.getAdminPassword().equals(vo.getAdminPassword())) {
            session.setAttribute("adminUser", user);
            return "admindashboard";
        } else {
            return "admin";
        }
    }
}

package com.library.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class BookApplyListController {

    @GetMapping("/bookapplylist")
    public String bookApplyList(Model model) {
        // 필요하면 데이터를 추가로 처리하거나 모델에 데이터를 추가
        // model.addAttribute("attributeName", value);

        return "admin/bookapplylist"; // bookapplylist.jsp로 이동
    }
}
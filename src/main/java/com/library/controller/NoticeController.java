package com.library.controller;

import com.library.noticeBoard.model.NoticeBoardVO;
import com.library.noticeBoard.service.NoticeBoardService;
import com.library.user.model.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class NoticeController {
    @Autowired
    private NoticeBoardService noticeBoardService;

    @GetMapping("/notice")
    public String notice(HttpSession session, Model model) {
        // 세션에서 사용자 정보 가져오기
        UserVO user = (UserVO) session.getAttribute("user");
        model.addAttribute("user", user); // 사용자 정보 전달
        return "library/notice";

    }
    @GetMapping("/noticeDetail")
    public String noticeDetail(String cnt, Model model) {
        // cnt로 공지사항 정보를 조회
        NoticeBoardVO notice = noticeBoardService.getNoticeBoardByCnt(cnt);
        model.addAttribute("notice", notice);
        return "library/noticeDetail";
    }
}

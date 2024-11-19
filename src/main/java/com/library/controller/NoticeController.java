package com.library.controller;

import com.library.notice.model.NoticeVO;
import com.library.notice.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class NoticeController {
    @Autowired
    private NoticeService noticeService;


    @GetMapping("/notice")
    public String getNoticeList(Model model) {
        // 공지사항 리스트 가져오기
        List<NoticeVO> noticeList = noticeService.selectAllNotices();
        model.addAttribute("noticeList", noticeList);
        return "notice";
    }
}

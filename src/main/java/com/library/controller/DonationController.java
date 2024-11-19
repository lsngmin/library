package com.library.donation.controller;

import com.library.donation.model.DonationVO;
import com.library.donation.service.DonationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DonationController {

    @Autowired
    private DonationService donationService;

    @GetMapping("/donation")
    public String donation(Model model, HttpSession session) {
        // 세션에서 사용자 ID 확인
        String userId = (String) session.getAttribute("userId");

        if (userId == null || userId.isEmpty()) {
            // 세션에 userId가 없으면 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }

        // 사용자의 기증 목록 가져오기
        List<DonationVO> donations = donationService.selectDonationsByUser(userId);
        model.addAttribute("donations", donations);

        return "donation"; // donation.jsp로 이동
    }
}

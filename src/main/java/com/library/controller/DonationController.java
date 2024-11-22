    package com.library.controller;

    import com.library.user.model.UserVO;
    import org.springframework.stereotype.Controller;
    import org.springframework.ui.Model;
    import org.springframework.web.bind.annotation.GetMapping;

    import javax.servlet.http.HttpSession;

    @Controller
    public class DonationController {

        @GetMapping("/donation")
        public String donationPage(HttpSession session, Model model) {
            // 세션에서 사용자 정보 가져오기
            UserVO user = (UserVO) session.getAttribute("user");
            if (user == null) {
                // 비로그인 상태일 경우 로그인 페이지로 리다이렉션
                return "redirect:/login";
            }

            // 로그인 상태이면 사용자 정보를 모델에 추가
            model.addAttribute("user", user);
            return "donation"; // JSP 페이지 이름
        }
    }
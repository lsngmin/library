    package com.library.controller;

    import com.library.donationBook.model.DonationBookVO;
    import com.library.donationBook.service.DonationBookService;
    import com.library.user.model.UserVO;
    import com.sun.xml.bind.v2.TODO;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Controller;
    import org.springframework.ui.Model;
    import org.springframework.web.bind.annotation.GetMapping;
    import org.springframework.web.bind.annotation.PostMapping;
    import org.springframework.web.bind.annotation.RequestParam;
    import org.springframework.web.bind.annotation.SessionAttribute;
    import org.springframework.web.servlet.ModelAndView;

    import javax.servlet.http.HttpSession;
    import java.text.SimpleDateFormat;
    import java.util.Date;
    import java.util.UUID;

    @Controller
    public class DonationController {
        @Autowired
        private DonationBookService donationBookService;

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
            return "myinfo/donation"; // JSP 페이지 이름
        }
        @PostMapping("/submitDonation")
        public ModelAndView submitDonation(@SessionAttribute("userId") String userId,
                                           @RequestParam("donationUserName") String donationUserName,
                                           @RequestParam("donationUserPhone") String donationUserPhone,
                                           @RequestParam("donationUserEmail") String donationUserEmail,
                                           @RequestParam("donationCategory") String donationCategory,
                                           @RequestParam("donationBookName") String donationBookName,
                                           @RequestParam("donationBookPublisher") String donationBookPublisher,
                                           @RequestParam("donationBookAuthor") String donationBookAuthor,
                                           @RequestParam("donationReason") String donationReason
                                           ) {
            ModelAndView mav = new ModelAndView();
            try {

                DonationBookVO donationBook = new DonationBookVO();
                donationBook.setDonationUserName(donationUserName);
                donationBook.setDonationUserPhone(donationUserPhone);
                donationBook.setDonationUserEmail(donationUserEmail);
                donationBook.setDonationCategory(donationCategory);
                donationBook.setDonationBookName(donationBookName);
                donationBook.setDonationBookPubliher(donationBookPublisher);
                donationBook.setDonationReason(donationReason);
                donationBook.setDonationBookAuthor(donationBookAuthor);

                Date now = new Date();
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String formattedDate = formatter.format(now);
                donationBook.setDonationDate(formattedDate);

                donationBook.setDonationCode(UUID.randomUUID().toString().replace("-", "").substring(0, 4));
                donationBook.setDonationUserId(userId);

                donationBookService.insertDonationBook(donationBook);

                mav.setViewName("/myinfo/donation");
                mav.addObject("success", "기증 신청이 성공적으로 완료 되었습니다.");
                return mav;
            } catch (Exception e) {
                mav.setViewName("/myinfo/donation");
                mav.addObject("success", e);
                return mav;
            }









            //완료시

        }
    }
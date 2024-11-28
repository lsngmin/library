package com.library.controller;
import com.library.user.model.UserVO;
import com.library.wishBook.model.WishBookVO;
import com.library.wishBook.service.WishBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class wishbookController {

    @Autowired
    private WishBookService wishBookService;

    @GetMapping("/wishbookstatus")
    public String wishbookstatus(HttpSession session, Model model) {
        UserVO user = (UserVO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        // 현재 로그인한 사용자의 희망도서 신청 내역 조회
        List<WishBookVO> wishBookList = wishBookService.getWishBooksByUserId(user.getUserId());
        model.addAttribute("wishBookList", wishBookList);

        return "/myinfo/wishbookstatus";
    }

    @PostMapping("/cancelWishBook")
    @ResponseBody
    public Map<String, Object> cancelWishBook(
            @RequestBody Map<String, String> request,
            @SessionAttribute("user") UserVO user
    ) {
        Map<String, Object> response = new HashMap<>();
        try {
            String wishCode = request.get("wishCode");
            WishBookVO wishBook = wishBookService.getBookWishByCode(wishCode);

            // 본인 신청한 것인지, 상태가 '신청완료'인지 확인
            if(wishBook != null &&
                    wishBook.getWishUserId().equals(user.getUserId()) &&
                    wishBook.getWishStatus().equals("접수중")) {

                wishBook.setWishStatus("신청취소"); // 상태를 '신청취소'로 변경
                wishBookService.updateBookWish(wishBook); // 삭제가 아닌 업데이트로 변경

                response.put("success", true);
            } else {
                response.put("success", false);
            }
        } catch(Exception e) {
            response.put("success", false);
        }
        return response;
    }

}
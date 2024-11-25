package com.library.controller;

import com.library.user.model.UserVO;
import com.library.wishBook.model.WishBookVO;
import com.library.wishBook.service.WishBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.UUID;

@Controller
public class WishbookapplyController {

    @Autowired
    private WishBookService wishBookService;

    @GetMapping("/wishbookapply")
    public String wishbookapply(HttpSession session, Model model) {
        UserVO user = (UserVO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("user", user);
        return "library/wishbookapply";
    }

    @PostMapping("/requestBook")
    public String requestBook(
            @SessionAttribute("user") UserVO user,
            @RequestParam(value = "book-title", required = true) String bookTitle,
            @RequestParam(value = "author", required = true) String author,
            @RequestParam(value = "publisher", required = true) String publisher,
            @RequestParam(value = "publishday", required = false, defaultValue = "") String publishDay,
            @RequestParam(value = "price", required = false, defaultValue = "") String price,
            @RequestParam(value = "name", required = false, defaultValue = "") String name,
            @RequestParam(value = "number", required = false, defaultValue = "") String number,
            RedirectAttributes redirectAttributes
    ) {
        try {
            // 필수 입력값 검증
            if(bookTitle.trim().isEmpty() || author.trim().isEmpty() || publisher.trim().isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "신청자료명, 저자, 출판사는 필수 입력 항목입니다.");
                return "redirect:/wishbookapply";
            }

            WishBookVO wishBook = new WishBookVO();
            wishBook.setWishCode(UUID.randomUUID().toString().replace("-", "").substring(0, 4));
            wishBook.setWishStatus("신청완료");
            wishBook.setWishUserId(user.getUserId());
            wishBook.setWishBookName(new String(bookTitle.getBytes("8859_1"), "UTF-8"));
            wishBook.setWishBookPublisher(new String(publisher.getBytes("8859_1"), "UTF-8"));
            wishBook.setWishBookAuthor(new String(author.getBytes("8859_1"), "UTF-8"));

            if(!publishDay.isEmpty()) {
                wishBook.setWishBookPublishDate(new String(publishDay.getBytes("8859_1"), "UTF-8"));
            }
            wishBook.setWishBookPrice(price);
            if(!name.isEmpty()) {
                wishBook.setWishUserName(new String(name.getBytes("8859_1"), "UTF-8"));
            }
            wishBook.setWishUserPhone(number);

            wishBookService.insertBookWish(wishBook);

            redirectAttributes.addFlashAttribute("message", "희망도서 신청이 완료되었습니다.");
            return "redirect:/wishbookapply";

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "희망도서 신청 중 오류가 발생했습니다.");
            return "redirect:/wishbookapply";
        }
    }
}
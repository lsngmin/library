package com.library.admin.controller;

import com.library.wishBook.model.WishBookVO;
import com.library.wishBook.service.WishBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class BookApplyListController {

    @Autowired
    private WishBookService wishBookService;

    @GetMapping("/bookapplylist")
    public String bookApplyList(Model model) {
        List<WishBookVO> wishBookList = wishBookService.getAllBookWishes();
        System.out.println("Fetched wishBookList size: " + wishBookList.size());  // 로그 추가
        for(WishBookVO book : wishBookList) {
            System.out.println("Book: " + book.getWishBookName());  // 각 도서 정보 출력
        }
        model.addAttribute("wishBookList", wishBookList);
        return "admin/bookapplylist";
    }

    // 희망도서 상태 업데이트
    @PostMapping("/updateWishBookStatus")
    @ResponseBody
    public Map<String, Object> updateWishBookStatus(@RequestBody Map<String, String> request) {
        Map<String, Object> response = new HashMap<>();
        try {
            String wishCode = request.get("wishCode");
            String newStatus = request.get("status");

            WishBookVO wishBook = wishBookService.getBookWishByCode(wishCode);
            if(wishBook != null) {
                wishBook.setWishStatus(newStatus);
                wishBookService.updateBookWish(wishBook);
                response.put("success", true);
            } else {
                response.put("success", false);
                response.put("message", "해당 도서를 찾을 수 없습니다.");
            }
        } catch(Exception e) {
            response.put("success", false);
            response.put("message", "처리 중 오류가 발생했습니다.");
            e.printStackTrace();
        }
        return response;
    }

    @GetMapping("/getWishBookDetails/{wishCode}")
    @ResponseBody
    public ResponseEntity<WishBookVO> getWishBookDetails(@PathVariable String wishCode) {
        try {
            System.out.println("Received request for wishCode: " + wishCode);
            WishBookVO wishBook = wishBookService.getBookWishByCode(wishCode);

            if (wishBook == null) {
                return ResponseEntity.notFound().build();
            }

            return ResponseEntity.ok(wishBook);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }


}
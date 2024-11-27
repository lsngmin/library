package com.library.admin.controller;

import com.library.donationBook.model.DonationBookVO;
import com.library.donationBook.service.DonationBookService;
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
    @Autowired
    private DonationBookService donationBookService;  // 추가

    @GetMapping("/bookapplylist")
    public String bookApplyList(Model model) {
        List<DonationBookVO> donationList;  // 여기서 변수 선언
        try {
            // 기증도서 목록 조회
            donationList = donationBookService.getAllDonationBooks();
            System.out.println("조회된 기증도서 목록: " + donationList);
            model.addAttribute("donationList", donationList);

            // 희망도서 목록 조회 (기존 코드 유지)
            List<WishBookVO> wishBookList = wishBookService.getAllBookWishes();
            model.addAttribute("wishBookList", wishBookList);

            return "admin/bookapplylist";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
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
            if (wishBook != null) {
                wishBook.setWishStatus(newStatus);
                wishBookService.updateBookWish(wishBook);
                response.put("success", true);
            } else {
                response.put("success", false);
                response.put("message", "해당 도서를 찾을 수 없습니다.");
            }
        } catch (Exception e) {
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

    // 기증도서 상세정보 조회 추가
    // 기증도서 상세 정보 조회
    @GetMapping("/getDonationBookDetails/{donationCode}")
    @ResponseBody
    public ResponseEntity<DonationBookVO> getDonationBookDetails(@PathVariable String donationCode) {
        System.out.println("Received request for donationCode: " + donationCode);
        try {
            DonationBookVO donationBook = donationBookService.getDonationBookByCode(donationCode);
            System.out.println("Found donation book: " + donationBook);
            if (donationBook != null) {
                return ResponseEntity.ok(donationBook);
            }
            return ResponseEntity.notFound().build();
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // 기증도서 상태 업데이트
    @PostMapping("/updateDonationBookStatus")
    @ResponseBody
    public ResponseEntity<?> updateDonationBookStatus(@RequestBody Map<String, String> request) {
        try {
            String donationCode = request.get("donationCode");
            String newStatus = request.get("status");

            DonationBookVO donation = donationBookService.getDonationBookByCode(donationCode);
            if (donation != null) {
                donation.setDonationStatus(newStatus);
                donationBookService.updateDonationBook(donation);
                return ResponseEntity.ok().body(Map.of("success", true));
            }
            return ResponseEntity.notFound().build();
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("success", false, "message", e.getMessage()));
        }
    }
}
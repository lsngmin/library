package com.library.admin.controller;

import com.library.book.service.BookService;
import com.library.rental.service.RentalService;
import com.library.rental.model.RentalVO;
import com.library.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class AdminRentalExecutionController {
    @Autowired
    private RentalService rentalService;
    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookService;

    @PostMapping("/admin/rentalexecute")
    @ResponseBody
    public Map<String, String> rentalExecute(@RequestBody Map<String, String> request) {
        Map<String, String> response = new HashMap<>();

        // 디버깅 로그
        System.out.println("Rental Execute Request Received: " + request);

        String userId = request.get("userId");
        String bookCode = request.get("bookCode");

        if (userId == null || userId.trim().isEmpty() || bookCode == null || bookCode.trim().isEmpty()) {
            response.put("error", "학번과 도서 코드를 입력해 주세요.");
            return response;
        }

        try {
            synchronized (this) { // 중복 실행 방지
                // 대출 처리 로직
                RentalVO rental = new RentalVO();
                rental.setRentalBookCode(bookCode);
                rental.setRentalUserId(userId);
                rental.setRentalStartDate(request.getOrDefault("rentalStartDate", ""));
                rental.setRentalEndDate(request.getOrDefault("rentalEndDate", ""));
                rental.setRentalCode(UUID.randomUUID().toString().replace("-", "").substring(0, 8));

                // 로그 추가
                System.out.println("Inserting rental record...");
                rentalService.insertRental(rental);

                // borrowCount 증가
                System.out.println("Incrementing borrow count...");
                bookService.incrementBorrowCount(bookCode);

                // 사용자 대출 가능 수량 업데이트
                System.out.println("Updating user rental availability...");
                userService.updateRentalAvailableM(userId);

                response.put("success", "대출이 성공적으로 실행되었습니다!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.put("error", "대출 실행 중 서버 오류가 발생했습니다.");
        }
        return response;
    }


}

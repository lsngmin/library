package com.library.controller;

import com.library.book.service.BookService;
import com.library.rental.model.RentalVO;
import com.library.rental.service.RentalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class MyInfoRentalExtensionController {
    @Autowired
    private RentalService rentalService;
    @Autowired
    private BookService bookService;
    @PostMapping("/user/myinfo/rentalextension")
    public Map<String, String> userRentalExtension(@RequestBody Map<String, String> request) {
        String userId   = request.get("userId");
        String bookCode = bookService.selectBookCodeByBookName(request.get("bookName"));

        int rentalExtension = rentalService.selectRentalExtensionByUserIdAndBookCode(
                userId, bookCode
                );

        Map<String, String> response = new HashMap<>();
        if (rentalExtension == 1) {
            response.put("msg", "해당 도서의 연장이 이미 반영되었습니다.");
        } else {
            rentalService.updateRentalExtensionByUserIdAndBookCode(userId, bookCode);
            response.put("msg", "해당 도서의 연장 신청이 반영되었습니다.");
        }
        return response;
    }
}

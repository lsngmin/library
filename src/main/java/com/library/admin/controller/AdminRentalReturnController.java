package com.library.admin.controller;

import com.library.rental.model.RentalDAO;
import com.library.rental.service.RentalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@ResponseBody
public class AdminRentalReturnController {
    @Autowired
    private RentalService rentalService;
    @PostMapping("/admin/rentalReturn")
    public Map<String, String> rentalReturn(@RequestBody List<Map<String, String>> request) {
        Map<String, String> response = new HashMap<>();
        try {
            for(Map<String, String> book : request) {
                String userId = book.get("userId");
                String bookName = book.get("bookName");
                rentalService.deleteRental(userId, bookName);
            }
            response.put("success", "반납이 성공적으로 실행되었습니다.");
            System.out.println(response);
            return response;
        } catch (Exception e) {
            response.put("error", "반납 중 에러가 발생했습니다.");
            return response;
        }
    }
}

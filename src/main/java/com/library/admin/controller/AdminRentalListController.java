package com.library.admin.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.library.book.service.BookService;
import com.library.rental.model.RentalVO;
import com.library.rental.service.RentalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class AdminRentalListController {
    @Autowired
    private RentalService rentalService;
    @PostMapping("/admin/rentalList")
    @ResponseBody
    public List<Map<String, Object>> rentalReturn(@RequestBody(required = false) Map<String,String> request) throws Exception {
        //Map<String,String> response = new HashMap<>();
        RentalVO vo = new RentalVO();
        vo.setRentalUserId(request.get("userId"));
        return rentalService.selectRentalList(vo);

    }

    @PostMapping("/admin/userRentalList")
    @ResponseBody
    public List<Map<String, Object>> getUserRentalList(@RequestBody(required = false) Map<String,String> request) throws Exception {
        RentalVO vo = new RentalVO();
        vo.setRentalUserId(request.get("userId"));
        List<Map<String, Object>> rentalList = rentalService.selectRentalList(vo);

        // 필요한 정보만 포함하도록 데이터 변환
        List<Map<String, Object>> formattedList = new ArrayList<>();
        for (Map<String, Object> rental : rentalList) {
            Map<String, Object> formattedRental = new HashMap<>();
            formattedRental.put("rentalCode", rental.get("rentalCode")); // 대출 코드
            formattedRental.put("bookName", rental.get("bookName")); // 도서명
            // 대출 기간
            formattedRental.put("rentalStartDate", rental.get("rentalStartDate"));
            formattedRental.put("rentalEndDate", rental.get("rentalEndDate"));
            // 상태
            String status = calculateRentalStatus(rental.get("rentalEndDate"), rental.get("rentalStatus"));
            formattedRental.put("rentalStatus", status);

            formattedList.add(formattedRental);
        }

        return formattedList;
    }

    // 대출 상태 계산 메서드
    private String calculateRentalStatus(Object endDateObj, Object statusObj) {
        try {
            String endDateStr = String.valueOf(endDateObj);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date endDate = sdf.parse(endDateStr);
            Date today = new Date();

            String status = String.valueOf(statusObj);

            if ("2".equals(status)) {
                return "연장";
            } else if (endDate.before(today)) {
                return "연체중";
            } else {
                return "정상";
            }
        } catch (Exception e) {
            return "정상"; // 기본값
        }
    }

}


package com.library.admin.controller;

import com.library.rental.service.RentalService;
import com.library.rental.model.RentalVO;
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
    @PostMapping("/admin/rentalexecute")
    @ResponseBody
    public Map<String, String> rentalExecute(@RequestBody(required = false) Map<String, String> request) {
        Map<String, String> response = new HashMap<>();
        if(request.get("name").equals("")|| request.get("bookName").equals("")) {
            response.put("error" , "사용자 또는 도서 정보가 누락되었습니다.");
            return response;
        } else if (request.get("status").equals("불가능")) {
            response.put("error", "대출 잔여 수량 또는 연체 여부를 확인해 주세요.");
            return response;
        }
        RentalVO rental = new RentalVO();
        rental.setRentalBookCode(request.get("bookCode"));
        rental.setRentalUserId(request.get("userId"));
        rental.setRentalStartDate(request.get("rentalStartDate"));
        rental.setRentalEndDate(request.get("rentalEndDate"));
        rental.setRentalCode(UUID.randomUUID().toString().replace("-", "").substring(0, 4));

        rentalService.insertRental(rental);
        response.put("success", "대출이 성공적으로 실행되었습니다!");
        return response;
    }
}

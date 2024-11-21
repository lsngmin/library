package com.library.admin.controller;

import com.library.rental.service.RentalService;
import com.library.rental.model.RentalVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;
import java.util.UUID;

@Controller
public class AdminRentalExecutionController {
    @Autowired
    private RentalService rentalService;
    @PostMapping("/admin/rentalexecute")
    @ResponseBody
    public void rentalExecute(@RequestBody Map<String, String> request) {
        RentalVO rental = new RentalVO();

        rental.setRentalBookCode(request.get("bookCode"));
        rental.setRentalUserId(request.get("userId"));
        rental.setRentalStartDate(request.get("rentalStartDate"));
        rental.setRentalEndDate(request.get("rentalEndDate"));
        rental.setRentalCode(UUID.randomUUID().toString().replace("-", "").substring(0, 4));

        rentalService.insertRental(rental);
    }
}

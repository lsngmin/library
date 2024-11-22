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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

}

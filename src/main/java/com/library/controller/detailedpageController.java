package com.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class detailedpageController {
    @GetMapping("/bookdetails")
    public String bookdetails() {
        return "bookdetails";
    }
}
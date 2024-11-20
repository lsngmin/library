package com.library.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class wishbookController {
    @GetMapping("/wishbookstatus")
    public String wishbookstatus() {
        return "wishbookstatus";
    }
}

package com.library.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PasswordchangeController {
    @GetMapping("/passwordchange")
    public String passwordchange() {
        return "passwordchange";
    }
}



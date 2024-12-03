package com.library.admin.controller;

import com.library.admin.model.AdminVO;
import com.library.book.service.BookService;
import com.library.rental.service.RentalService;
import com.library.user.service.UserService;
import com.library.wishBook.service.WishBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class AdminDashBoardController {
    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookService;
    @Autowired
    private WishBookService wishBookService;
    @Autowired
    private RentalService rentalService;
    @GetMapping("/admindashboard")
    public String getAdminDashboard(HttpSession session, Model model) {

        AdminVO adminUser = (AdminVO) session.getAttribute("adminUser");
        System.out.println(adminUser);
        if(adminUser == null) {
            return "redirect:admin";
        } else {
            int totalUserCount = userService.getTotalUser();
            int totalBookCount = bookService.selectTotalBook();
            int totalWishBookList = wishBookService.selectCountTotal();
            int totalRentalBookList = rentalService.selectTotalRental();
            model.addAttribute("totalUserCount", totalUserCount);
            model.addAttribute("totalBookCount", totalBookCount);
            model.addAttribute("totalWishBookList", totalWishBookList);
            model.addAttribute("totalRentalBookList", totalRentalBookList);


            return "admin/admindashboard";
        }
    }
}

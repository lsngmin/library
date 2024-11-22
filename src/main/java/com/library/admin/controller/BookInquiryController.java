package com.library.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.library.book.model.BookVO;
import com.library.book.service.BookService;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@Controller
public class BookInquiryController {

    private final BookService bookService;

    @Autowired
    public BookInquiryController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/bookinquiry")
    public String bookList(Model model) {
        List<BookVO> bookList = bookService.getBookList();
        model.addAttribute("bookList", bookList);
        return "admin/bookinquiry";
    }

    @GetMapping("/books/get/{bookCode}")
    @ResponseBody
    public ResponseEntity<?> getBookDetail(@PathVariable String bookCode) {
        try {
            System.out.println("=== 도서 상세 정보 조회 시작 ===");
            System.out.println("요청된 bookCode: " + bookCode);

            BookVO vo = new BookVO();
            vo.setBookCode(bookCode);

            // selectBookDetail 메서드 사용
            BookVO book = bookService.selectBookDetail(vo);

            System.out.println("조회된 도서 정보: " + (book != null ? book.toString() : "null"));

            if (book != null) {
                Map<String, Object> response = new HashMap<>();
                response.put("bookCode", book.getBookCode());
                response.put("bookName", book.getBookName());
                response.put("bookAuthor", book.getBookAuthor());
                response.put("bookPublisher", book.getBookPublisher());
                response.put("bookPublishDate", book.getBookPublishDate());
                response.put("bookPrice", book.getBookPrice());
                response.put("bookPage", book.getBookPage());
                response.put("bookLocation", book.getBookLocation());
                response.put("bookCategory", book.getBookCategory());
                response.put("bookStatus", book.getBookStatus());
                response.put("bookDecription", book.getBookDecription());
                response.put("bookQuantity", book.getBookQuantity());
                response.put("bookImageSrc", book.getBookImageSrc());

                return ResponseEntity.ok()
                        .contentType(MediaType.APPLICATION_JSON)
                        .body(response);
            } else {
                return ResponseEntity.status(404)
                        .body(Map.of("message", "도서를 찾을 수 없습니다."));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500)
                    .body(Map.of("message", "서버 오류: " + e.getMessage()));
        }
    }

    @PostMapping("/books/update")
    @ResponseBody
    public ResponseEntity<?> updateBook(
            @RequestParam(value = "bookImageSrc", required = false) MultipartFile file,
            HttpServletRequest request) {
        try {
            BookVO vo = new BookVO();

            // 받은 파라미터 출력
            System.out.println("받은 파라미터들:");
            request.getParameterMap().forEach((key, value) -> {
                System.out.println(key + ": " + String.join(", ", value));
            });

            vo.setBookCode(request.getParameter("bookCode"));
            vo.setBookName(request.getParameter("bookName"));
            vo.setBookAuthor(request.getParameter("bookAuthor"));
            vo.setBookPublisher(request.getParameter("bookPublisher"));
            vo.setBookPublishDate(request.getParameter("bookPublishDate"));
            vo.setBookPrice(request.getParameter("bookPrice"));
            vo.setBookPage(request.getParameter("bookPage"));
            vo.setBookLocation(request.getParameter("bookLocation"));
            vo.setBookCategory(request.getParameter("bookCategory"));
            vo.setBookStatus(request.getParameter("bookStatus"));
            vo.setBookDecription(request.getParameter("bookDecription"));
            vo.setBookQuantity(request.getParameter("bookQuantity"));

            // 파일 정보 출력
            if (file != null) {
                System.out.println("파일 정보: " + file.getOriginalFilename() + ", 크기: " + file.getSize());
            }

            if (file != null && !file.isEmpty()) {
                String uploadPath = request.getSession().getServletContext().getRealPath("/resources/img/");
                System.out.println("업로드 경로: " + uploadPath);

                String originalFileName = file.getOriginalFilename();
                File saveFile = new File(uploadPath, originalFileName);
                file.transferTo(saveFile);
                vo.setBookImageSrc("/img/" + originalFileName);
            }

            System.out.println("최종 업데이트할 도서 정보: " + vo.toString());
            bookService.updateBook(vo);

            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("message", "도서 정보가 성공적으로 수정되었습니다.");
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            System.out.println("수정 중 에러 발생: " + e.getMessage());
            e.printStackTrace();

            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", "도서 수정 실패: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
}
/*
package com.library.service.impl;

import com.library.domain.dto.BookRegistrationDTO;
import com.library.domain.dto.BookUpdateDTO;
import com.library.service.BookService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BookServiceImpl implements BookService {
    @Override
    public void registerBook(BookRegistrationDTO bookDTO, MultipartFile coverImage) {
        if (bookDTO.getBookTitle() == null || bookDTO.getBookTitle().trim().isEmpty()) {
            throw new IllegalArgumentException("도서명은 필수입니다.");
        }

        if (coverImage != null && !coverImage.isEmpty()) {

        }
    }

    // 도서 정보 조회
    @Override
    public BookUpdateDTO getBookById(Long id) {
        return new BookUpdateDTO();
    }

    // 도서 정보 수정
    @Override
    public void updateBook(BookUpdateDTO bookDTO, MultipartFile coverImage) {
        if (bookDTO.getBookTitle() == null || bookDTO.getBookTitle().trim().isEmpty()) {
            throw new IllegalArgumentException("도서명은 필수입니다.");
        }

        if (coverImage != null && !coverImage.isEmpty()) {

        }

    }
}
 */
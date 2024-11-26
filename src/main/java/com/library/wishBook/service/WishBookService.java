package com.library.wishBook.service;

import com.library.wishBook.model.WishBookVO;

import java.util.List;

public interface WishBookService {
    void insertBookWish(WishBookVO vo);

    WishBookVO getBookWishByCode(String wishCode);

    void updateBookWish(WishBookVO vo);

    void deleteBookWish(String wishCode);

    List<WishBookVO> getAllBookWishes();

    List<WishBookVO> getWishBooksByUserId(String userId);
}

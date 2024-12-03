package com.library.wishBook.service;

import com.library.wishBook.model.WishBookDAO;
import com.library.wishBook.model.WishBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WishBookServiceImpl implements WishBookService {

    @Autowired
    private WishBookDAO bookWishListDAO;

    @Override
    public void insertBookWish(WishBookVO vo) {
        bookWishListDAO.insertBookWish(vo);
    }

    @Override
    public WishBookVO getBookWishByCode(String wishCode) {
        return bookWishListDAO.getBookWishByCode(wishCode);
    }

    @Override
    public void updateBookWish(WishBookVO vo) {
        bookWishListDAO.updateBookWish(vo);
    }

    @Override
    public void deleteBookWish(String wishCode) {
        bookWishListDAO.deleteBookWish(wishCode);
    }

    @Override
    public List<WishBookVO> getAllBookWishes() {
        return bookWishListDAO.getAllBookWishes();
    }

    @Override
    public List<WishBookVO> getWishBooksByUserId(String userId) {
        return bookWishListDAO.getWishBooksByUserId(userId);  // bookWishListDAO로 수정
    }

    @Override
    public int selectCountTotal() {
        return bookWishListDAO.selectCountTotal();
    }
}

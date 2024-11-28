package com.library.donationBook.service;

import com.library.donationBook.model.DonationBookVO;

import java.util.List;
import java.util.Map;

public interface DonationBookService {
    void insertDonationBook(DonationBookVO vo);

    DonationBookVO getDonationBookByCode(String donationCode);

    void updateDonationBook(DonationBookVO vo);

    void deleteDonationBook(String donationCode);

    List<DonationBookVO> getAllDonationBooks();
    List<Map<String, Object>> selectAllByUserId(String userId);
}
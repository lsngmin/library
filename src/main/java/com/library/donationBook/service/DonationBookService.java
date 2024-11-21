package com.library.donationBook.service;

import com.library.donationBook.model.DonationBookVO;

import java.util.List;

public interface DonationBookService {
    void insertDonationBook(DonationBookVO vo);

    DonationBookVO getDonationBookByCode(String donationCode);

    void updateDonationBook(DonationBookVO vo);

    void deleteDonationBook(String donationCode);

    List<DonationBookVO> getAllDonationBooks();
}
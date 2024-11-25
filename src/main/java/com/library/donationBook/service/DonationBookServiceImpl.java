package com.library.donationBook.service;

import com.library.donationBook.model.DonationBookDAO;
import com.library.donationBook.model.DonationBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DonationBookServiceImpl implements DonationBookService {

    @Autowired
    private DonationBookDAO donationBookDAO;

    @Override
    public void insertDonationBook(DonationBookVO vo) {
        donationBookDAO.insertDonationBook(vo);
    }

    @Override
    public DonationBookVO getDonationBookByCode(String donationCode) {
        return donationBookDAO.getDonationBookByCode(donationCode);
    }

    @Override
    public void updateDonationBook(DonationBookVO vo) {
        donationBookDAO.updateDonationBook(vo);
    }

    @Override
    public void deleteDonationBook(String donationCode) {
        donationBookDAO.deleteDonationBook(donationCode);
    }

    @Override
    public List<DonationBookVO> getAllDonationBooks() {
        return donationBookDAO.getAllDonationBooks();
    }

    @Override
    public List<Map<String, Object>> selectAllByUserId(String userId) {
        return donationBookDAO.selectAllByUserId(userId);
    }
}
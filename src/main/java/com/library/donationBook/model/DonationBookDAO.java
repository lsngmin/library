package com.library.donationBook.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DonationBookDAO {

    @Autowired
    private SqlSessionTemplate mybatis;

    // Insert DonationBook
    public void insertDonationBook(DonationBookVO vo) {
        mybatis.insert("DonationBookDAO.insertDonationBook", vo);
    }

    // Retrieve DonationBook by donationCode
    public DonationBookVO getDonationBookByCode(String donationCode) {
        return mybatis.selectOne("DonationBookDAO.getDonationBookByCode", donationCode);
    }

    // Update DonationBook
    public void updateDonationBook(DonationBookVO vo) {
        mybatis.update("DonationBookDAO.updateDonationBook", vo);
    }

    // Delete DonationBook
    public void deleteDonationBook(String donationCode) {
        mybatis.delete("DonationBookDAO.deleteDonationBook", donationCode);
    }

    // Retrieve All DonationBooks
    public List<DonationBookVO> getAllDonationBooks() {
        return mybatis.selectList("DonationBookDAO.getAllDonationBooks");
    }
}

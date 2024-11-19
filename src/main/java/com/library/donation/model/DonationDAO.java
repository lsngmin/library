package com.library.donation.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DonationDAO {

    @Autowired
    private SqlSessionTemplate mybatis;

    // 도서 기부 추가
    public void insertDonation(DonationVO vo) {
        mybatis.insert("DonationDAO.insertDonation", vo);
    }

    // 특정 기부 조회 (기부 코드로)
    public DonationVO selectDonation(String donationCode) {
        return mybatis.selectOne("DonationDAO.selectDonation", donationCode);
    }

    // 모든 기부 조회
    public List<DonationVO> selectAllDonations() {
        return mybatis.selectList("DonationDAO.selectAllDonations");
    }

    public List<DonationVO> selectDonationsByUser(String userId) {
        return mybatis.selectList("DonationDAO.selectDonationsByUser", userId);
    }

    // 기부 상태 수정
    public void updateDonationStatus(DonationVO vo) {
        mybatis.update("DonationDAO.updateDonationStatus", vo);
    }

    // 특정 기부 삭제
    public void deleteDonation(String donationCode) {
        mybatis.delete("DonationDAO.deleteDonation", donationCode);
    }
}

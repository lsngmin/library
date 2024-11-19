package com.library.donation.service;

import com.library.donation.model.DonationVO;

import java.util.List;

public interface DonationService {
    void insertDonation(DonationVO vo);
    DonationVO selectDonation(String donationCode);
    List<DonationVO> selectAllDonations();
    List<DonationVO> selectDonationsByUser(String userId); // 사용자별 조회
    void updateDonationStatus(DonationVO vo);
    void deleteDonation(String donationCode);
}

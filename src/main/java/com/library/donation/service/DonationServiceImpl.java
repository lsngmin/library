package com.library.donation.service;

import com.library.donation.model.DonationDAO;
import com.library.donation.model.DonationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DonationServiceImpl implements DonationService {

    @Autowired
    private DonationDAO donationDAO;

    @Override
    public void insertDonation(DonationVO vo) {
        donationDAO.insertDonation(vo);
    }

    @Override
    public DonationVO selectDonation(String donationCode) {
        return donationDAO.selectDonation(donationCode);
    }

    @Override
    public List<DonationVO> selectAllDonations() {
        return donationDAO.selectAllDonations();
    }

    @Override
    public List<DonationVO> selectDonationsByUser(String userId) {
        return donationDAO.selectDonationsByUser(userId);
    }

    @Override
    public void updateDonationStatus(DonationVO vo) {
        donationDAO.updateDonationStatus(vo);
    }

    @Override
    public void deleteDonation(String donationCode) {
        donationDAO.deleteDonation(donationCode);
    }
}

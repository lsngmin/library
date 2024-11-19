package com.library.donation.model;

import java.util.Date;

public class DonationVO {

    private String donationCode; // 기부 코드
    private String donationStatus; // 기부 상태
    private Date donationDate; // 기부 날짜
    private String donationUserId; // 기부자 ID
    private String donationUserName; // 기부자 이름
    private String donationUserPhone; // 기부자 전화번호
    private String donationUserEmail; // 기부자 이메일
    private String donationCategory; // 기부 책 카테고리
    private String donationBookName; // 기부 책 이름
    private String donationBookPublisher; // 기부 책 출판사
    private String donationBookPublishDate; // 기부 책 출판일
    private String donationReason; // 기부 사유

    // Getters and Setters
    public String getDonationCode() {
        return donationCode;
    }

    public void setDonationCode(String donationCode) {
        this.donationCode = donationCode;
    }

    public String getDonationStatus() {
        return donationStatus;
    }

    public void setDonationStatus(String donationStatus) {
        this.donationStatus = donationStatus;
    }

    public Date getDonationDate() {
        return donationDate;
    }

    public void setDonationDate(Date donationDate) {
        this.donationDate = donationDate;
    }

    public String getDonationUserId() {
        return donationUserId;
    }

    public void setDonationUserId(String donationUserId) {
        this.donationUserId = donationUserId;
    }

    public String getDonationUserName() {
        return donationUserName;
    }

    public void setDonationUserName(String donationUserName) {
        this.donationUserName = donationUserName;
    }

    public String getDonationUserPhone() {
        return donationUserPhone;
    }

    public void setDonationUserPhone(String donationUserPhone) {
        this.donationUserPhone = donationUserPhone;
    }

    public String getDonationUserEmail() {
        return donationUserEmail;
    }

    public void setDonationUserEmail(String donationUserEmail) {
        this.donationUserEmail = donationUserEmail;
    }

    public String getDonationCategory() {
        return donationCategory;
    }

    public void setDonationCategory(String donationCategory) {
        this.donationCategory = donationCategory;
    }

    public String getDonationBookName() {
        return donationBookName;
    }

    public void setDonationBookName(String donationBookName) {
        this.donationBookName = donationBookName;
    }

    public String getDonationBookPublisher() {
        return donationBookPublisher;
    }

    public void setDonationBookPublisher(String donationBookPublisher) {
        this.donationBookPublisher = donationBookPublisher;
    }

    public String getDonationBookPublishDate() {
        return donationBookPublishDate;
    }

    public void setDonationBookPublishDate(String donationBookPublishDate) {
        this.donationBookPublishDate = donationBookPublishDate;
    }

    public String getDonationReason() {
        return donationReason;
    }

    public void setDonationReason(String donationReason) {
        this.donationReason = donationReason;
    }

    @Override
    public String toString() {
        return "DonationBook{" +
                "donationCode='" + donationCode + '\'' +
                ", donationStatus='" + donationStatus + '\'' +
                ", donationDate=" + donationDate +
                ", donationUserId='" + donationUserId + '\'' +
                ", donationUserName='" + donationUserName + '\'' +
                ", donationUserPhone='" + donationUserPhone + '\'' +
                ", donationUserEmail='" + donationUserEmail + '\'' +
                ", donationCategory='" + donationCategory + '\'' +
                ", donationBookName='" + donationBookName + '\'' +
                ", donationBookPublisher='" + donationBookPublisher + '\'' +
                ", donationBookPublishDate='" + donationBookPublishDate + '\'' +
                ", donationReason='" + donationReason + '\'' +
                '}';
    }
}

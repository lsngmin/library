package com.library.rental.model;

public class RentalVO {
    private String rentalUserId;
    private String rentalBookCode;

    public String getRentalUserId() {
        return rentalUserId;
    }

    public void setRentalUserId(String rentalUserId) {
        this.rentalUserId = rentalUserId;
    }

    public String getRentalBookCode() {
        return rentalBookCode;
    }

    public void setRentalBookCode(String rentalBookCode) {
        this.rentalBookCode = rentalBookCode;
    }

    public String getRentalStartDate() {
        return rentalStartDate;
    }

    public void setRentalStartDate(String rentalStartDate) {
        this.rentalStartDate = rentalStartDate;
    }

    public String getRentalEndDate() {
        return rentalEndDate;
    }

    public void setRentalEndDate(String rentalEndDate) {
        this.rentalEndDate = rentalEndDate;
    }

    public boolean isRentalExtension() {
        return rentalExtension;
    }

    public String getRentalCode() {
        return rentalCode;
    }

    public void setRentalCode(String rentalCode) {
        this.rentalCode = rentalCode;
    }

    public void setRentalExtension(boolean rentalExtension) {
        this.rentalExtension = rentalExtension;
    }

    private String rentalStartDate;
    private String rentalEndDate;
    private boolean rentalExtension;
    private String rentalCode;
}

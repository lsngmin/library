package com.library.book.model;

public class BookVO {
    private String bookCode;
    private String bookName;
    private String bookPublisher;
    private String bookPublishDate;
    private String bookAuthor;
    private String bookQuantity;
    private String bookPrice;
    private String bookCategory;
    private String bookLocation;
    private String bookDecription;
    private String bookStatus;
    private String bookPage;
    private String bookImageSrc;
    private int borrowCount;


    public String getBookCode() {
        return bookCode;
    }

    public void setBookCode(String bookCode) {
        this.bookCode = bookCode;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookPublisher() {
        return bookPublisher;
    }

    public void setBookPublisher(String bookPublisher) {
        this.bookPublisher = bookPublisher;
    }

    public String getBookPublishDate() {
        return bookPublishDate;
    }

    public void setBookPublishDate(String bookPublishDate) {
        this.bookPublishDate = bookPublishDate;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookQuantity() {
        return bookQuantity;
    }

    public void setBookQuantity(String bookQuantity) {
        this.bookQuantity = bookQuantity;
    }

    public String getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(String bookPrice) {
        this.bookPrice = bookPrice;
    }

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
    }

    public String getBookLocation() {
        return bookLocation;
    }

    public void setBookLocation(String bookLocation) {
        this.bookLocation = bookLocation;
    }

    public String getBookDecription() {
        return bookDecription;
    }

    public void setBookDecription(String bookDecription) {
        this.bookDecription = bookDecription;
    }

    // 추가할 getter/setter
    public String getBookStatus() {
        return bookStatus;
    }

    public void setBookStatus(String bookStatus) {
        this.bookStatus = bookStatus;
    }

    public String getBookPage() {
        return bookPage;
    }

    public void setBookPage(String bookPage) {
        this.bookPage = bookPage;
    }

    public String getBookImageSrc() {
        return bookImageSrc;
    }

    public void setBookImageSrc(String bookImageSrc) {
        this.bookImageSrc = bookImageSrc;
    }

    public int getBorrowCount() {
        return borrowCount;
    }

    public void setBorrowCount(int borrowCount) {
        this.borrowCount = borrowCount;
    }
}

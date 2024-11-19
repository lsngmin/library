package com.library.notice.model;

import java.util.Date;

public class NoticeVO {

    private String cnt; // 게시물 ID (Primary Key)
    private String category; // 카테고리
    private String title; // 제목
    private String writer; // 작성자 이름
    private String writerId; // 작성자 ID
    private String content; // 내용
    private Date date; // 작성 날짜

    // Getters and Setters
    public String getCnt() {
        return cnt;
    }

    public void setCnt(String cnt) {
        this.cnt = cnt;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getWriterId() {
        return writerId;
    }

    public void setWriterId(String writerId) {
        this.writerId = writerId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "NoticeBoardVO{" +
                "cnt='" + cnt + '\'' +
                ", category='" + category + '\'' +
                ", title='" + title + '\'' +
                ", writer='" + writer + '\'' +
                ", writerId='" + writerId + '\'' +
                ", content='" + content + '\'' +
                ", date=" + date +
                '}';
    }
}

package com.library.notice.service;

import com.library.notice.model.NoticeVO;

import java.util.List;

public interface NoticeService {
    void insertNotice(NoticeVO vo); // 공지사항 추가
    NoticeVO selectNotice(String cnt); // 특정 공지사항 조회
    List<NoticeVO> selectAllNotices(); // 모든 공지사항 조회
    void updateNotice(NoticeVO vo); // 공지사항 수정
    void deleteNotice(String cnt); // 공지사항 삭제
}
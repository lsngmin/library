package com.library.model.notice;

public interface NoticeService {

    void insertNotice(NoticeVO vo);
    NoticeVO selectNotice(NoticeVO vo);
    void updateNotice(NoticeVO vo);
    void deleteNotice(NoticeVO vo);
}

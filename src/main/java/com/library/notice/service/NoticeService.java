package com.library.notice.service;

import com.library.notice.model.NoticeVO;

public interface NoticeService {

    void insertNotice(NoticeVO vo);
    NoticeVO selectNotice(NoticeVO vo);
    void updateNotice(NoticeVO vo);
    void deleteNotice(NoticeVO vo);
}

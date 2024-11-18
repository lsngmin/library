package com.library.model.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeDAO noticeDAO;

    @Override
    public void insertNotice(NoticeVO vo) {
        noticeDAO.insertNotice(vo);
    }

    @Override
    public NoticeVO selectNotice(NoticeVO vo) {
        return noticeDAO.selectNotice(vo);
    }

    @Override
    public void updateNotice(NoticeVO vo) {
        noticeDAO.updateNotice(vo);
    }

    @Override
    public void deleteNotice(NoticeVO vo) {
        noticeDAO.deleteNotice(vo);
    }
}

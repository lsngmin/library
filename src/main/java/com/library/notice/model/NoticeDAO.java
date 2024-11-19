package com.library.notice.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {

    private SqlSessionTemplate mybatis;

    public void insertNotice(NoticeVO vo) {
        mybatis.insert("NoticeDAO.insertNotice", vo);
    }

    public NoticeVO selectNotice(NoticeVO vo) {
        return mybatis.selectOne("NoticeDAO.selectNotice", vo);
    }

    public void updateNotice(NoticeVO vo) {
        mybatis.update("NoticeDAO.updateNotice", vo);
    }

    public void deleteNotice(NoticeVO vo) {
        mybatis.delete("NoticeDAO.deleteNotice", vo);
    }
}

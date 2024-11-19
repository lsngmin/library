package com.library.notice.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NoticeDAO{

    @Autowired
    private SqlSessionTemplate mybatis;

    // 공지사항 추가
    public void insertNotice(NoticeVO vo) {
        mybatis.insert("NoticeDAO.insertNotice", vo);
    }

    // 특정 공지사항 조회
    public NoticeVO selectNotice(String cnt) {
        return mybatis.selectOne("NoticeDAO.selectNotice", cnt);
    }

    // 모든 공지사항 조회
    public List<NoticeVO> selectAllNotices() {
        return mybatis.selectList("NoticeDAO.selectAllNotices");
    }

    // 공지사항 수정
    public void updateNotice(NoticeVO vo) {
        mybatis.update("NoticeDAO.updateNotice", vo);
    }

    // 공지사항 삭제
    public void deleteNotice(String cnt) {
        mybatis.delete("NoticeDAO.deleteNotice", cnt);
    }
}

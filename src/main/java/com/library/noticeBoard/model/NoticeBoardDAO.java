package com.library.noticeBoard.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NoticeBoardDAO {

    @Autowired
    private SqlSessionTemplate mybatis;

    // Insert NoticeBoard
    public void insertNoticeBoard(NoticeBoardVO vo) {
        mybatis.insert("NoticeBoardDAO.insertNoticeBoard", vo);
    }

    // Retrieve NoticeBoard by cnt
    public NoticeBoardVO getNoticeBoardByCnt(String cnt) {
        return mybatis.selectOne("NoticeBoardDAO.getNoticeBoardByCnt", cnt);
    }

    // Update NoticeBoard
    public void updateNoticeBoard(NoticeBoardVO vo) {
        mybatis.update("NoticeBoardDAO.updateNoticeBoard", vo);
    }

    // Delete NoticeBoard
    public void deleteNoticeBoard(String cnt) {
        mybatis.delete("NoticeBoardDAO.deleteNoticeBoard", cnt);
    }

    // Retrieve All NoticeBoards
    public List<NoticeBoardVO> getAllNoticeBoards() {
        return mybatis.selectList("NoticeBoardDAO.getAllNoticeBoards");
    }
}
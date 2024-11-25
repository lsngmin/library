package com.library.noticeBoard.service;

import com.library.noticeBoard.model.NoticeBoardVO;

import java.util.List;

public interface NoticeBoardService {
    void insertNoticeBoard(NoticeBoardVO vo);
    NoticeBoardVO getNoticeBoardByCnt(String cnt);
    void updateNoticeBoard(NoticeBoardVO vo);
    void deleteNoticeBoard(String cnt);
    List<NoticeBoardVO> getAllNoticeBoards();
}

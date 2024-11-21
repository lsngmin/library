package com.library.noticeBoard.service;
import com.library.noticeBoard.model.NoticeBoardDAO;
import com.library.noticeBoard.model.NoticeBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

    @Autowired
    private NoticeBoardDAO noticeBoardDAO;

    @Override
    public void insertNoticeBoard(NoticeBoardVO vo) {
        noticeBoardDAO.insertNoticeBoard(vo);
    }

    @Override
    public NoticeBoardVO getNoticeBoardByCnt(String cnt) {
        return noticeBoardDAO.getNoticeBoardByCnt(cnt);
    }

    @Override
    public void updateNoticeBoard(NoticeBoardVO vo) {
        noticeBoardDAO.updateNoticeBoard(vo);
    }

    @Override
    public void deleteNoticeBoard(String cnt) {
        noticeBoardDAO.deleteNoticeBoard(cnt);
    }

    @Override
    public List<NoticeBoardVO> getAllNoticeBoards() {
        return noticeBoardDAO.getAllNoticeBoards();
    }
}
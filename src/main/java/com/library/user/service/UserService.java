package com.library.user.service;

import com.library.user.model.UserVO;
import java.util.List;

public interface UserService {
    void insertUser(UserVO vo);

    UserVO getLoginUser(UserVO vo);
    public int getTotalUser();

    UserVO SelectSearchUser(UserVO vo);

    List<UserVO> getUserList(int page, int size);
    List<UserVO> searchUsers(UserVO searchVO, int page, int size);
    int getTotalSearchResults(UserVO searchVO);

}

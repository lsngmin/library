package com.library.user.service;

import com.library.user.model.UserVO;

public interface UserService {
    void insertUser(UserVO vo);

    UserVO getLoginUser(UserVO vo);
    public int getTotalUser();

    UserVO SelectSearchUser(UserVO vo);

    public void updateOverDueDate(UserVO vo)
            ;
    public void updateRentalAvailableM(String userId);
    public void updateRentalAvailableP(String userId);

    public void updateStatus(String userId);

}

package com.library.rental.service;

import com.library.rental.model.RentalVO;
import com.library.user.model.UserVO;

import java.util.List;
import java.util.Map;

public interface RentalService {
    public void insertRental(RentalVO vo);
    public List<Map<String, Object>> selectRentalList(RentalVO vo);
    public void deleteRental(String userId, String bookName);

}

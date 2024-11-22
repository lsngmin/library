package com.library.rental.service;

import com.library.rental.model.RentalDAO;
import com.library.rental.model.RentalVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("rentalService")
public class RentalServiceImpl implements RentalService {

    @Autowired
    private RentalDAO rentalDAO;

    @Override
    public void insertRental(RentalVO vo) {
        rentalDAO.insertRental(vo);
    }

    @Override
    public List<Map<String, Object>> selectRentalList(RentalVO vo) {
        return rentalDAO.selectRentalList(vo);
    }

    @Override
    public void deleteRental(String userId, String bookName) {
        rentalDAO.deleteRental(userId, bookName);
    }
}

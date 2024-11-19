package com.library.rental.service;

import com.library.rental.model.RentalDAO;
import com.library.rental.model.RentalVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("rentalService")
public class RentalServiceImpl implements RentalService {

    @Autowired
    private RentalDAO rentalDAO;

    @Override
    public void insertRental(RentalVO vo) {
        rentalDAO.insertRental(vo);
    }
}

package com.library.admin.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDAO adminDAO;
    @Override
    public void insertAdmin(AdminVO vo) {

    }
    @Override
    public AdminVO selectAdmin(AdminVO vo) {
        return adminDAO.selectAdmin(vo) ;
    }

    @Override
    public void updateAdmin(AdminVO vo) {

    }

    @Override
    public void deleteAdmin(AdminVO vo) {

    }
}

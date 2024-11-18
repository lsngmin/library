package com.library.admin.model;

public interface AdminService {
    void insertAdmin(AdminVO vo);
    AdminVO selectAdmin(AdminVO vo);
    void updateAdmin(AdminVO vo);
    void deleteAdmin(AdminVO vo);
}

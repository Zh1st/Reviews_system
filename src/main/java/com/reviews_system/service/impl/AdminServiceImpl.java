package com.reviews_system.service.impl;

import com.reviews_system.dao.AdminDao;
import com.reviews_system.domain.Admin;
import com.reviews_system.service.AdminService;
import org.springframework.dao.EmptyResultDataAccessException;

public class AdminServiceImpl implements AdminService {
    private AdminDao adminDao;

    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

//    管理员登录
    @Override
    public Admin login(String user_name, String user_password) {
        try {
            Admin admin=adminDao.findByUsernameAndPassword(user_name,user_password);
            return admin;
        }catch (EmptyResultDataAccessException e){
            return null;
        }
    }
}

package com.reviews_system.service.impl;

import com.reviews_system.dao.AdminDao;
import com.reviews_system.domain.Admin;
import com.reviews_system.domain.User;
import com.reviews_system.service.AdminService;
import entity.PageResult;
import org.springframework.dao.EmptyResultDataAccessException;

import java.util.List;

public class AdminServiceImpl implements AdminService {
    private AdminDao adminDao;

    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

//    管理员登录
    @Override
    public Admin login(String admin_name, String admin_password) {
        try {
            Admin admin=adminDao.findByUsernameAndPassword(admin_name,admin_password);
            return admin;
        }catch (EmptyResultDataAccessException e){
            return null;
        }
    }

    @Override
    public List<Admin> list() {
        List<Admin>adminList=adminDao.findAll();
        return adminList;
    }

    @Override
    public Integer save(Admin admin) {
        return adminDao.save(admin);
    }

    @Override
    public void delById(int id) {
        adminDao.delById(id);
    }

    @Override
    public Admin selectById(int id) {
        Admin admin=adminDao.selectById(id);
        return admin;
    }

    @Override
    public int updateAdmin(Admin admin) {
        int i=adminDao.updateAdmin(admin);
        return i;
    }

    @Override
    public PageResult search(Admin admin, Integer pageNum, Integer pageSize) {
        return null;
    }

    @Override
    public List<Admin> selectByName(String admin_name) {
        List<Admin>adminList=adminDao.selectByName(admin_name);
        return adminList;
    }

    @Override
    public int delByIds(int[] ids) {
        int i=adminDao.delByIds(ids);
        return i;
    }
}

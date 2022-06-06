package com.reviews_system.service;

import com.reviews_system.domain.Admin;
import com.reviews_system.domain.Category;
import entity.PageResult;

import java.util.List;

public interface AdminService {
    Admin login(String admin_name,String admin_password);

    List<Admin> list();

    Integer save(Admin admin);

    void delById(int id);

    Admin selectById(int id);

    int updateAdmin(Admin admin);

    PageResult search(Admin admin, Integer pageNum, Integer pageSize);

    List<Admin> selectByName(String admin_name);

    int delByIds(int[]ids);

    Integer selectAdminCount();

    List<Admin> listByPage(Integer start, Integer end);
}

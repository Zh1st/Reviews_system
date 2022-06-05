package com.reviews_system.dao;

import com.github.pagehelper.Page;
import com.reviews_system.domain.Admin;
import com.reviews_system.domain.Category;
import com.reviews_system.domain.User;

import java.util.List;

public interface AdminDao {
    Admin findByUsernameAndPassword(String admin_name,String admin_password);

    List<Admin> findAll();


    Integer save(Admin admin);

    void delById(int id);

    Admin selectById(int id);

    int updateAdmin(Admin admin);

    Page<Admin> search(Admin admin);

    List<Admin> selectByName(String admin_name);

    int delByIds(int[]ids);

    Integer selectAdminCount();

    List<Admin> listByPage(Integer start, Integer end);
}

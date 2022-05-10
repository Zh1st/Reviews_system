package com.reviews_system.service.impl;

import com.github.pagehelper.Page;
import com.reviews_system.dao.UserDao;
import com.reviews_system.domain.User;
import com.reviews_system.service.UserService;
import entity.PageResult;
import com.github.pagehelper.PageHelper;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public List<User> list() {
        List<User>userList=userDao.findAll();
        return userList;
    }

    @Override
    public Integer save(User user) {
        return userDao.save(user);
    }

    @Override
    public void delById(int user_id) {
        userDao.delById(user_id);
    }

    @Override
    public User selectById(int user_id) {
        User user=userDao.selectById(user_id);
        return user;
    }

    @Override
    public int updateUser(User user) {
        int i=userDao.updateUser(user);
        return i;
    }

    @Override
    public PageResult search(User user, Integer pageNum, Integer pageSize) {
//        设置分页查询的参数，开始分页
//        PageHelper.startPage(pageNum,pageSize);
//        Page<User>page=userDao.search(user);
//        return new PageResult(page.getTotal(),page.getResult());
        return null;
    }

    @Override
    public List<User> selectByName(String user_name) {
        List<User>userList=userDao.selectByName(user_name);
        return userList;
    }

//    批量删除
    @Override
    public int delByIds(int[] ids) {
        int i=userDao.delByIds(ids);
        return i;
    }
}

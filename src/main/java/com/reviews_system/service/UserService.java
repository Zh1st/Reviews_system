package com.reviews_system.service;

import com.reviews_system.domain.Admin;
import com.reviews_system.domain.User;
import entity.PageResult;

import java.util.List;

public interface UserService {

    User login(String user_name, String user_password);

    List<User> list();

    Integer save(User user);

    void delById(int user_id);

    User selectById(int user_id);

    int updateUser(User user);

    PageResult search(User user, Integer pageNum, Integer pageSize);

    List<User> selectByName(String user_name);

    int delByIds(int[]ids);

    /**
     * 查询所有数据笔数
     * @return
     */
    public Integer selectUserCount();

    /**
     * 分页查询数据
     * @param start
     * @param end
     * @return
     */
    public List<User> listByPage(Integer start,Integer end);
}

package com.reviews_system.dao;

import com.github.pagehelper.Page;
import com.reviews_system.domain.Admin;
import com.reviews_system.domain.User;

import java.util.List;

public interface UserDao {

    User findByUsernameAndPassword(String user_name, String pass_word);

    List<User> findAll();


    Integer save(User user);

    void delById(int user_id);

    User selectById(int user_id);

    int updateUser(User user);

    Page<User>search(User user);

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

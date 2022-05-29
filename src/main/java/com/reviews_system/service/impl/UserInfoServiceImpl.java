package com.reviews_system.service.impl;

import com.reviews_system.dao.UserDao;
import com.reviews_system.dao.UserInfoDao;
import com.reviews_system.domain.Comment;
import com.reviews_system.domain.Film;
import com.reviews_system.domain.User;
import com.reviews_system.service.UserInfoService;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class UserInfoServiceImpl implements UserInfoService {
    private UserInfoDao userInfoDao;

    public void setUserInfoDao(UserInfoDao userInfoDao) {
        this.userInfoDao = userInfoDao;
    }

    @Override
    public User selectById(int user_id) {
        User user= userInfoDao.selectById(user_id);
        return user;
    }

    @Override
    public List<Comment> selectCommentByUserID(int user_id) {
        List<Comment> commentList=userInfoDao.selectCommentByUserID(user_id);
        return commentList;
    }

    @Override
    public String findFilmNameById(int film_id) {
        String fimlName=userInfoDao.findFilmNameById(film_id);
        return fimlName;
    }
}

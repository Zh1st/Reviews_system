package com.reviews_system.dao.impl;

import com.reviews_system.dao.UserInfoDao;
import com.reviews_system.domain.Comment;
import com.reviews_system.domain.Film;
import com.reviews_system.domain.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;


public class UserInfoDaoImpl implements UserInfoDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public User selectById(int user_id) {
        User user=jdbcTemplate.queryForObject("select * from user where user_id=?",new BeanPropertyRowMapper<User>(User.class),user_id);
        user.toString();
        return user;
    }

    @Override
    public List<Comment> selectCommentByUserID(int user_id) {
        String sql="select * from comment where user_id=? ORDER BY comment_time DESC";
        List<Comment>commentList=jdbcTemplate.query(sql,new BeanPropertyRowMapper<Comment>(Comment.class),user_id);
        return commentList;
    }

    @Override
    public String findFilmNameById(int film_id) {
        Film film=jdbcTemplate.queryForObject("select * from film where film_id=?",new BeanPropertyRowMapper<Film>(Film.class),film_id);
        String filmName=film.getFilm_name();
        return filmName;
    }
}

package com.reviews_system.dao.impl;

import com.reviews_system.dao.AdminDao;
import com.reviews_system.domain.Admin;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class AdminDaoImpl implements AdminDao {
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
//    登录
    @Override
    public Admin findByUsernameAndPassword(String user_name, String user_password) {
        Admin admin=jdbcTemplate.queryForObject("select * from admin where user_name=? and user_password=?",new BeanPropertyRowMapper<Admin>(Admin.class),user_name,user_password);
        return admin;
    }
}

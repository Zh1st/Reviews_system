package com.reviews_system.dao.impl;

import com.reviews_system.dao.OrderDao;
import com.reviews_system.domain.Order;
import org.springframework.jdbc.core.JdbcTemplate;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderDaolmpl implements OrderDao {
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public int save(Order order) {
        Integer i = jdbcTemplate.update("insert into order values (?,?,?,?)",null
        ,order.getUser_id()
        ,order.getSite_id()
        ,order.getFilm_id()
        ,order.getSite_id());
        return i;
    }
}

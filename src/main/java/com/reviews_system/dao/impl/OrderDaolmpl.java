package com.reviews_system.dao.impl;

import com.reviews_system.dao.OrderDao;
import com.reviews_system.domain.Order;
import com.reviews_system.domain.Orders;
import org.springframework.jdbc.core.JdbcTemplate;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderDaolmpl implements OrderDao {
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public int save(Orders orders) {
        Integer i = jdbcTemplate.update("insert into orders values (?,?,?,?)", null
        ,orders.getUser_id()
        ,orders.getFilm_id()
        ,orders.getSite_id());
        return i;
    }
}

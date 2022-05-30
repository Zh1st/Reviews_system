package com.reviews_system.dao.impl;

import com.reviews_system.dao.OrderDao;
import com.reviews_system.domain.Film;
import com.reviews_system.domain.Orders;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class OrderDaolmpl implements OrderDao {
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public int save(Orders orders,int[]site_ids) {
        SimpleDateFormat   formatter   =   new   SimpleDateFormat   ("yyyy-MM-dd");
        Date   curDate   =   new   Date(System.currentTimeMillis());//获取当前时间
        String   time   =   formatter.format(curDate);
        for (int site_id:site_ids) {
            Integer i = jdbcTemplate.update("insert into orders values (?,?,?,?,?)", null
                    ,orders.getUser_id()
                    ,orders.getFilm_id()
                    ,site_id
                    ,time);
        }

        return 0;
    }

    @Override
    public List<Orders> selectOrder() {
        SimpleDateFormat   formatter   =   new   SimpleDateFormat   ("yyyy-MM-dd");
        Date   curDate   =   new   Date(System.currentTimeMillis());//获取当前时间
        String   nowtime   =   formatter.format(curDate);
        nowtime = "'"+nowtime+"'";
        String sql = "select * from orders where time="+nowtime;
        List<Orders>ordersList=jdbcTemplate.query(sql,new BeanPropertyRowMapper<Orders>(Orders.class));
        return ordersList;
    }
}
